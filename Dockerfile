# Usando a imagem oficial do Ruby 2.7.7
FROM ruby:2.7.7

# Instalando dependências do sistema
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    postgresql-client

# Criando o diretório de trabalho
WORKDIR /app

# Copiando o Gemfile e o Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instalando as dependências do Ruby
RUN bundle install

# Copiando o restante do código do aplicativo
COPY . .

# Copiando o script de entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Garantir que a variável de ambiente RAILS_MASTER_KEY está sendo passada
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

# Expõe a porta em que o Rails vai rodar
EXPOSE 3000

# Comando para rodar o servidor Rails
ENTRYPOINT ["/entrypoint.sh"]
