# Use uma imagem base oficial do Python
FROM python:3.11-slim

# Instale dependências do sistema e ferramentas adicionais
RUN apt-get update && apt-get install -y \
    curl \
    procps \
    docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instale o Glances com todos os módulos
RUN pip install glances

# Crie um novo usuário (glances_user) e adicione ao grupo 'docker'
RUN groupadd -g 999 docker && \
    useradd -r -u 1000 -g docker glances_user && \
    usermod -aG docker glances_user

# Troque para o novo usuário
USER glances_user

# Defina variáveis de ambiente opcionais, como nome do host
ENV GLANCES_OPT="--docker --disable-webui"

# Exponha a porta 61208 para o modo web
EXPOSE 61208

# Comando para iniciar o Glances em modo servidor
CMD ["glances", "-w"]