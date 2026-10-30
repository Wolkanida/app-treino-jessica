# 📱 APP DE TREINO — JESSICA PERSONAL

> Projeto: app de gestão de treinos para personal trainer + app do aluno.
> Também servirá como **TCC** da graduação em Sistemas de Informação (Estácio).

## 📂 Documentação do projeto

| Documento | O que tem |
|---|---|
| [01 — Visão do Produto](docs/01-visao-do-produto.md) | O problema, os usuários, a visão completa |
| [02 — Roadmap por Fases](docs/02-roadmap-fases.md) | O que será construído em cada fase + o que se aprende |
| [03 — Telas do App](docs/03-telas-do-app.md) | Desenho de todas as telas (professora e aluno) |
| [04 — Modelo do Banco de Dados](docs/04-modelo-do-banco.md) | Tabelas SQL completas, marcadas por fase |
| [05 — Plano de Estudos](docs/05-plano-de-estudos.md) | Rotina de estudo, recursos e como usar IA pra aprender |
| [06 — Diário de Bordo](docs/06-diario-de-bordo.md) | Onde paramos e o que fazer na próxima sessão |

## ⚡ Resumo executivo

- **Problema:** a Jessica gerencia alunos por caderno/WhatsApp/cabeça — perde tempo e se perde.
- **Solução em duas frentes:**
  1. **App da Professora** — login, lista de alunos, ficha completa (treinos, medidas, esforço, pagamentos, lembrete de troca de treino), vídeos dos exercícios
  2. **App do Aluno** — login próprio, treino do dia, marcar treino feito, percepção de esforço, frases motivacionais, plano mensal + Pix com comprovante
- **Stack:** Flutter (app) + Supabase (login, banco PostgreSQL, storage de vídeos)
- **Público:** aulas individuais de personal (~10–30 alunos ativos)
- **Pagamento:** Pix manual — aluno envia comprovante, professora confirma

## 🎯 Estado atual

- [x] Discussão de visão (entrevista com o "dono do produto" 😄)
- [x] Documentação estruturada
- [ ] **Fase 0: setup do ambiente** ← estamos aqui
- [ ] Fase 1: login + lista de alunos
- [ ] Fase 2: treinos + exercícios com vídeo
- [ ] ...ver roadmap completo

## 📌 Decisões registradas (reunião de escopo)

1. Chat em tempo real **existe na visão**, mas fica pro final do roadmap (WhatsApp resolve por enquanto — é o "diferencial de TCC" na Fase 7)
2. Pagamento é 100% **manual e sem integração financeira**: o app só mostra QR/Pix copia-e-cola (conta dela) + valor contratado + vencimento; o aluno paga no banco dele e envia o **print do comprovante** no app; a Jessica confirma → status "pago". Hoje isso acontece pelo WhatsApp e se perde — o app só organiza
3. MVP começa só com o **app da professora** (resolve a dor principal dela primeiro)
4. App do aluno entra na Fase 5; será avaliado se é o mesmo app (perfil ao logar) ou app separado
5. Vídeos ficam no Supabase Storage, **nunca** no banco de dados
6. Logo: Vitor já tem o desenho pronto — será integrado na Fase 1
7. **TCC: 2029** → sem pressa, construir com calma e aprender de verdade
8. Medidas/repetições no começo = **anotar e ver a evolução**, sem enfeite. Gráficos e relatórios avançados só depois de funcionar bem
9. Público: aulas individuais, ~10–30 alunos ativos → infra simples e barata (plano grátis do Supabase no começo)
