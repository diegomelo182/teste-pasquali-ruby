# Teste Pasquali - Desenvolvedor Ruby

Será necessário ter o Docker e o Docker compose instalado para executar os projetos.

Para subir o projeto execute `docker-compose up`, pronto agora voce pode acessar o front através da url `http://localhost:4200` e o back através de `http://localhost:3000`.

## Rails

Na primeira execução será necessário rodar o `rails db:create db:migrate`, para isso digite `docker ps` ou `docker container ls` e procure pelo container `test-pasquali_web`, em seguida copie o `CONTAINER ID` dele, e logo após execute `docker exec CONTAINER_ID rails db:create db:migrate`, pronto a API já vai estar funcionando perfeitamente.

## Mysql

Para acesso do banco de dados basta usar o Mysql Workbench no localhost com o usuário `root` a senha `root`. Como estou no ambiente de desenvolvimento não criei um usuário e senha para a API.

## Docker

Segue abaixo os links de instalação

* [Instalação do Docker](https://docs.docker.com/install/)
* [Instalação do Docker Compose](https://docs.docker.com/compose/install/)
