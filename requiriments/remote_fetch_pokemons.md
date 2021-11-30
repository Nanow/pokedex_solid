# Pegar todos os pekemons do servidor

> ## Regras

1. ✅ Deve não ser necessário passar nenhum parametro
2. ✅ Deve chamar o endpoint raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json
3. ❌ Deve retornar uma lista pokemons

> ## Excessão - GetCurrentPlataforma

1. ❌ Deve lancar excessão unexpected caso retorne algo diferente de 200.
2. ❌ Deve lancar um error de Invalid data caso o json não esteja nos padrões experados.
3. ❌ Deve lancar um error de unexpected em outros casos.

❌
✅