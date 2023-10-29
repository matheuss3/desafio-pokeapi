-- CreateTable
CREATE TABLE "teams" (
    "id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "owner" TEXT NOT NULL,

    CONSTRAINT "teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teams_pokemons" (
    "team_id" TEXT NOT NULL,
    "poke_id" TEXT NOT NULL,

    CONSTRAINT "teams_pokemons_pkey" PRIMARY KEY ("team_id","poke_id")
);

-- CreateTable
CREATE TABLE "pokemons" (
    "id" TEXT NOT NULL,
    "creation_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "pokeapi_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "pokemons_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "pokemons_pokeapi_id_key" ON "pokemons"("pokeapi_id");

-- AddForeignKey
ALTER TABLE "teams_pokemons" ADD CONSTRAINT "teams_pokemons_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "teams_pokemons" ADD CONSTRAINT "teams_pokemons_poke_id_fkey" FOREIGN KEY ("poke_id") REFERENCES "pokemons"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
