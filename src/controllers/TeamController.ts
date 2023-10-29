import { Request, Response } from "express";
import { pokeapi } from "../services/pokeapi";
import { prisma } from "../db";

interface ICreateTeam {
    user: string,
    team: Array<string>
}

class TeamController {
    async getTeams(request: Request, response: Response) {
        const teams = await prisma.team.findMany({
            include: { pokemons: true }
        })

        return response.json(teams)
    }

    async getTeamById(request: Request, response: Response) {
        const id = request.params.id

        const team = await prisma.team.findFirst({
            where: { id },
            include: { pokemons: true }
        })
        
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
                
                pokemons.push({ pokeapiId: id, name, weight, height })
            } catch (error) {
                return response.status(404).json({ mensagem: `Nome de pokemon inválido refaça o time ${pokename}` })
            }

        }

        try {
            await prisma.team.create({
                data: {
                    owner: user,
                    pokemons: {
                        create: pokemons
                    }
                },
                include: { pokemons: true }
            })
        
            const teams = await prisma.team.findMany({ include: { pokemons: true } })
        
            return response.json([ teams ])
        } catch (error) {
            return response.status(500).json({ mensagem: `Erro ao salvar time no banco de dados!`, error })
        }
    }
}

export { TeamController }