-- Consultas SQL - Projeto Integrador - JML Musculação
-- Nomes: Josué, Leonardo, Luís e Mateus Alayo - 3INFO3
-- Consultas SQL necessárias para o funcionamento do sistema JML Musculação
-- OBS: As consultas foram realizadas usando exemplos

-- Cadastro de Usuário
/* Ex: admin@admin.com, admin123, 'Perna, Costas, Peitoral', Admin, Número_1, TRUE */
INSERT INTO Usuario(Email, senha, treinos, PrimeiroNome, SegundoNome, Admin) VALUES
('admin@admin.com', 'admin123', 'Perna, Costas, Peitoral', 'Admin', 'Número_1', TRUE);

-- Login
-- Ex: josue.hasd@gmail.com, 20102015
SELECT * FROM Usuario WHERE Email='josue.hasd@gmail.com' AND senha='20102015';

-- Buscar Informações de Perfil
-- Ex: Id_user = 1;
SELECT * FROM Perfil WHERE Id_user = 1;

-- Criar Informações no Perfil
-- Ex: 18, 1.67, 1, 58.5, M, https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-09%20182751.png?alt=media&token=3752300c-3390-402c-9c58-4aedde0f84b6
INSERT INTO Perfil(Idade, Altura, Id_user, Peso, Sexo_biologico, URL_Imagem) VALUES
(18, 16.7, 1, 58.5, 'M', 'https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-09%20182751.png?alt=media&token=3752300c-3390-402c-9c58-4aedde0f84b6');

-- Atualizar Informações de Perfil
-- Ex: 20, 1.80, 2, 75.4, M,https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20201214.png?alt=media&token=56deca08-438d-40c2-91f2-2338186d2736
UPDATE Perfil SET Idade = 20, Altura = 1.80, Peso = 75.4, Sexo_biologico = 'M', URL_Imagem = 'https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20201214.png?alt=media&token=56deca08-438d-40c2-91f2-2338186d2736'
WHERE Id_user = 2;

-- Deletar informações de Perfil
-- Ex: Id_user = 2
DELETE FROM Perfil WHERE Id_user = 2;

-- Adicionar Artigo
INSERT INTO Artigo(Id_user, Id_categoria, Titulo, Texto, URL_Imagem) VALUES
(4, 6, 'Dieta para perder até 5 kg em 2 semanas', 'Para emagrecer em 2 semanas é necessário ter uma dieta saudável e equilibrada, sendo importante incluir frutas, vegetais e alimentos integrais ricos em fibras, além de ser recomendado evitar o consumo de alimentos industrializados, frituras, comidas congeladas, como pizza e lasanha, embutidos, comidas rápidas, etc.

Em 2 semanas é possível perder entre 1 kg e 5 kg, no entanto, essa perda de peso pode variar de acordo com o metabolismo da pessoa, do fato da alimentação ser realizada adequadamente e da prática de atividades físicas de forma regular.

Para alcançar o objetivo, é indicado que a pessoa realize principalmente atividades aeróbicas, como correr, nadar ou caminhar, por exemplo, pois ajudam o organismo a utilizar mais energia e queimar a gordura acumulada. Confira uma lista dos melhores exercícios para emagrecer.

Dieta para perder até 5 kg em 2 semanas
O que pode comer
Para conseguir diminuir o peso em 2 semanas, os alimentos permitidos são as frutas e os vegetais, já que são ricos em fibras, garantindo a sensação de saciedade e melhorando o trânsito intestinal. Também devem ser incluídos no dia a dia alimentos como:

Aveia;
Quinoa;
Arroz;
Pão integral;
Ovos;
Feijão;
Granola sem açúcar;
Batata;
Sementes de linhaça, girassol, abóbora e gergelim;
Frutos secos como nozes, amêndoas, amendoim e castanha de caju;
Leite e derivados desnatados, como o queijo branco.
Outros alimentos que podem acelerar o metabolismo e, assim, favorecer a perda de peso, são os alimentos termogênicos, como canela, gengibre, pimenta vermelha, café, chá verde e vinagre de maçã, que também podem ser incluídos na dieta. Conheça mais sobre os alimentos termogênicos. Fonte: Tua Saúde' , "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20202034.png?alt=media&token=bc7b64be-dfed-48f2-ad5c-7de0860e480b");

-- Deletar Artigo
-- Ex: Id_artigo = 2;
DELETE FROM Artigo WHERE Id_artigo = 2;

-- Atualizar Artigo
-- Ex: Id_artigo = 1, Titulo = Alimentos que ajudam a emagrecer
UPDATE Artigo SET Titulo = 'Alimentos que ajudam a emagrecer'
WHERE Id_artigo = 1;

-- Selecionar todos os Artigos
SELECT * FROM Artigo;

-- Entrar em um artigo específico
-- Ex: Id_artigo = 1;
SELECT * FROM Artigo WHERE Id_artigo = 1;

-- Buscar por algum artigo, com base em termo
SELECT Id_artigo, Texto, Titulo, Usuario.PrimeiroNome, Categoria.Nome, URL_Imagem FROM Artigo 
INNER JOIN Categorias ON Artigo.Id_categoria = Categorias.Id_categoria
INNER JOIN Usuario ON Artigo.Id_user = Usuario.Id_user
WHERE Categorias.Nome LIKE '%dieta%' OR
Usuario.PrimeiroNome LIKE '%dieta%' OR
Texto LIKE '%dieta%' OR
Titulo LIKE '%dieta%';

-- Criar Comentario
INSERT INTO Comentario(Titulo, Id_artigo, Id_user, Texto, Data, Publicado) VALUES
('Muito BOM!!!!', 1, 3, 'Gostei muito do artigo, achei bem informativo', '2021-06-30', TRUE);

-- Deletar Comentario
-- Ex: Apagar comentario 1
DELETE FROM Comentario WHERE Id_comentario = 1;

-- Editar Comentario
-- Ex: Editar comentario 2
UPDATE Comentario SET Texto = 'Gostei muito do artigo, achei bem interessante' WHERE Id_comentario = 2;

-- Buscar Comentarios
SELECT Comentario.Titulo, Artigo.Id_artigo, Comentario.Texto, Comentario.Data, Usuario.PrimeiroNome, Usuario.SegundoNome FROM Comentario
INNER JOIN Usuario ON Comentario.Id_user = Usuario.Id_user
INNER JOIN Artigo ON Comentario.Id_artigo = Artigo.Id_artigo
WHERE Publicado = TRUE AND Comentario.Id_artigo = Artigo.Id_artigo; 

-- Inserir Treino
INSERT INTO Treinos(Id_treino, Nivel_medio, Descricao, Parte_corpo) VALUES
(10, 'Intermediário', 'Este é um treino voltado para a definição dos músculos do peitoral', 'peitoral');

-- Inserindo os Exercícios do Treino
INSERT INTO Possui(Id_exercicio, Id_treino, Qtd_exercicios) VALUES
(5, 1, 4);

-- Excluir Treino
DELETE FROM Contem WHERE Id_treino = 2;
DELETE FROM Possui WHERE Id_treino = 2;
DELETE FROM Treinos WHERE Id_treino = 2;

-- Atualizar Treino
-- Ex: Atualizar para Dificil o treino 3
UPDATE Treinos SET Nivel_medio = 'Difícil' WHERE Id_treino = 3;

-- Buscar todos os Treinos e exibir os nomes dos Exercícios
SELECT Exercicio.Nome, Treinos.Id_treino, Treinos.Nivel_medio, Treinos.Parte_corpo FROM Exercicio
INNER JOIN Possui ON Exercicio.Id_exercicio = Possui.Id_exercicio
INNER JOIN Treinos ON Possui.Id_treino = Treinos.Id_treino;

-- Buscar treinos cadastrados em um usuário;
-- Ex: Buscar Treinos do usuário 1
SELECT Treinos.Parte_corpo FROM Treinos
INNER JOIN Contem ON Treinos.Id_treino = Contem.Id_treino
INNER JOIN Usuario ON Contem.Id_user = Usuario.Id_user
WHERE Usuario.Id_user = 1;

-- Adicionar Treino ao Usuário
INSERT INTO Contem(Id_user, Id_treino, Qtd_treinos) VALUES
(1, 3, 5);

-- Editar Treino de Usuário
UPDATE Contem SET Id_treino = 4 WHERE Id_user = 1;

-- Procurar Treinos com base no nome 
SELECT * FROM Treinos WHERE Parte_corpo LIKE '%peitoral%';

-- Buscar Informações de um exercício específico;
-- Ex: Id_exercício = 2
SELECT * FROM Exercicio WHERE Id_exercicio = 2;

-- Criar Exercício
INSERT INTO Exercicio(Nome, Nivel, Numero_series, Numero_repeticoes, Intervalo_medio) VALUES
('Abdominal Remador', 'Avançado', 3, 20, 60);

-- Excluir Exercício
-- Ex: Exercício 3
DELETE FROM Possui WHERE Id_exercicio = 3;
DELETE FROM Exercicio WHERE Id_exercicio = 3;

-- Editar Exercício
-- Ex: Atualizar nível para intermediário no exercicio 2
UPDATE Exercicio SET Nivel = 'Intermediário' WHERE Id_exercicio = 2;

-- Inserir Categoria
INSERT INTO Categorias(Id_categoria, Nome) VALUES
(11, 'Teste');

-- Editar Categoria
UPDATE Categorias SET Nome = 'Dieta' WHERE Id_categoria = 3;

-- Excluir Categoria
UPDATE Artigo SET Id_categoria = 1 WHERE Id_categoria = 3;
DELETE FROM Categorias WHERE Id_categoria = 3;
