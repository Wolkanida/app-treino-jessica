# 04 — MODELO DO BANCO DE DADOS

> PostgreSQL (via Supabase). Marcação de fase: quando cada tabela entra no projeto.
> 💡 Este documento é o capítulo de TCC de modelagem — leia as explicações em cada bloco.

## Como ler isto (pro Vitor)

- **PK** = chave primária → o "CPF" da tabela, identifica a linha
- **FK** = chave estrangeira → o link de uma tabela pra outra ("este treino pertence a ESTE aluno")
- **N:N** = muitos-para-muitos → um treino tem vários exercícios e um exercício aparece em vários treinos → precisa de uma tabela do meio (`treino_exercicios`)

---

## Visão geral das relações

```
professora (1) ──── (N) alunos (1) ──── (N) treinos (1) ──── (N) treino_exercicios (N) ──── (1) exercicios
                          │
                          ├── (N) medidas                     [Fase 3]
                          ├── (N) pagamentos                  [Fase 4]
                          ├── (N) execucoes_treino             [Fase 5]
                          └── (N) mensagens                    [Fase 7]
alunos (N) ──── (1) planos                                        [Fase 6]
```

## Diagrama simplificado (tabela do meio)

O segredo do banco inteiro: **a tabela `treino_exercicios` une treino e exercício** e guarda as informações daquele casamento (séries, reps, carga). Isso é o famoso **N:N** que a faculdade ensina no papel — aqui ele é real.

---

## Tabelas (SQL)

### 🟢 Fase 1 — Alunos

```sql
-- Perfis: estende o usuário do login (o Supabase cria o login, a gente guarda os dados extras)
perfis (
  id UUID PK,                      -- mesmo id do auth
  nome TEXT NOT NULL,
  tipo TEXT NOT NULL,              -- 'professora' | 'aluno'
  telefone TEXT,
  criado_em TIMESTAMPTZ DEFAULT now()
)

alunos (
  id UUID PK,
  nome TEXT NOT NULL,
  data_nascimento DATE,
  telefone TEXT,
  objetivo TEXT,                   -- hipertrofia, emagrecimento, condicionamento...
  restricoes TEXT,                 -- lesões, saúde (LGPD: sensível!)
  ativo BOOLEAN DEFAULT TRUE,
  aluno_user_id UUID,              -- futuro login do aluno (Fase 5), começa vazio
  criado_em TIMESTAMPTZ DEFAULT now()
)
```

### 🟢 Fase 2 — Exercícios e Treinos

```sql
exercicios (
  id UUID PK,
  nome TEXT NOT NULL,
  grupo_muscular TEXT,             -- peito, costas, pernas...
  video_url TEXT,                  -- link do vídeo no STORAGE (não o vídeo!)
  descricao TEXT,
  criado_em TIMESTAMPTZ DEFAULT now()
)

treinos (
  id UUID PK,
  aluno_id UUID FK → alunos,       -- um aluno tem vários treinos
  nome TEXT,                       -- "Treino A", "Ficha Novembro"
  observacao TEXT,
  ativo BOOLEAN DEFAULT TRUE,      -- treino antigo: ativo = FALSE (histórico)
  criado_em TIMESTAMPTZ DEFAULT now()
)

treino_exercicios (                -- ← a tabela do meio (N:N)
  id UUID PK,
  treino_id UUID FK → treinos,
  exercicio_id UUID FK → exercicios,
  series INT,
  repeticoes TEXT,                 -- "8-10" (texto, porque é intervalo)
  carga TEXT,                      -- "20kg" ou "a definir"
  ordem INT,                       -- ordem de execução
  observacao TEXT
)
```

### 🟢 Fase 3 — Medidas e Esforço

```sql
medidas (
  id UUID PK,
  aluno_id UUID FK → alunos,
  data DATE NOT NULL,
  peso NUMERIC(5,2),               -- 999.99 → até 999kg, 2 casas
  cintura NUMERIC(5,2),
  braco_direito NUMERIC(5,2),
  braco_esquerdo NUMERIC(5,2),
  peito NUMERIC(5,2),
  coxa NUMERIC(5,2),
  observacao TEXT
)
-- percepção de esforço fica registrada em `execucoes_treino` (Fase 5),
-- mas professora já pode anotar manualmente por aqui numa observação se quiser
```

### 🟢 Fase 4 — Pagamentos (100% manual — sem integração com banco)

```sql
planos (
  id UUID PK,
  nome TEXT NOT NULL,              -- "Premium", "Turbinado"...
  valor_mensal NUMERIC(10,2),      -- valor contratado
  chave_pix TEXT                   -- copia-e-cola/QR da conta da professora
)
-- fluxo: app mostra QR → aluno paga no PRÓPRIO banco → envia print no app → professora confirma

alunos.plano_id UUID FK → planos   -- campo adicionado na Fase 6

pagamentos (
  id UUID PK,
  aluno_id UUID FK → alunos,
  competencia TEXT NOT NULL,       -- "2026-11" (ano-mês)
  valor NUMERIC(10,2),
  status TEXT NOT NULL DEFAULT 'pendente',  -- pendente | pago
  comprovante_url TEXT,            -- imagem no Storage
  pago_em DATE,
  criado_em TIMESTAMPTZ DEFAULT now()
)
```

### 🟢 Fase 5 — Execuções de treino (o aluno usando)

```sql
execucoes_treino (
  id UUID PK,
  treino_id UUID FK → treinos,
  aluno_id UUID FK → alunos,
  data DATE NOT NULL,
  concluido BOOLEAN DEFAULT TRUE,
  esforco INT,                     -- 1 a 10 (percepção de esforço)
  observacao TEXT
)
-- é daqui que saem: "treino de hoje feito ✅", calendário da semana, alerta de treino velho
```

### 🔵 Fase 7 — Chat e Frases

```sql
mensagens (
  id UUID PK,
  aluno_id UUID FK → alunos,
  enviada_por TEXT NOT NULL,       -- 'professora' | 'aluno'
  conteudo TEXT NOT NULL,
  lida BOOLEAN DEFAULT FALSE,
  criada_em TIMESTAMPTZ DEFAULT now()
)

frases_motivacionais (
  id UUID PK,
  texto TEXT NOT NULL,
  autor TEXT
)
```

---

## 🔒 Segurança (RLS — Row Level Security)

Regra de ouro desde a Fase 1: **o banco responde "não" sozinho quando alguém tenta ver o que não é dela.**

- Fase 1–4: só o login da professora lê/escreve tudo
- Fase 5: aluno só vê `treinos`, `execucoes_treino`, `pagamentos` (os dele), `mensagens` (as dele) — o banco filtra por `aluno_user_id = auth.uid()` sem depender do app
- Testar tentando "invadir" (pedir dados de outro aluno → tem que voltar vazio)

## 🧹 Boas práticas que serão aplicadas

- `criado_em` com `now()` automático em tudo (histórico gratuito)
- Excluir de verdade? **Não** → `ativo = FALSE` (soft delete: nunca apagar histórico de aluno — LGPD pede cuidado, e a professora pode reativar)
- Vídeo/comprovante/imagem → SEMPRE Storage, o banco guarda só a URL
- Backup: export SQL do Supabase 1x/mês
