# Account Manager Service

## Como usar

### Usando docker

*Clonar o projeto
*Digitar o comando ``docker-compose up``
*Digitar os seguintes comandos para popular a base de dados ``docker-compose run account_manager_service rake db:create``
*``docker-compose run account_manager_service rake db:migrate``
*``docker-compose run account_manager_service rake db:seed``

### Sem docker

*Clonar projeto
*Exportar variáveis de ambiente do arquivo .env
*Digitar os comandos ``rake db:create`` ``rake db:migrate`` ``rake db:seed``
*Por ultima digite o comando para subir a aplicação ``rails s``

#### Autênticação

Quando o serviço estiver de pé e acessível, basta enviar uma requisação para a rota ``<BASEURL>/users/login`` com o email e senha encontrados no arquivo db/seed.rb. Você reberá como retorno um token que deverá ser enviada a cada requisição da aplicação no seguinte formato Authorization: Beare <TOKEN> dentro dos headers.


## Como contribuir

*Clone o projeto
*Crie um branch para designar suas alterações (feature, hotfix, bugfix)
*Crie um pull request para realizarmos o code review
