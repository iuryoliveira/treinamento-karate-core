# treinamento-karate

Projeto de testes de API utilizando o framework [Karate DSL](https://github.com/intuit/karate)

# Configurando ambiente - Instalação das ferramentas necessárias:
# 1. Java JDK 8
* [JDK 8 download](https://www.oracle.com/br/java/technologies/javase/javase8-archive-downloads.html).
* Selecione a opção de download do **JDK** conforme versão do seu Sistema Operacional (Mac OS x64, Windows 32 bits ou Windows 64 bits)

# 2. Configurar JAVA_HOME nas variáveis de ambiente
* Windows:
    * Criar uma Variável de Sistema com nome "JAVA_HOME" e valor "C:\Program Files\java\jdk1.8.0_22". Atente-se ao número da versão, pois pode ser alterado caso sua instalação tenha utilizado uma versão diferente da Jdk.
    * Adicionar JAVA_HOME à variável PATH nas Variáveis de Usuário "%JAVA_HOME%\bin"
* Mac OS: 
    * Iniciar o terminal
    * Executar o comando `cd ~`
    * Executar o comando `vi .bash_profile`
    * Ativar o modo de edição de texto teclando a letra `i`
    * Editar o arquivo para configurar as variáveis de ambiente. O arquivo deverá ficar da seguinte forma:
    ```
    export JAVA_HOME=`/usr/libexec/java_home`
    export PATH=$JAVA_HOME/bin:$PATH
    ```
    * Sair do modo de edição teclando `ESC`
    * Salvar o arquivo teclando `:wq` e pressionando enter

# 3. Maven
* Baixar a versão binária zipada do Maven (-bin.zip). [Download Maven](https://maven.apache.org/download.cgi)
* Extrair o zip baixado em alguma pasta de sua preferência. **Sugestão:** Pasta Documents do seu usuário no sistema

# 4. Adicionar o Maven nas variáveis de ambiente
* Windows: 
    * Adicionar o local da pasta extraída do Maven na variável de ambiente **PATH**, da seguinte forma: `C:\Users\nomeusuario\Documents\apache-maven-3.8.4\bin`. Adeque o diretório para que seja equivalente ao local onde foi feita a instalação do Maven (pasta do Zip extraído). Se atente também a versão do Maven, pois isso pode alterar o nome do diretório.
* Mac OS: 
    * Iniciar o terminal
    * Executar o comando `cd ~`
    * Executar o comando `vi .bash_profile`
    * Acrescentar as variáveis do Maven: <br />
    ```
    export JAVA_HOME=`/usr/libexec/java_home`
    export MAVEN_HOME=~/Documents/apache-maven-3.8.4
    export PATH=$JAVA_HOME/bin:$PATH
    export PATH=$MAVEN_HOME/bin:$PATH
    ```
    * Sair do modo de edição teclando `ESC`
    * Salvar o arquivo teclando `:wq` e pressionando enter

# 5. Git
* Windows:
    * Baixar e instalar o [Git bash](https://git-scm.com/downloads)
* Mac OS:
    * Iniciar o terminal
    * Utilizar o homebrew para instalar os comandos de Git no terminal <br />
    `brew update` <br />
    `brew install git`

# 6. Instalar uma IDE ou Editor de texto
* Recomendados:
    * [VS Code](https://code.visualstudio.com/)
    * [Intellij Community](https://www.jetbrains.com/idea/download/)

* Caso tenha instalado o Intellij, será necessário configurar o JDK quando abrir o projeto a primeira vez
    * Inicar o Intellij
    * Abrir o projeto
    * Navegar em `File > Project Structure > Platform Settings -> SDKs` e busque através do campo `JDK home path`, o diretório onde o Java 8 foi instalado. Se houver dúvidas onde o Java foi instalado, execute o comando `echo %JAVA_HOME%` no Windows, ou `echo $JAVA_HOME` no Mac OS.