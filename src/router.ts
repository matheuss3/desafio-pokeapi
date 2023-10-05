import { Router } from "express";
import { TeamController } from "./controllers/TeamController";


const router = Router()


const teamController = new TeamController()

router.get('/', (request, response) => {
    return response.json({ hello: 'world' })
})

router.post('/api/teams', teamController.createTeam)
router.get('/api/teams', teamController.getTeams)
router.get('/api/teams/:id', teamController.getTeamById)


export { router }