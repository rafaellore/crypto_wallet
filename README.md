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
