/*
  Warnings:

  - You are about to alter the column `pokeapi_id` on the `pokemons` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.

*/
-- AlterTable
ALTER TABLE "pokemons" ALTER COLUMN "pokeapi_id" SET DATA TYPE INTEGER;
