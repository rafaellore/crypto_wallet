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
