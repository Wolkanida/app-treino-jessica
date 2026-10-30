# 01 — VISÃO DO PRODUTO

> "Se você não sabe pra onde está indo, qualquer caminho serve." — Lewis Carroll (e isso NÃO serve pra software 😄)

## 🎯 O Problema

A Jessica dá aulas individuais de personal training com público diversificado (mulheres, idosos, jovens). Hoje ela gerencia tudo assim:

| Como faz hoje | Dor que causa |
|---|---|
| Anota treinos **na cabeça** | Se perde com os alunos, esquece detalhes |
| **Caderno** de anotações | Demora pra achar a ficha do aluno, toma tempo |
| **WhatsApp** pra comunicação e comprovantes de Pix | Comprovante perdido no meio dos chats, sem histórico organizado |
| Medidas anotadas **de forma bem simples** | Evolução do aluno não fica visível, sem comparação histórica |

## 👥 Usuários

### 1. A Professora (Jessica)
- Usuária principal, usa o app diariamente nas aulas
- Precisa de: agilidade (consulta rápida durante a aula), organização, histórico

### 2. O Aluno
- Público diversificado: jovens, adultos, idosos
- Precisa de: simplicidade (telas poucas e claras), treino do dia na mão, vídeo do exercício na dúvida

## 🌟 A Visão Completa (o "destino final")

### App da Professora
1. Login com senha (logo dela na abertura)
2. Lista de alunos — visual moderno, clicar no nome abre a ficha
3. Ficha do aluno com abas:
   - **Treinos** — treinos feitos, histórico
   - **Medidas** — evolução (peso, braço, cintura...) com comparação temporal
   - **Esforço** — percepção de esforço reportada pelo aluno
   - **Pagamentos** — mensalidade em dia ou não
   - **Chat** — conversa em tempo real com o aluno (ou mensagem offline)
4. **Lembrete inteligente**: "esse treino já tem X semanas → hora de alterar"
5. Montar/alterar/excluir treinos por aluno
6. Cadastrar exercícios **com vídeo gravado** (a própria Jessica demonstrando)

### App do Aluno
1. Login próprio
2. Frase motivacional na abertura (atletas, filósofos, Denzel...)
3. **Treino do dia** logo de cara
4. Abas: treino da semana / do mês
5. Marcar treino como **feito** + caixas de **percepção de esforço**
6. Ver o vídeo do exercício (tira dúvida sozinho na academia)
7. Aba do plano: valor mensal + **QR Code Pix** + **envio de comprovante**

## 🚦 A Regra de Ouro: MVP primeiro

A visão acima é o **destino** (prazo: até o TCC em 2029). Mas o caminho é por camadas — cada uma funciona sozinha e já entrega valor:

```
[FASE 1-4] App da Professora  ← resolve a dor principal HOJE
[FASE 5-6] App do Aluno       ← depois que o dela estiver redondo
[FASE 7+]  Chat tempo real    ← o "diferencial de TCC" no fim
```

**Por quê?** Se o app do aluno tivesse problemas no dia 1, a Jessica perde a confiança no sistema inteiro. Primeiro ela ama o app dela, depois o aluno entra.

## 📌 Premissas e restrições

- Aulas **individuais** → poucos alunos simultâneos (~10–30), banco simples
- **Pix manual**: o app NÃO cobra automaticamente — só gera/ver o QR, recebe comprovante e registra pagamento (decisão de escopo, evita integração financeira complexa e custos)
- **LGPD**: dados de saúde (medidas, restrições) = dados sensíveis → segurança desde a Fase 1 (RLS no Supabase)
- Vídeos: ficam no **Supabase Storage** (só o link no banco) — nunca vídeo dentro do banco
- Desenvolvedor: Vitor, extremamente iniciante → **cada fase é também uma aula** (ver [02-roadmap-fases.md](02-roadmap-fases.md))
