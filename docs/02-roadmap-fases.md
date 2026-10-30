# 02 — ROADMAP POR FASES

> Cada fase: **entrega algo que funciona** + **ensina uma habilidade real**.
> Ritmo: 45–60 min/dia, 5–6 dias/semana (rotina de plantão). Prazo-alvo por fase é estimativa, não cobrança — plantão bagunça cronograma e está tudo bem.

## 📊 Visão geral

| Fase | O que entrega | Habilidade/Matéria |
|---|---|---|
| 0 | Ambiente pronto + primeiro commit | Git, terminal, organização de projeto |
| 1 | Login da professora + lista de alunos | Dart básico, navegação entre telas, Auth |
| 2 | Treinos + exercícios **com vídeo** | Banco de dados (o coração do app!) |
| 3 | Medidas + percepção de esforço + lembrete de troca | Gráficos, cálculo de data, listas |
| 4 | Pagamentos (Pix + comprovante + status) | Upload de arquivo, lógica de status |
| 5 | **App do aluno**: treino do dia + marcar feito | Nova perspectiva de usuário, mesmo banco |
| 6 | Plano do aluno + QR Pix + comprovante | Reaproveitamento de código |
| 7 | Chat tempo real + frases motivacionais | Tempo real (diferencial de TCC) |
| 8 | Polish + publicar nas lojas + TCC | Deploy, documentação, apresentação |

---

## 🟢 FASE 0 — Setup (1 semana)
**Entrega:** projeto criado, rodando "Hello Jessica" no celular, no GitHub.

- Instalar Flutter SDK, VS Code + extensão Flutter, Android Studio
- Criar conta GitHub + primeiro repositório: `app-treino-jessica`
- Criar conta Supabase + primeiro projeto
- Rodar o app no celular do Vitor
- Primeiro commit + push

📚 **Aprende:** terminal, Git (add/commit/push), como um projeto é organizado em pastas

---

## 🟢 FASE 1 — Login + Lista de Alunos (2–3 semanas)
**Entrega:** a Jessica abre o app, loga, vê seus alunos e cadastra um novo.

- Tela de login (com o logo dela)
- Tela lista de alunos (nome, foto opcional, "ativo/inativo")
- Tela de cadastro/edição de aluno (nome, contato, objetivo, restrições)
- Autenticação via Supabase (só o login dela na v1)
- Logout

📚 **Aprende:** widgets Flutter (Column, ListView, TextField, ElevatedButton), navegação, **SQL: SELECT e INSERT**, auth

> 🏁 **Marco importante:** colocar no celular dela. Mesmo só com lista de alunos, ela já se organiza melhor.

---

## 🟢 FASE 2 — Treinos + Exercícios com Vídeo (3–4 semanas) ← fase mais importante
**Entrega:** a biblioteca de exercícios com vídeos + ficha de treino montável por aluno.

- Cadastrar exercício: nome, grupo muscular, descrição + **gravar/anexar vídeo**
- Vídeo salvo no Supabase Storage, link no banco
- Criar treino: aluno → "Treino A/B/C" → adicionar exercícios (séries, reps, carga, ordem)
- Ver ficha completa do treino na ficha do aluno
- Editar/excluir treinos e exercícios

📚 **Aprende:** relacionamentos no banco (1:N, N:N) — **a matéria de BD que travou na faculdade, aqui você entende de verdade**, upload de arquivo, player de vídeo

---

## 🟢 FASE 3 — Medidas, Esforço e Lembretes (2–3 semanas)
**Entrega:** ficha vira "prontuário": evolução visível.

- Registrar medidas (peso, braço, peito, cintura, coxa...) com data
- Gráfico simples de evolução
- Aluno marca percepção de esforço por treino (escala 1–10)
- **Lembrete automático**: "Treino A sem alteração há 6 semanas 🚨"

📚 **Aprende:** dados com data/timestamp, gráficos em Flutter, lógica de negócio (regra que pensa junto com a professora)

---

## 🟢 FASE 4 — Pagamentos (2 semanas)
**Entrega:** fim do comprovante perdido no WhatsApp.

⚠️ **SEM integração financeira** — o app não processa pagamento nenhum. Só organiza:
- Aba pagamentos na ficha: mês, valor contratado, status (pendente/pago/atrasado)
- Professora marca como pago OU confirma o **print do comprovante** enviado pelo aluno
- Histórico por aluno ("deve fevereiro?")
- Alerta na lista: ícone 🔴 pra aluno inadimplente

📚 **Aprende:** estados e status (enum), datas por mês, como transformar regra do mundo real em campo do banco

---

## 🟢 FASE 5 — APP DO ALUNO: treino do dia (3–4 semanas)
**Entrega:** o aluno baixa o app, loga, vê o treino dele.

- Login próprio do aluno (vinculado à conta da professora)
- **Treino do dia** logo na primeira tela
- Ver exercício + vídeo
- Marcar treino como **feito** ✅
- Percepção de esforço (caixinhas 1–10)
- Treino da semana / do mês

📚 **Aprende:** mesma base, outro usuário — você vai entender **RLS (Row Level Security)** de verdade: "o aluno só enxerga os dados DELE"

---

## 🟢 FASE 6 — Plano + Pix do Aluno (2 semanas)
**Entrega:** aluno vê o plano, paga no banco dele e manda o print — tudo organizado no app.

- Aba plano: nome do plano, **valor contratado**, vencimento
- QR Code Pix / copia-e-cola (o número da conta dela, configurável)
- Aluno paga no PRÓPRIO banco (fora do app) e envia o **print do comprovante** no app
- Professora confirma → status muda pra "pago"

📚 **Aprende:** geração de QR Code, reaproveitamento do upload da Fase 4 (código bom se reaproveita!)

---

## 🔵 FASE 7 — Chat em tempo real + Frases (3–4 semanas) — "diferencial de TCC"
**Entrega:** o aluno tira dúvida dentro do app; frase motivacional na abertura.

- Chat professora ↔ aluno (mensagens em tempo real via Supabase Realtime)
- Notificação de nova mensagem
- Tela de abertura com frase do dia (banco de frases, rotativa)

📚 **Aprende:** tempo real (WebSockets/Realtime), notificações push — conteúdo avançado que brilha num TCC

---

## 🔵 FASE 8 — Publicação + TCC (contínuo, até 2029)
- Publicar na Play Store (Apple Store é opcional — tem custo anual de dev)
- Termos de uso + política de privacidade (LGPD)
- Monografar: documentar cada fase (esses .md viram capítulos do TCC!)
- Apresentação

> 💡 **O TCC já está sendo escrito agora:** cada documento desta pasta, cada decisão registrada, é material pronto pra monografia (levantamento de requisitos, metodologia, modelagem, resultados).

---

## ⚠️ Regras de proteção do projeto (pro você não desistir no caminho)

1. **Uma fase por vez.** Terminou, testou no celular da Jessica, comemorou. Só então a próxima.
2. **Se travar 2 dias no mesmo bug → pergunta.** Não é fraqueza, é eficiência.
3. **Todo dia termina com `git commit`** (mesmo que pequeno) — o GitHub vira seu diário de bordo e portfólio.
4. **Plantão bagunçou a semana?** Fase não atrasa, ela espera. O projeto não tem prazo apertado até 2029.
