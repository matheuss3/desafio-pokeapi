import { Request, Response } from "express";
import { pokeapi } from "../services/pokeapi";

interface ICreateTeam {
    user: string,
    team: Array<string>
}

interface Team {
    id: number,
    owner: string,
    pokemons: Array<object>
}

const teams : Array<Team> = []

class TeamController {
    async getTeams(request: Request, response: Response) {
        return response.json(teams)
    }

    async getTeamById(request: Request, response: Response) {
        const id = Number(request.params.id)

        const team = teams.find(team => team.id === id)
        
        if (!team) return response.status(404).json({ mensagem: 'Time não encontrado' })

        return response.json(team)
    }


    async createTeam(request: Request, response: Response) {
        const { user, team } : ICreateTeam = request.body

        if (!user) return response.status(400).json({ mensagem: 'Informe o usuário criador do time' })
        
        if (!team || team.length < 1) return response.status(400).json({ mensagem: 'Informe os pokemons que irão compor o time' })

    

        const pokemons = []

        for (const pokename of team) {
            try {
                const { id, name, weight, height } = await pokeapi.getPokemonByName(pokename)
                
                pokemons.push({ id, name, weight, height })
            } catch (error) {
                return response.status(404).json({ mensagem: `Nome de pokemon inválido refaça o time ${pokename}` })
            }

        }

        const id = teams.length + 1

        teams.push({ id, owner: user, pokemons})

        return response.json(teams)
    }
}

export { TeamController }