# Localização – App Android

**Autores:** Veronica Ferreira, Juan Martin Mosegui e Santiago Escobar  
**Curso:** 5º semestre de Análise e Desenvolvimento de Sistemas  
**Disciplina:** Programação Mobile II

## 🎯 Resumo
Aplicativo Android focado em **localização** e navegação simples. A proposta é permitir que o usuário visualize e acompanhe pontos de interesse no mapa, com uma interface direta e responsiva.

> Este repositório contém o código-fonte do app, instruções de execução e um vídeo demonstrativo.

## 🎬 Demo em Vídeo
> Quando você enviar o vídeo para o repositório, adicione o link abaixo (ou o arquivo em `docs/demo.mp4`).

- **Assista ao demo:** _adicione aqui o link do vídeo (por exemplo, `docs/demo.mp4` ou a URL no Git do projeto)._

## ⚙️ Requisitos
- **Android Studio** (versão recente)
- **JDK 17** (ou compatível com sua versão do Android Gradle Plugin)
- **SDK Android** instalado (emulador ou dispositivo físico com depuração USB)

## 🚀 Como Executar
1. **Clone** o repositório:
   ```bash
   git clone <URL-do-seu-repo>
   cd <pasta-do-projeto>
   ```
2. **Abra no Android Studio**: `File → Open...` e selecione a pasta do projeto.
3. **Sincronize** o Gradle: aguarde a sincronização completar.
4. **Execute**:
   - No menu superior, selecione um dispositivo/emulador e clique em **Run ▶** (Shift + F10).
   - Alternativamente, via terminal:
     ```bash
     ./gradlew assembleDebug
     ./gradlew installDebug
     ```

## 🧩 Alterar Ícone (já aplicado neste commit)
Os assets foram gerados em `app/src/main/res/mipmap-*` como:
- `ic_launcher.png`
- `ic_launcher_round.png`

E referenciados no `AndroidManifest.xml`:
```xml
<application
    android:icon="@mipmap/ic_launcher"
    android:roundIcon="@mipmap/ic_launcher_round" />
```

## 📂 Estrutura (parcial)
```
app/
  src/
    main/
      AndroidManifest.xml
      res/
        mipmap-mdpi/
        mipmap-hdpi/
        mipmap-xhdpi/
        mipmap-xxhdpi/
        mipmap-xxxhdpi/
```

## 📝 Licença e Autoria
Este projeto foi desenvolvido por **Veronica Ferreira**, **Juan Martin Mosegui** e **Santiago Escobar** como parte da avaliação da disciplina **Programação Mobile II** (5º semestre de **Análise e Desenvolvimento de Sistemas**).
