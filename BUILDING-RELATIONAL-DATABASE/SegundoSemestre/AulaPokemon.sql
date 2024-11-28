-- APELIDOS

select nome
from Pokemons p, Tipos t; /*gerou erro de AMBIGUIDADE
por causa das duas menções de nomes que tem nas tabelas
para isso precisa identificar qual tabela é.*/


-- para corrigir foi colocado o APELIDO p antes do nome da coluna
select p.nome
from Pokemons p, Tipos t;

-- OU --
-- quando não utiliza APELIDO é necessário mencioar o nome da tabela
select Pokemons.nome
from Pokemons, Tipos;

-- definindo apelidos nas colunas quando as mesmas tem o mesmo nome
select p.nome, t.nome
from Pokemons p, Tipos t;


-- exemplo de definição de apelidos em colunas
select p.nome nome_pokemon, t.nome tipo
from Pokemons p, Tipos t;


---------- JUNÇÃO ------------

-- equi join
---- em casos de não se lembrar da sintaxe do INNER
select p.nome nome_pokemon, t.nome tipo
from Pokemons p, Tipos t
where t.tipoid = p.tipoid and t.nome='fogo';

-- inner join
-- recomendado usar 
select p.nome nome_pokemon, t.nome tipo
from Pokemons p inner join Tipos t on t.tipoid = p.tipoid
where t.nome = 'Fogo';


---- left join
select p.nome nome_pokemon, t.nome tipo
from Pokemons p left join Tipos t on t.tipoid = p.tipoid;


----- right join
select p.nome nome_pokemon, t.nome tipo
from Pokemons p right join Tipos t on t.tipoid = p.tipoid;


------- EXCLUDING JOIN
-- ** LEFT DE EXCLUSÃO

select p.nome nome_pokemon, t.nome tipo
from Pokemons p LEFT join Tipos t on t.tipoid = p.tipoid
where t.tipoid is null;

-- ** RIGHT DE EXCLUSÃO
select p.nome nome_pokemon, t.nome tipo
from Pokemons p right join Tipos t on t.tipoid = p.tipoid
where p.tipoid is null;


------ FULL JOIN
select p.nome nome_pokemon, t.nome tipo
from Pokemons p full join Tipos t on t.tipoid = p.tipoid


--- FULL OUTER JOIN 
/*Para executar o comando full outer join, é necessário usar o UNION para
e os selects que forem necessários*/

---- left join
select p.nome nome_pokemon, t.nome tipo
from Pokemons p left join Tipos t on t.tipoid = p.tipoid

union

----- right join
select p.nome nome_pokemon, t.nome tipo
from Pokemons p right join Tipos t on t.tipoid = p.tipoid;


---- OUTER JOIN OU EXCLUDING JOIN
/*Apresenta apenas as diferenças entre as tabelas*/

select p.nome nome_pokemon, t.nome tipo
from Pokemons p LEFT join Tipos t on t.tipoid = p.tipoid
where t.tipoid is null

UNION
-- ** RIGHT DE EXCLUSÃO
select p.nome nome_pokemon, t.nome tipo
from Pokemons p right join Tipos t on t.tipoid = p.tipoid
where p.tipoid is null;


--- CROSS JOIN -> não informa os valores verdadeiros
select p.nome nome_pokemon, t.nome tipo
from Pokemons p, Tipos t;


-----------SELF JOIN
select p1.pokemonid, p1.nome nome_pokemon, p2.pokemonid, p2.nome nome_pokemon
from Pokemons p1 inner join Pokemons p2 on p1.tipoid = p2.tipoid
where p1.pokemonid < p2.pokemonid;


INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (8, 'Psyduck', 2, 50, 52, 48);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (9, 'Oddish', 3, 45, 50, 55);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (10, 'Magnemite', 4, 25, 35, 70);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (11, 'Abra', 5, 25, 20, 15);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (12, 'Pidgey', 6, 40, 45, 40);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (13, 'Growlithe', 1, 55, 70, 45);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (14, 'Horsea', 2, 30, 40, 70);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (15, 'Bellsprout', 3, 50, 75, 35);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (16, 'Voltorb', 4, 40, 30, 50);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (17, 'Drowzee', 5, 60, 48, 45);

INSERT INTO Pokemons (PokemonID, Nome, TipoID, HP, Ataque, Defesa) 
VALUES (18, 'Spearow', 6, 40, 60, 30);