/*
  Warnings:

  - You are about to drop the `teams_pokemons` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "teams_pokemons" DROP CONSTRAINT "teams_pokemons_poke_id_fkey";

-- DropForeignKey
ALTER TABLE "teams_pokemons" DROP CONSTRAINT "teams_pokemons_team_id_fkey";

-- AlterTable
ALTER TABLE "pokemons" ADD COLUMN     "teamId" TEXT;

-- DropTable
DROP TABLE "teams_pokemons";

-- AddForeignKey
ALTER TABLE "pokemons" ADD CONSTRAINT "pokemons_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES "teams"("id") ON DELETE SET NULL ON UPDATE CASCADE;
