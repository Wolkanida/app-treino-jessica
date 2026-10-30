# 03 — TELAS DO APP (esboço em texto)

> Desenho "de papel" das telas. Isso se chama **wireframe** — se faz ANTES de programar, pra não construir tela errada.
> Complementar depois com desenho real no Figma (gratuito) quando quiser.

---

## 🧑‍🏫 APP DA PROFESSORA

### T1 — Abertura/Login (Fase 1)
```
┌─────────────────────────────┐
│                             │
│        [ LOGO DELA ]        │
│                             │
│   ┌─────────────────────┐   │
│   │ E-mail              │   │
│   └─────────────────────┘   │
│   ┌─────────────────────┐   │
│   │ Senha            👁 │   │
│   └─────────────────────┘   │
│                             │
│   [    ENTRAR             ] │
│                             │
└─────────────────────────────┘
```

### T2 — Lista de Alunos (Fase 1) — tela inicial após login
```
┌─────────────────────────────┐
│ Meus Alunos        [+ Novo] │
│─────────────────────────────│
│ 👤 Maria Souza              │
│    Hipertrofia • Em dia ✅  │
│─────────────────────────────│
│ 👤 João Pereira             │
│    Condicionamento • 🔴     │
│    ⚠️ mensalidade atrasada  │
│─────────────────────────────│
│ 👤 Ana Lima (inativo)       │
│─────────────────────────────│
│      [ 📊 ] [ ⚙ ] [ Sair ]  │
└─────────────────────────────┘
```
**Ícones de status:** ✅ pago / 🔴 atrasado (Fase 4) / 🚨 treino antigo (Fase 3)

### T3 — Cadastro/Edição de Aluno (Fase 1)
```
┌─────────────────────────────┐
│ ← Novo Aluno                │
│ Nome*         [___________] │
│ Nascimento    [__/__/____]  │
│ Telefone     [___________]  │
│ Objetivo      (hipertrofia ▾)│
│ Restrições   [___________]  │
│    "lesão no joelho..."     │
│        [ SALVAR ]           │
└─────────────────────────────┘
```

### T4 — Ficha do Aluno (abas) (montada ao longo das Fases 2–4)
```
┌─────────────────────────────┐
│ ← Maria Souza    [✏️] [🗑]  │
│═════════════════════════════│
│ [Treinos][Medidas][Esforço] │
│ [Pagamentos]  (chat na F.7) │
│─────────────────────────────│
│ (conteúdo da aba aberta)    │
└─────────────────────────────┘
```

### T4a — Aba Treinos (Fase 2)
```
┌─────────────────────────────┐
│ Treino A  [aberto ▾]         │
│ ─ Treino de 6 semanas       │
│ ─ 🚨 Sem alteração há 7 sem │
│ ──────────────────────────  │
│ 1. Agachamento livre  4x10  │
│    20kg • [▶ vídeo]         │
│ 2. Leg press          4x12  │
│    60kg • [▶ vídeo]         │
│ ──────────────────────────  │
│ Última execução: 25/10 ✅    │
│                              │
│ [+ exercício] [novo treino]  │
└─────────────────────────────┘
```

### T5 — Biblioteca de Exercícios (Fase 2)
- Lista de todos os exercícios cadastrados (busca por nome/grupo)
- T6 — Detalhe: nome, grupo muscular, descrição, **vídeo (grava da câmera ou galeria)**
- Botões: editar / excluir (se não estiver em uso em treino)

### T4b — Aba Medidas (Fase 3)
```
┌─────────────────────────────┐
│ [+ nova medida]              │
│ 📈 Peso                     │
│ ago: 78kg → out: 74kg  ▼    │
│ 📈 Cintura                  │
│ ago: 90cm → out: 85cm ▼    │
└─────────────────────────────┘
```

### T4c — Aba Pagamentos (Fase 4)
```
┌─────────────────────────────┐
│ Out/2026   R$ 300  ✅ PAGO   │
│   📎 comprovante 03/10       │
│ Nov/2026   R$ 300  ⏳ PEND.  │
│ [+ registrar pagamento]      │
└─────────────────────────────┘
```

---

## 🏃 APP DO ALUNO

### A1 — Login (Fase 5)
Igual ao da professora, mas o app identifica o perfil e abre a tela certa (aluno ≠ professora, mesmo app? **Decisão:** pode ser o MESMO app — ao logar, ele direciona pra tela do perfil. Menos custo pra publicar. Avaliar na Fase 5).

### A2 — Abertura + Treino do Dia (Fase 5)
```
┌─────────────────────────────┐
│ "Sonhos sem metas são só    │
│  sonhos." — Denzel W.       │
│─────────────────────────────│
│ TREINO DE HOJE — Treino A   │
│ 1. Agachamento 4x10  [▶ vídeo]│
│    ☐ feito                   │
│ 2. Leg press 4x12  [▶ vídeo]│
│    ☐ feito                   │
│─────────────────────────────│
│ Como foi o esforço hoje?    │
│ 😴(1) 😐(4) 😅(6) 💪(8) 🔥(10)│
│─────────────────────────────│
│ Abas: [Hoje][Semana][Mês]    │
│       [Plano]               │
└─────────────────────────────┘
```

### A3 — Aba Semana/Mês (Fase 5)
- Calendário com dias ✅ (treino feito)
- Meta semanal: "3 de 4 treinos feitos"
- Histórico de esforço

### A4 — Aba Plano (Fase 6)
```
┌─────────────────────────────┐
│ Meu Plano: Premium           │
│ R$ 300/mês • vence dia 10    │
│─────────────────────────────│
│      [ QR CODE PIX ]         │
│  (conta da professora,       │
│   copiar código copia-e-cola)│
│  → aluno paga no PRÓPRIO banco│
│                              │
│ [+ enviar print do           │
│    comprovante 📎]            │
│  status: ⏳ aguardando conf.  │
└─────────────────────────────┘
```
> Nota: o app NÃO processa pagamento — só mostra o Pix, recebe o print e organiza o status.

### A5 — Chat com a Professora (Fase 7)
- Lista de mensagens + campo de texto
- Badge de não lida para a professora

---

## 🔍 Checklist por tela (o que toda tela precisa definir)

Antes de programar qualquer tela, responder:
1. Quem usa e quando?
2. De onde vêm os dados (qual tabela)?
3. O que acontece ao tocar em cada botão?
4. O que fazer quando dá erro/sem internet?
5. Precisa da internet sempre? (academia tem sinal ruim às vezes → pensar em "modo offline" só na Fase 8+)
