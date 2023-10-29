/*
  Warnings:

  - You are about to drop the column `pokeapi_id` on the `pokemons` table. All the data in the column will be lost.
  - Added the required column `pokeapiId` to the `pokemons` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "pokemons_pokeapi_id_key";

-- AlterTable
ALTER TABLE "pokemons" DROP COLUMN "pokeapi_id",
ADD COLUMN     "pokeapiId" INTEGER NOT NULL;
