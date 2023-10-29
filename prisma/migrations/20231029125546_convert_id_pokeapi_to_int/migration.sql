/*
  Warnings:

  - Changed the type of `pokeapi_id` on the `pokemons` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "pokemons" DROP COLUMN "pokeapi_id",
ADD COLUMN     "pokeapi_id" DOUBLE PRECISION NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "pokemons_pokeapi_id_key" ON "pokemons"("pokeapi_id");
