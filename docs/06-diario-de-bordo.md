# 📓 DIÁRIO DE BORDO — onde paramos

> Última sessão: 28/10/2026 — Fase 0 em andamento
> Status: **ambiente 80% montado** 🎉

## ✅ Sessão 2 (28/10/2026) — Fase 0

Instalado com sucesso (tudo pelo winget/terminal, instalador oficial):
- [x] **Git 2.56** (o "mensageiro" entre o PC e o GitHub)
- [x] **VS Code 1.143** (onde o Vitor vai escrever o código)
- [x] **Flutter SDK 3.47.8** em `C:\dev\flutter` + adicionado ao PATH (baixado ZIP oficial de 1.8GB — caiu no meio e aprendemos a retomar download com curl!)
- [x] **Android Studio 2026.2.1.8**
- [x] `flutter doctor` executado → Flutter ✅ / Android SDK ainda falta (normal)

## ▶️ PENDÊNCIAS (nesta ordem)

1. **Vitor abre o Android Studio** (Menu Iniciar) e segue o assistente de primeira abertura:
   - "Do not import settings" → OK
   - Setup Wizard → tipo **Standard** → aceitar licenças → Finish
   - Ele vai baixar o SDK sozinho (~2-3 GB, pode demorar) — deixar rodando
2. **Vitor cria o repositório no GitHub** (pela web):
   - github.com → login → "+" → New repository
   - Nome: `app-treino-jessica` → **Público** → **NÃO** marcar "Add README" → Create
   - Repositório vazio mesmo — vamos empurrar nossos arquivos pra ele
3. **Próxima sessão com o professor:**
   - `flutter doctor` de novo (Android SDK deve ficar ✅)
   - `flutter doctor --android-licenses` (aceitar licenças Android pelo terminal)
   - Configurar identidade Git (`git config --global user.name / user.email`)
   - Criar pasta `C:\dev\app-treino-jessica`, copiar os docs do projeto pra lá
   - `git init` + **primeiro commit** + push pro GitHub 🎉
   - Criar conta Supabase (se der tempo)

## 📌 Configurações do PC do Vitor (referência)

- Windows 11 (25H2), 230 GB livres
- Git em `C:\Program Files\Git`
- Flutter em `C:\dev\flutter\bin` (já no PATH do usuário)
- Downloads: `C:\Users\draga\Downloads\flutter_sdk.zip` (1.8 GB — **pode apagar** depois pra liberar espaço)

## 💡 Lembretes

- Visual Studio (C++) do flutter doctor: **ignorar**, não é preciso pro app Android
- Chrome ✅ no doctor → dá pra testar o app no navegador durante o desenvolvimento
- Continuar Guanabara mundo 2 (for/while)
- Perguntar à Jessica sobre o caderno dela + mandar o logo
