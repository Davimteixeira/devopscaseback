# DevOpsCase

## Pré-requisitos

Antes de começar, certifique-se de que você tem as seguintes ferramentas instaladas no seu ambiente local:

- [Docker](https://www.docker.com/get-started) (Versão 20.10 ou superior)
- [Docker Compose](https://docs.docker.com/compose/install/) (Versão 1.27 ou superior)
- [Rails 7](https://rubyonrails.org/) (Para desenvolvimento do backend, se necessário para outras operações além do Docker)

## Como funciona a integração?

Este projeto é composto por três containers principais:

1. **Backend (Rails API)**: Um servidor Rails que serve como API para o frontend. Ele interage com o banco de dados PostgreSQL e fornece dados através de endpoints.

2. **Frontend (Vite + React)**: Um frontend que consome a API do backend. Utiliza o Vite para construção e desenvolvimento em tempo real.

3. **Banco de Dados (PostgreSQL)**: Usado pelo backend para armazenar dados da aplicação, como informações de usuários, pokemons, entre outros.

A integração entre o frontend e o backend ocorre por meio de requisições HTTP, onde o frontend consome as APIs expostas pelo backend para buscar ou enviar dados.

---

## Passo a Passo

### 1. Clone os repositórios

Primeiro, clone o repositório do **frontend** e do **backend** em seu diretório local. Você precisará colocar ambos os repositórios na mesma pasta para que o Docker Compose consiga orquestrar os containers corretamente.

```bash
# Clone o repositório do backend
git clone https://github.com/seuusuario/devopscaseback.git

# Clone o repositório do frontend
git clone https://github.com/Davimteixeira/devopscasefront.git
```

## Você deve colocar os dois repositórios no mesmo diretório, como por exemplo:

```bash
/devopscase/
├── devopscaseback/ # Backend
└── devopscasefront/ # Frontend
```

## 2. Gerar a chave RAILS_MASTER_KEY

A chave `bash RAILS_MASTER_KEY` deve ser gerada antes de rodar os containers. Para gerar a chave, execute o seguinte comando no diretório do backend:

```bash
rails secret
```

## 3. Configuração do Ambiente

Dentro do diretório devopscaseback, crie o arquivo .env

```bash
cd devopscaseback

# No arquivo .env, adicione as variáveis de ambiente

RAILS_MASTER_KEY=<sua-chave-master-gerada>
POSTGRES_USER=postgres
POSTGRES_PASS=postgres
POSTGRES_DB_NAME=pokeapi_development
DATABASE_HOST=db 4. Subir os Containers
No diretório onde está o docker-compose.yml, rode o comando abaixo para construir e iniciar os containers:
```

## 4. Subir os Containers

No diretório onde está o arquivo docker-compose.yml, rode o comando abaixo para construir e iniciar os containers:

```bash
docker-compose up --build
```

O docker-compose irá construir os containers, instalar as dependências, rodar as migrações do banco de dados e iniciar o servidor Rails para o backend e o servidor Vite para o frontend.

## 5. Acessar a Aplicação

Após o build ser finalizado, você pode acessar:

```
O backend na URL http://localhost:3000.
O frontend na URL http://localhost:5173.
Como Funciona a Integração
O backend é uma API RESTful construída com Ruby on Rails. Ele utiliza um banco de dados PostgreSQL para armazenar as informações da aplicação.
O frontend é um projeto Node.js utilizando Vite como bundler. Ele se comunica com o backend para exibir os dados necessários aos usuários.
O que o Arquivo docker-compose.yml Orquestra
O arquivo docker-compose.yml orquestra três containers principais:

db: Um container para o banco de dados PostgreSQL.

Imagem: postgres:latest
Exposta na porta 5432.
devopscaseback: O container do backend.

Conecta ao banco de dados PostgreSQL.
Rodará o servidor Rails na porta 3000.
Executa as migrações automaticamente ao iniciar o container.
devopscasefront: O container do frontend.

Rodará o servidor Vite na porta 5173.
Conecta ao backend para fazer requisições à API.

```
