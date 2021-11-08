# **Projeto de Testes Automatizados**

Olá!

Este é um projeto para testes automatizados de página Web EBAC Shop!

## **Tecnologias Utilizadas**
* **Ruby** (_linguagem de programação utilizada para o desenvolvimento do script automatizado_)
* **Cucumber** (_para ler as especificações dos testes escritos em Gherkin e orquestar a execução dos mesmos_)
* **Selenium e Capybara** (_para interação com o navegador e páginas web_)
* **SitePrism** (_para facilitar a implementação do padrão PageObjects_)
* **RSpec** (_para validar que os resultados são conforme esperado_)


## **Ferramentas Necessárias**
* **Ruby (versão 2.7.4)** - <https://www.ruby-lang.org/pt/documentation/installation> (* _para Windows, instalar versão com DevKit_)
* **Git Client** - <https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git>
* **Navegador Chrome** - <https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=pt-BR>
* **Gem Bundler** - com o Ruby instalado, basta executar ```gem install bundler``` no terminal


## **Executando a Automação**
* Antes de tudo, faça a instalação das Ferramentas informadas anteriormente. Logo, abra o terminal e faça um clone do projeto:
```git clone https://github.com/avmonteiro/projeto_via.git```
* Instale as dependências: ```bundle install```
* Execute o **Cucumber**: ```bundle exec cucumber```


## **Screenshots e Report em HTML**
Ao final da execução do cenário de teste, é tirada uma screenshot da página como evidência. Dependendo se o teste passar ou falhar, as screenshots ficam armazenadas da seguinte maneira:

```
projeto_via
└── screenshots
    ├── test_failed
    └── test_passed
```



Por padrão, os resultados dos testes são apresentados no terminal. Caso desejar um report em formato _html_, adicione o profile **html** ao executar o **cucumber**. Por exemplo:
* ```bundle exec cucumber -p html``` - Executa o teste e os resultados são armazenados em um arquivo HTML


_Os reports em HTML são armazenados conforme a estrutura de pastas abaixo:_

```
projeto_via
└── reports
    └── html
```
