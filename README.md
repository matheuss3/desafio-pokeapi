# TEAMS POKEMON API

Esta é uma API simples em Node.js possui 3 rotas básicas para a criação de times com pokemons utilizando a api 
<a href='pokeapi.co'>pokeapi.co</a>.

# INSTRUÇÕES

```
# Instale as dependências
$ npm install

# Comando para iniciar a api em desenvolvimento
$ npm run dev
```

<br>

> ## Observações
- A porta padrão para execução da API é a porta 3333, caso deseje altera-la crie um arquivo **".env"** na raiz do projeto com uma variável **PORT** com a porta que desejar executar a aplicação.
<br>
- Os dados são salvos em memória caso a API seja reiniciada todos os dados serão perdidos.
<br>
- Utilize softwares como o insomnia para os testees

## Rotas

GET /api/teams - Lista todos os times registrados<br>

GET /api/teams/{id} - Busca um time registrado por ID
<br>
<br>

POST /api/teams - Rota para criação de um time, que recebe um JSON no formato 

```
{
	"user": "matheuss3",
	"team": [
		"blastoise",
		"venusaur"
	]
}
```