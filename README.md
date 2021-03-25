# JML_Musculacao

A disciplina de Projeto Integrador do Curso Técnico em Informática Integrado ao Ensino Médio do IFC - Campus Araquari propõe a criação de um sistema
com tema de escolha de um grupo de alunos, sendo necessário que ao menos uma interação com banco de dados esteja presente por meio de um sistema de autenticação.

Este projeto ainda está em desenvolvimento, a codificação do backend está sendo feita em Python 3.x com o framework web Django criando uma API por meio do Django
REST Framework, enquanto o frontend da aplicação está sendo desenvolvido utilizando HTML, CSS, o framework de estilos responsivos Bootstrap 4 e Javascript, sendo utilizado o framework VueJS para a interface de usuário.

Posteriormente será feito o deploy do projeto para a utilização do usuário, quando este for feito, este texto será atualizado com a URL.

####### Para rodar o Backend localmente #######

Primeiramente é necessário que o Python 3 esteja instalado na máquina (de preferência da versão 3.8 para cima) e que esteja configurado nas variáveis de ambiente.
Python é encontrado em: https://www.python.org/downloads/.

Já para configurar variáveis de ambiente:

Windows: https://medium.com/@victorromariopazdejesus/python-3-configurando-vari%C3%A1veis-de-ambiente-no-windows-10-63059c7192e6.

Linux: https://www.hostinger.com.br/tutoriais/variaveis-de-ambiente-linux.

A partir daqui eu indico o uso de um Ambiente de Desenvolvimento Integrado (IDE) que suporte Python para facilitar o uso do terminal.
Por experiência própria eu sugiro o Visual Studio Code.

VSCode: https://code.visualstudio.com/download (É necessário instalar a extensão do Python na aba de Extensões).

No VSCode, abra a pasta "backend" e aperte Ctrl + ' para abrir o terminal:

Primeiro será necessário criar um ambiente virtual, que pode ser feito utilizando a biblioteca virtualenv que é padrão do Python.

caminho/do/meu/projeto/Backend> python -m venv env

Após isso é necessário iniciar esse ambiente:

No Windows: env\Scripts\activate.ps1

No Linux: source env/bin/activate

Após iniciado o ambiente, serão instalados os módulos necessários para o projeto por meio do comando:

caminho/do/meu/projeto/Backend>pip install django djangorestframework djangorestframework-simplejwt pillow drf-spectacular django-cors-headers python-decouple

Terminada a instalação dos pacotes, execute o comando:

caminho/do/meu/projeto/Backend>python manage.py runserver

Por padrão ele iniciará na porta 8000 de localhost, caso ela esteja ocupada, de um espaço e adicione a porta desejada após o "runserver".

Pronto a API do backend já está rodando, agora vamos ao frontend.

####### Para rodar o frontend localmente #######

Para rodar o frontend é necessário que seja instalado o NodeJS, que pode ser adquirido no link: https://nodejs.org/en/download/, porque precisaremos do seu
gerenciador de pacotes para que funcione adequadamente.

Com o Node instalado, temos acesso ao comando npm (Node Package Manager) que nos permite instalar bibliotecas relacionadas ao node.
Primeiramente iremos instalar o Vue-CLI, para criar o nosso projeto Vue, então crie uma pasta vazia, abra no VSCode e execute o comando no terminal:

caminho/da/minha/pasta> npm install -g vue-cli

Após a instalação é hora de criar um projeto Vue:

caminho/da/minha/pasta> vue create nome_projeto

Para instalar corretamente o projeto, siga os passos a seguir:

1°: Selecione a opção "Manually select features".

2°: Desmarque as opção "Choose Vue version" e marque as opções "Router" e "CSS Pre-processors" (Linter/Formatter fica a critério, eu não utilizei).

3°: Digite N e confirme.

4°: Marque a opção 'Sass/SCSS (with node-sass)'

5°: Marque a opção 'in package.json'.

6°: Digite N e confirme.

Com término da instalação do projeto, são necessários algumas bibliotecas para que o mesmo funcione adequadamente, então entraremos no diretório:

caminho/da/minha/pasta> cd nome_projeto

Dentro da pasta do projeto podemos instalar algumas bibliotecas com os comandos:

caminho/da/minha/pasta/nome_projeto> npm install bootstrap

caminho/da/minha/pasta/nome_projeto> npm install axios

caminho/da/minha/pasta/nome_projeto> npm install firebase

O axios é o pacote que será utilizado para comunicação do backend com o frontend, o bootstrap será para os estilos e o firebase será para fins de armazenamento.

Com a instalação desses pacotes pronta, substitua todos os arquivos do projeto pelos arquivos da pasta frontend que está nesse repositório.

Então execute o comando:

caminho/da/minha/pasta/nome_projeto> npm run serve

Ao final da compilação, visite a url mostrada, lembre-se de manter o server do backend ligado também.

Para esse projeto é isso,

Atenciosamente, equipe do JML Musculação.

Criadores: Josué Hass Pereira, Leonardo Fagundes Rócio, Luís Henrique Schmitt e Mateus Alayo Hidalgo Schulz.













