# AULA 02 - CRIANDO O PROJETO

## Oque essa aplicação faz?

É basicamente um CRUD de criptomoedas, usando Ruby on Rails. Essa apliação foi feita pra aprender o basico sobre.

## Qual comando rodar para criar um projeto?

Depois de ter instalado o Ruby + Ruby on Rails na máquina e o RVM, basta todar o seguinte comando:

`rails _5.2_ new crypto_wallet`

Esse comando irá criar um projeto com toda a estrutura do rails usando a versão 5.2. Não consegui fazer usando uma versão especifica, então fiz usando a versão mais atual. Dá pra ver todas as opções que o rails permite rodando `rails`.

# AULA 03 - E SE EU QUISER TROCAR O BD?

Para saber qual o BD que está sendo usado na aplicação, verifique o arquivo `config/database.yml`

Para criar um projeto com um BD expecifico, basta usar:

`rails new meu_app --database=<nome bd>`

# AULA 04 - COMO FAZER O CRUD BÁSICO?

O rails possui um generator chamado scaffold que permite criar um CRUD para uma determinada "tabela", é como se fosse um andaime pra um prédio. Pra criar um CRUD básico no rails, basta usar o seguinte comando:

`rails generate scaffold <Model> <campo:tipo> <campo:tipo>`

Um exemplo disso seria:

`rails generate scaffold Coin description:string cronym:string url_image:string`

Quando rodar esse comando ele vai criar arquivos dentro das pastas de model, view e controller pra essa tabela, seguindo o padrão MVC.

Para verificar como ele cria a tabela usando o Ruby, basta ver dentro de db/migrate

# AULA 05 - OQUE DIABOS É MIGRATIONS

Em resumo, migrations são uma característica do Active Record (o framework, dentro do Rails) que permite você "escrever/especificar" as tabelas do BD usando a linguagem Ruby.

Dessa forma, você pode adicionar, modificar e remover tabelas do BD sem utilizar SQL, além de ter sempre disponível toda a sequência de criação/alteração das tabelas envolvidas no projeto.

As migrações também controlam quais já foram ou não aplicadas o BD através do arquivo db/schema.rb.

Basicamente, sempre que você criar uma tabela, você vai precisar migrar isso pro BD usando esse cara.

# AULA 06 - DBCONSOLE E MIGRANDO AS PARADAS PRO BD

## dbconsole

rails dbconsole é o comando usado seconectar ao BD e executar comandos para inspecioná-lo.

## Rails Tasks

Para conhecer todas as tasks disponíveis rode: `rails -T`

Para filtrar tasks específicas use as iniciais do que procura, por exemplo: `rails -T db`

Os comandos mais usados pra fazer coisas no BD são:

**cria o db:** `rails db:create`

**apaga o db:** `rails db:drop`

**executa as migrations** `rails db:migrate`

**desfaz a última migration** `rails db:rollback`

Sendo assim…
**Precisamos criar o BD a primeira vez:**
`rails db:create`
**Na sequência aplicamos as migrações:**
`rails db:migrateInicie o servidor do Rails`

**Agora, para ver o crud, use o comando**

`rails server`

Acesse a rota coins

http://localhost:3000/coins

## AULA 07 - Ambientes de desenvolvimento

- Por padrão, o Rails vem com 3 ambientes:
  - Desenvolvimento, Teste e Produção.
- Esses ambientes possibilitam ter configurações isoladas para cada ambiente.
- A sua Gemfile é a forma mais simples de perceber isso.
- [Link para mais informações](http://guides.rubyonrails.org/configuring.html#creating-rails-environments)

para rodar o ambiente de prod, use o comando: `rails s -e production`

## AULA 08 - Entendendo o fluxo MVC

Basicamente, quando criamos o scaffold do Coin, ele cria automaticamente o model views e controller para Coin. POdemos acessar ele por /coins e ter a lista de coins registradas. Mas, porque isso ocorre?

Ocorre porque no arquivo controller dela, com o nome `coins_controller` contem actions, e dentre elas uma chamada index, que quando acessamos /coins é chamada, e como estamos acessando só `/coins`, que será o endereço index, ele chama o arquivo de mesmo nome da view, ficando em `app/views/coins/index/html.erb`

## Conhecendo os generators

Os genetators são responsavéis por gerar as paradas prontas pra gente, mas existe diversas variações das paradas que precisamos. Inclusive, podemos adicionar novos generators adicionando novas gems (lembrando que gems são praticamente libs) no projeto.

Por exemplo podemos usar o comando seguinte para criar comente um controller:

`rails g controller welcome index`

e depois, excluir o mesmo com:

`rails d controller welcome`

**Perceba que pra deletar usamos d e para gerar usamos o g**

Pra gerar algo seguindo o padrão MVC, usamos o scaffold, mas existe também um generator só pra gerar uma view, que seria o aqruivo controller com uma view index:

`rails g controller welcome index`

precisa passar o index para ele criar somente esse método na controller

## AULA 09 - ENTENDENDO O ERB

ERB vem de Embedded Ruby.
Em resumo, é uma forma de você mesclar texto com código Ruby.
Parecido com o conceito do React de conseguirmos executar o JS dentro de HTML (JSX ou TSX).

Um exemplo disso, seria utilizar a seguinte escritura:

**execução:**
<%= 1 + 1 %>
<%= Date.today %>

**comentário**
<%# código de ruby %>

# AULA 10 - HELPERS

Como o nome sugere, são métodos prontos para podermos usar para facilitar a nossa vida. Um exemplo disso seria o link_to:

<%= link_to "Cadastro de Moedas", coin_path %>

# AULA 11 - MAIS HELPS

Um outro helper, seria o image_tag, que permite usar uma imagem como o nome sugere:

<%= image_tag coin.url_image %>

Recomendo olhar na documentação sobre.

# AULA 12 - CRIANDO SEUS PROPRIOS HELPERS

O Rails permite que você crie seus próprios Helpers.
Para isso, existe uma pasta` app/helpers` que permite esse feito. Perceba que essa pasta possui um arquivo` application_helper.rb` e outros arquivos com o nome das views \*\_helper.rb.
Se o objetivo for criar um helper que seja usado globalmente, crie em application_helper. Todavia, podemos criar os helpers em qualquer desses arquivos e usar em qualquer lugar, mas por questões de organização, crie cada um dentro do seu contexto.

# AULA 13 - ALTERANDO A ROTA PADRÃO

Vamos começar fazendo o mapeamento da rota
padrão. O arquivo do Rails que faz o mapeamento das rotas é o
config/routes.rb

# AULA 14 - ENTENDO SOBRE RESOURCES E CRIANDO ROTAS NA MÃO

Quando usamos a palavra resources no mapeamento das rotas do Rails, de forma automática ele entenderá que queremos criar 7 rotas padrão para o CRUD

Para criar suas próprias rotas apenas declare o verbo e a url e o controller e action que deve responder à urlindicada, veja o exemplo:
`get '/inicio', to: 'welcome#index'`

A rota acima permitirá que seja digitada a url /inicio e ela acessará o controller welcome e ação index.

pra usar o resources e criar todas as rotas pra uma model, é assim:

`resources: coins`

# AULA 15 - COMO USAR O RAILS CONSOLE PARA ACESSAR A APLICAÇÃO

Primeiro nós instalamos o pry para ver as paradas bonitinhas no console, onde adicionamos a gem no gemfile (seria isso um irmão do package.json?)

Depois, para rodar o console do rails, usamos o seguinte comando:

`rails c`

Usando o console, podemos acessar diversas coisas relacionadas ao projeto, como informações do projeto:

`app.root_path`

Podemos acessar os helps também, que são os métodos utilitários:

`helper.link_to "teste", "/teste"`

Podemos acessar até mesmo o helper que criamos:

`helper.data_br(Date.today)`

Podemos usar o console pra usar uma model também, e criar uma moeda:

`c = Coin.create!(
description: "Dash",
acronym: "DASH",
url_image: "http://"
)`

Dá pra criar usando `c = Coin.new`, mas ele vai criar ele com as paradas vazias, e ir subistituindo com c.description, etc.

# AULA 16 - COMO SABER EM QUAL AMBIENTE ESTAMOS?

Basicamente usando o seguinte comando no console:

`Rails.env`

# AULA 17 - USANDO VARIAVEIS DE INSTANCIA PARA PASSAR UM VALOR PARA A VIEW

Observe o `app/controllers/coins_controller.rb`

Para fazer um teste, nesse mesmo arquivo, no método index crie uma variável `@meu_nome = "Jackson Pires"`
Agora na view `app/views/coins/index.html.erb` adicione alinha `<%= @meu_nome %>` e salve.

Perceba que ao acessar a página, agora seu nome aparecerá.

# AULA 18 - PASSANDO PARÂMETROS PELA URL

Vejamos o exemplo...
http://localhost:3000/?nome=Jackson

Acessando a URL acima, podemos informar o parâmetro nome para o servidor. No servidor, no controller, podemos acessá-lo através da variável global `params`:

`params[:nome]`

Assim podemos usar o valor que foi passado (Jackson) do jeito que quisermos.

Lembrando que o params é um hash, parece bastante um objeto JS.

# AULA 19 - USANDO PARTIALS

Basicamente, se você criar um .html.erb com um underline \_, ele se torna um html reutilizavel, bastante parecido com o conceito de componente do React.

crie o arquivo `_menu.html.erb`, depois insira um html, e reutilize ele da seguinte forma:

`<%= render "menu" %>`

# AULA 20 - LAYOUT

Basicamente, tem como usar um arquivo que todas as views passarão, como sendo um componente global de estilos parecido com o React.

Ele fica em apllication.html.erb, sendo renderizado em `<%= yield %>`, inclusive, é nesse documento que fica o body das views.

Podemos também customizar para uma página usar um layout especifico, fazendo assim no controller da view: `layout "nome_do_layout"`

# AULA 21 - ENTENDENDO O FLUXO MVC DO CRUD (INDEX)

Tudo começa com uma requisição (request) que o usuário faz. Essa requisição é roteada para um controller e uma action.

A action/controller é processada e o resultado (response) é enviado para o usuário.

No caso da action index, todas as moedas são buscadas no model Coin e enviadas através da variável de instância `@coins`. Ao chegar na view, a variável `@coins` é iterada e processada junto ao HTML para que sejam mostradas todas as moedas.

# AULA 22 - ENTENDENDO O FLUXO MVC DO CRUD (SHOW E DELETE) + FILTROS RAILS

No caso da action show, a request é feita em conjunto com um ID que identifica qual a moeda que será mostrada, pois antes da action é rodado o filtro :set_coin, onde a moeda é pesquisada pelo ID e enviada para a view através da variável @coin

A mesma coisa ocorre para o delete, a diferença é que ele usa essa variável coin para usar o coin.destroy, e retornar uma resposta em html, retornando para a página index com um notice, e uma resposta json.

# AULA 23 - ENTENDENDO O FLUXO MVC DO CRUD (NEW E CREATE)

**FLUXO DO NEW**

Para gerar uma nova moeda será usado inicialmente um path para um novo elemento, sendo esse caminho `coins/new`.

Ao acessar esse path, o controller gera uma instância vazia do model Coin `Coin.new`.

Isso fará com que a variável `@coin` possua todos os campos (vazios) e permitirá que o Rails possa montar a view (new.html.erb), enviando @coins para ela e com um formulário para a nova moeda.

Esse formulário nos permite acessar alguns utilitários, como form.label, form.text_field, etc.

**fluxo do CREATE**

O formulário é montado com o helper form_with (novo no Rails 5)

https://guiarails.com.br/form_helpers.html

Após preencher o formulário e clicar no botão para cadastrar a requisição do tipo `POST` será enviada ao `controller` que rodará a action `create`.

Lá a nova moeda é criada com os dados que foram enviados do formulário. Tudo através da variável `params`.

Ao final a requisição é redirecionada para o path `show`, a fim de mostrar a moeda criada.

# AULA 24 - ENTENDENDO O FLUXO EDIT & UPDATE

Tudo começa com uma requisição (request) que o usuário faz para editar uma moeda. A rota nos leva até a action edit que encontra a moeda e envia através da variável @coin a moeda a ser editada para a view `edit.html.erb`. Após editar a moeda na view o usuário clicará no botão para atualizá-la.
O botão submeterá as alterações via PATCH para a action `update`, que localiza e atualiza a moeda com os dados recebidos via params.
Após atualizar, o usuário é redirecionado para o show, que mostra os dados atuais da moeda.

# AULA 25 - ENTENDENDO SOBRE PERMISSÃO DE PARÂMETROS

A permissão de parâmetros é uma prática que visa informar quais dados que estão chegando ao controller são permitidos para serem manipulados.
O Rails trata isso através do framework Action Controller e nos dá os métodos require e permit para usarmos com essa finalidade

https://api.rubyonrails.org/classes/ActionController/Parameters.html

Veja o Exemplo:
params = ActionController::Parameters.new({person: {name: "Francesco",age: 22,role: "admin"}})
permitted = params.require(:person).permit(:name, :age)

# AULA 26 - A TASK DB:SEED

Imagine a seguinte situação… Você começa a testar seu software cadastrando novas moedas com todos os dados, etc. Em dado momento, você precisa apagar todos os dados para corrigir algo no BD, ou mesmo, passa seu projeto para alguém sem os dados.

O Rails já possui um mecanismo para isso chamado `"db:seed"` que é a task que podemos invocar para fazer o preenchimento inicial dos dados.

Para o nosso caso, vamos criar mecanismo para que caso apaguemos todos os dados, possamos preencher com novos sem muito esforço. Sendo assim, vá em `db/seed.rb` e adicione as
seguintes linhas:

```
Coin.create!(
  description: "Bitcoin"
  acronym: "BTC"
  url_image:
  "https://upload.wikimedia.org/wikipedia/
  commons/c/cf/Bitcoin.com_logo.png"
)
```

# AULA 28 - CRIANDO SUAS PRÓPRIAS TASKS

O `%x` permite que executemos comando no terminal a partir de um código ruby.

Para testar, abra o IRB e digite a instrução:

`puts %x(ls)`

O resultado deve ser a lista de pastas da sua aplicação.

No Rails é possível criar suas próprias tasks de forma
muito simples. Para isso, rode:

`rails g task <nome do namespace> <nome da task>`

Ex:
`rails g task dev setup`

Isso gerará a task `dev:setup` que pode ser usada para criarmos tudo necessário para a configuração do ambiente de desenvolvimento

```
 %x(rake db:drop db:create db:migrate db:seed)
```

Agora, roda o seguinte comando para executar a task:

`rails dev:setup`

# AULA 29 - MELHORANDO A NOSSA TASK

Basicamente, nós melhoramos como nossa task é mostrada no terminal + refatorando ela, usando a gem `tty-spinner` + uma função com `yield`

```
def show_spinner(message, message_end = 'Done!')
  spinner = TTY::Spinner.new("[:spinner] #{message}", format: :dots)
  spinner.auto_spin
  yield
  spinner.success("(✓) #{message_end}")
end
```
