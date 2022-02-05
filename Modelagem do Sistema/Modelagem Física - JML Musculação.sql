-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
-- Nomes: Josu� Hass, Leonardo Fagundes, Lu�s Henrique e Mateus Alayo Hidalgo Schulz.
-- Projetor Integrador 3INFO3 - JML Muscula��o.

DROP DATABASE projeto_integrador;

CREATE DATABASE projeto_integrador;
USE projeto_integrador;

-- Definindo a estrutura do modelo físico

CREATE TABLE Treinos (
Id_treino int not null PRIMARY KEY,
Nivel_medio varchar(20),
Descricao Text,
Parte_corpo varchar(100)
);

CREATE TABLE Possui (
Id_exercicio int not NULL,
Id_treino int NOT NULL,
Qtd_exercicios int,
FOREIGN KEY(Id_treino) REFERENCES Treinos (Id_treino)
);

CREATE TABLE Exercicio (
Nome varchar(80),
Nivel varchar(20),
Id_exercicio int not null AUTO_INCREMENT PRIMARY KEY,
Numero_series smallint,
Numero_repeticoes smallint,
Intervalo_medio int
);

CREATE TABLE Perfil (
Id_perfil int not null AUTO_INCREMENT PRIMARY KEY,
Idade int,
Altura float,
Id_user int not NULL,
Peso float,
Sexo_biologico varchar(20),
URL_imagem text
);

CREATE TABLE Categorias (
Nome Varchar(80) unique not null,
Id_categoria int not null PRIMARY KEY
);

CREATE TABLE Artigo (
Titulo varchar(120) not null,
URL_Imagem varchar(100),
Texto text,
Id_artigo int not NULL AUTO_INCREMENT PRIMARY KEY,
Id_categoria int not NULL,
Id_user int not NULL,
FOREIGN KEY(Id_categoria) REFERENCES Categorias (Id_categoria)
);

CREATE TABLE Comentario (
Titulo varchar(80),
Id_artigo int not NULL,
Id_user int not NULL,
Id_comentario int not null AUTO_INCREMENT PRIMARY KEY,
Texto text,
Data Date,
Publicado Bool,
FOREIGN KEY(Id_artigo) REFERENCES Artigo (Id_artigo)
);

CREATE TABLE Usuario (
Senha varchar(128) not null,
Id_user int not null AUTO_INCREMENT PRIMARY KEY,
Email varchar(255) not null,
Treinos Text,
PrimeiroNome varchar(150) not null,
SegundoNome varchar(150) not null,
Admin Bool not null
);

CREATE TABLE Contem (
Id_user int not NULL,
Id_treino int not NULL,
Qtd_treinos int,
FOREIGN KEY(Id_user) REFERENCES Usuario (Id_user),
FOREIGN KEY(Id_treino) REFERENCES Treinos (Id_treino)
);

ALTER TABLE Possui ADD FOREIGN KEY(Id_exercicio) REFERENCES Exercicio (Id_exercicio);
ALTER TABLE Perfil ADD FOREIGN KEY(Id_user) REFERENCES Usuario (Id_user);
ALTER TABLE Artigo ADD FOREIGN KEY(Id_user) REFERENCES Usuario (Id_user);
ALTER TABLE Comentario ADD FOREIGN KEY(Id_user) REFERENCES Usuario (Id_user);

-- Populando o Banco

INSERT INTO Usuario(Id_user, Email, senha, treinos, PrimeiroNome, SegundoNome, Admin) VALUES
(1, 'leonardof.rocio@gmail.com', 'senhadoprojeto', 'Treino de Perna, Treino de Costas, Treino de Peitoral', 'Leonardo', 'Fagundes', TRUE),
(2, 'mateus.ahschulz@gmail.com', 'liverpoolporamor', 'Treino de Perna, Treino de Braço Treino de Corpo Todo', 'Mateus', 'Schulz', TRUE),
(3, 'luis.schmitt@gmail.com', 'josuemeuamante', 'Treino de Panturrilha, Treino de Perna, Treino de Braço', 'Luis', 'Henrique', TRUE),
(4, "josuezinhogameplays@gmail.com", "josue123", "Treino de Bíceps", "Josué", "Hass", TRUE),
(5, "lucas_gonca@hotmail.com", "amomeupai9389438", "Treino de Perna", "Lucas", "Gonçalvez", FALSE),
(6, "luana.silva@gmail.com", "queroviajar!!", "Treino de Quadril", "Luana", "Silva", FALSE),
(7, "roberto.barbosa.gmail.com", "OiMeuNomeé", "Treino de Glúteos", "Roberto", "Barbosa", FALSE);

INSERT INTO Treinos(Id_treino, Nivel_medio, Descricao, Parte_corpo) VALUES
(1, 'Iniciante', 'Este é um treino de braço com foco no bíceps', 'Braços'),
(2, 'Intermediário', 'Este é um treino de perna sem foco específico', 'Pernas'),
(3, 'Iniciante', 'Este é um treino de costas com foco na dorsal', 'Costas'),
(4, 'Iniciante', 'Este é um treino de peitoral sem foco específico', 'Peitoral'),
(5, 'Intermediário', 'Este é um treino de braço com foco no tríceps', 'Braços'),
(6, 'Iniciante', 'Este é um treino de abdômen sem foco específico', 'Abdômen'),
(7, 'Intermediário', 'Este é um treino de peitoral e tríceps com ênfase no peitoral', 'Peitoral');

INSERT INTO Exercicio(Id_exercicio, Nome, Nivel, Numero_series, Numero_repeticoes, Intervalo_medio) VALUES
(1, 'Tríceps no Banco', 'Intermediário', 3, 15, 60),
(2, 'Flexão Aberta', 'Iniciante', 4, 12, 70),
(3, 'Flexão Fechada', 'Intermediário', 3, 15, 60),
(4, 'Agachamento Livre', 'Iniciante', 4, 12, 60),
(5, 'Abdominal Supra', 'Iniciante', 3, 20, 60),
(6, 'Abdominal Infra', 'Iniciante', 3, 20, 60),
(7, 'Barra Fixa', 'Avançado', 3, 10, 75);

INSERT INTO Categorias(Id_categoria, Nome) VALUES
(1, 'Alimentação'),
(2, 'Equipamentos'),
(3, 'Suplementos'),
(4, 'Treinos'),
(5, 'Exercícios'),
(6, 'Dietas'),
(7, 'Calistenia');

INSERT INTO Contem(Id_user, Id_treino, Qtd_treinos) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3);

INSERT INTO Possui(Id_exercicio, Id_treino, Qtd_exercicios) VALUES
(1, 1, 5),
(1, 2, 5),
(2, 3, 6),
(3, 3, 5),
(4, 4, 6),
(5, 6, 7),
(6, 7, 8);

INSERT INTO Artigo(Id_artigo, Id_user, Id_categoria, Titulo, Texto, URL_Imagem) VALUES
(1, 1, 4, 'O QUE É MUSCULAÇÃO?', 'A musculação é uma modalidade de treinamento físico realizado contra resistência de pesos externos, chamada também de treino resistido, que tem como objetivo o aumento hipertrofia muscular, ganho de força e potência. É uma atividade de duração instantânea e elevada intensidade.

Não é uma modalidade esportiva, mas contribui para a preparação de múltiplos atletas de diversas modalidades, além de ser o alicerce do treinamento de culturismo e também de algumas modalidades olímpicas como o levantamento de peso.

A musculação é a principal atividade nas academias para preparação física, contribui além do crescimento muscular com a diminuição da gordura corpórea e o incremento da massa óssea. Sua prática constante leva a transformação harmoniosa da constituição física humana.

Como funcionam os músculos do corpo humano
O conjunto de músculos do corpo humano constitui o sistema muscular. São cerca de 600 músculos que juntos representam de 40 a 50% do peso corporal. Sua função é de contrair, relaxar e gerar movimentos que nos possibilita andar, sentar, pular, correr, escrever, além de favorecer a circulação sanguínea no organismo, urinar, impelir o alimento ao longo do tubo digestivo, sorrir, respirar, piscar, enfim são incontáveis movimentos.

Toda nossa locomoção depende da ação conjunta dos ossos, articulações e músculos perante a regulação do sistema nervoso. Os músculos são classificados em voluntários, aqueles que se contraem de acordo com a vontade humana e os involuntários que são controlados pelo sistema nervoso vegetativo e não por controle voluntário. Esses são: o aparelho respiratório, as paredes das vísceras e o aparelho circulatório, são chamados músculos lisos (com exceção dos músculos cardíacos que são estriados).

Fazem parte dos músculos voluntários os chamados músculos esqueléticos, formados por estrias e mais conhecidos como músculos estriados. Os músculos esqueléticos são formados por fibras organizadas no mesmo agrupamento muscular e podem chegar a mais de 1 milhão de fibras musculares em cada agrupamento.

Essas fibras não são visíveis a olho nu. Cada uma delas é fixada ao osso através dos tendões com um nervo motor, formando uma unidade motora. Quando a unidade motora é estimulada por um impulso nervoso do cérebro ou da medula espinhal, ocorre a contração muscular. FONTE: Blog Educação Física.', "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20201609.png?alt=media&token=27b925bb-5a59-4e73-8dce-a63c756dcffa"),
(2, 2, 7, 'Calistenia: uma das formas mais naturais para definir o corpo', 'Segundo a School of Calisthenics, entidade mundial sobre calistenia, a prática é definida como um tipo de treinamento físico para a realização de movimentos acrobáticos e de força através da utilização do próprio peso corporal.

Os praticantes conseguem desenvolver habilidades físicas como equilíbrio, coordenação motora, consciência corporal e flexibilidade. Além disso, indica-se a calistenia àqueles que desejam um corpo definido, pois ajuda na perda de peso e no aumento da massa muscular.

Os exercícios calistênicos podem ser realizados em grupo ou ao ar livre, utilizando-se poucos acessórios (bastões, barra fixas) ou nenhum — nesse caso, o que se usa é apenas o corpo, como sobrecarga em movimentos diversos, como apoios, abdominais, saltos e corridas.

mulher fazendo exerícios
(Fonte: Shutterstock)
Cuidados
A calistenia é composta de vários exercícios intensos e complexos. Ainda assim, pode ser feita por pessoas de diferentes idades, de crianças a idosos, com ou sem deficiências, desde que todas as atividades, mesmo fora da academia, sejam supervisionadas por profissionais.

O ideal é começar com movimentos básicos para não se lesionar. Com o tempo, o praticante adquire consciência dos movimentos e das intensidades e aos poucos pode compatibilizar a modalidade com o seu condicionamento pessoal.

O grande segredo da calistenia é só realizar sequências que se tenha certeza de que estão sendo corretamente executadas. Outra recomendação é não forçar o corpo a fazer movimentos que possam ser prejudiciais à coluna vertebral, à postura ou à saúde.

Durante a prática, o corpo perde grande quantidade de líquidos e sais minerais, portanto é necessário se hidratar bastante.

Exercícios calistênicos
É importante começar com paciência e não tentar realizar exercícios com alta intensidade. A execução das ações mais complexas, com movimentos perfeitos, demanda disciplina, dedicação e muita prática, e os resultados são obtidos após muito trabalho físico.

Apoios 
Ótimos para a construção de músculos da região peitoral, ombros e tríceps, os apoios também contribuem para a estabilidade e a resistência muscular. 

Barra
Esse exercício exige melhor condicionamento físico dos adutores e extensores dos ombros, assim como dos flexores do cotovelo.

Agachamentos
Realizados com os pés alinhados com os ombros, os agachamentos são eficientes para fortalecer os músculos extensores do quadril e dos joelhos. É necessário que o praticante flexione os joelhos e o quadril e, logo após, estenda-os. São benéficos para o fortalecimento dos membros inferiores e apresentam diversas variações, com a modificação do posicionamento dos pés.

Abdominais
São exercícios para a definição da região do abdômen e têm algumas variações, tanto focando no reto abdominal superior quanto na sua porção inferior.

Prancha
A prancha fortalece o core, musculatura localizada ao redor de toda a região do tronco, na linha da coluna lombar. Esse conjunto de músculos é responsável por dar suporte e estabilizar bacia, pélvis e abdômen. Fonte: Selfit Academias', "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20202305.png?alt=media&token=f29405c2-10e5-4616-8a21-62a6e58dd686"),
(3, 4, 6, 'Dieta para perder até 5 kg em 2 semanas', 'Para emagrecer em 2 semanas é necessário ter uma dieta saudável e equilibrada, sendo importante incluir frutas, vegetais e alimentos integrais ricos em fibras, além de ser recomendado evitar o consumo de alimentos industrializados, frituras, comidas congeladas, como pizza e lasanha, embutidos, comidas rápidas, etc.

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
Outros alimentos que podem acelerar o metabolismo e, assim, favorecer a perda de peso, são os alimentos termogênicos, como canela, gengibre, pimenta vermelha, café, chá verde e vinagre de maçã, que também podem ser incluídos na dieta. Conheça mais sobre os alimentos termogênicos. Fonte: Tua Saúde' , "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20202034.png?alt=media&token=bc7b64be-dfed-48f2-ad5c-7de0860e480b"),
(4, 3, 3, 'WHEY PROTEIN: O QUE É, PARA QUE SERVE E COMO TOMAR', 'O QUE É WHEY PROTEIN?
Whey Protein é um suplemento proteico feito a partir da proteína extraída do soro do leite, composta principalmente por alfa-globulina e beta-globulina. O produto possui aminoácidos essenciais que são rapidamente absorvidos pelo corpo, substâncias que participam de forma ativa na construção de músculos e tecidos.

Para ser consumido, o Whey passa por um processo de industrialização que dá a consistência de pó. Como o seu gosto próprio não é lá muito saboroso, costuma-se adicionar sabores de chocolate, baunilha ou morango. Antes de consumir um produto que contém Whey, é importante ler a lista de ingredientes e checar as quantidades de açúcar refinados presente.

PARA QUE SERVE O WHEY PROTEIN?
Veja, abaixo, os principais usos do Whey Protein:

Exercícios

Segundo a Mayo Clinic, nos Estados Unidos, algumas evidências sugerem que o consumo de proteína do soro de leite aumenta a força e a massa muscular quando parte de um treinamento muscular. A proteína do leite também pode ser eficaz para ajudar a recuperação muscular após exercícios intensos.

Em um estudo feito por pesquisadores americanos, publicado em 2008 na revista científica Nutrition & Metabolismo, 158 participantes divididos em dois grupos receberam Whey Protein. A pesquisa concluiu que os participantes que receberam o alimentos perderam mais peso e preservaram mais massa muscular, em comparação aos que não o receberam.

Nutrição

A proteína do soro de leite pode ajudar no ganho de peso em pessoas desnutridas ou com problemas para ganhar e manter peso, como adultos idosos ou portadores de HIV. Um estudo feito pelo Hospital Geral de Montreal e pela Universidade de McGill, no Canadá, concluiu que pacientes que receberam Whey Protein apresentaram menor perda de peso.

Cicatrização de feridas

Também segundo a Mayo Clinic, a proteína do soro de leite pode beneficiar pessoas que se recuperam de queimaduras ou que possuem feridas crônicas, como as causadas pela diabetes.

Redução do colesterol Em um estudo publicados no British Journal of Nutrition, feito por pesquisadores australianos em 2010, 70 participantes acima do peso receberam Whey por 12 semanas. Eles concluíram que houve diminuição significativa do colesterol após o fim da pesquisa.

Pressão sanguínea e doenças cardiovasculares

Uma pesquisa publicada em 2010, feita por pesquisadores da Universidade Estadual de Washington, nos Estados Unidos, concluiu que bebidas suplementadas com Whey reduziram a pressão sanguínea em pacientes com hipertensão. Portanto, os riscos de desenvolver ataques cardíacos e acidente vascular cerebral foram reduzidos.

OS TIPOS DE WHEY PROTEIN?
Há três principais tipos de Whey Protein:

Concentrado

Possui entre 70% e 80% de proteínas. Em geral, contém lactose e gordura e é mais saboroso.

Isolado

Possui cerca de 90% de proteínas ou mais. Por consequência, contém menos lactose, gordura e minerais.

Hidrolisado

Nesse caso, as proteínas são pré-digeridas para serem absorvidas mais rápido pelo corpo. De acordo com um estudo feito por pesquisadores da Universidade de Limerick, na Irlanda, provoca um aumento maior nos níveis de insulina do que o isolado.

O Whey Protein Concentrado é mais popular, principalmente por ser mais saboroso e acessível. Para entender qual é a melhor opção para as suas necessidades e objetivos, consulte um médico.

COMO TOMAR WHEY PROTEIN
O Whey pode ser misturado à água ou ao leite e consumido como líquido, ou adicionado a iogurtes, cookies, bolos ou cereais.

Lembre-se que, em relação ao Whey Protein, as instruções variam de acordo com os seus objetivos e necessidades. Se praticar exercícios, também varia de acordo com o tipo de treino. Programas de treinamento intensos que causam danos teciduais, por exemplo, exigem o consumo de uma determinada quantidade de proteína para reparar esses tecidos.

O nutricionista pode indicar se é mais indicado tomá-lo após o treino ou é possível consumir em qualquer horário do dia.

Importante reforçar que o Whey é um suplemento, portanto, não anula a importância de consumir proteína regularmente na dieta. Além disso, também é preciso ficar atento ao consumo adequado de proteínas, pois quando ingerida em excesso, pode causar danos aos rins. Por isso, nunca utilize um suplemento proteico sem recomendação médica -- principalmente se você já tem problemas renais, como pedras no rim.

Portanto, tanto a quantidade a ser consumida, quanto a frequência e quando consumir devem ser orientados por um profissional de saúde de acordo com as condições de saúde, os objetivos e os hábitos da pessoa em questão. Fonte: Danone Nutricia.' , "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20202702.png?alt=media&token=86de85bb-ca09-4634-98af-14f7cc644510"),
(5, 3, 4, 'Os benefícios da musculação para a saúde', 'A musculação pode ser definida como um tipo de exercício físico realizado com pesos de diversas cargas, amplitude e tempo de contração variáveis, aplicável a pessoas de diversas idades e com diferentes objetivos.

Sua prática é vista por muitos apenas como uma forma de aumentar a massa muscular, no entanto, esse treinamento possui inúmeros benefícios, sendo inclusive capaz de combater a depressão, por exemplo.



Benefícios
A musculação melhora o condicionamento cardiorrespiratório, diminui a quantidade de gordura, auxilia o emagrecimento, diminui o risco de diabetes, aumenta a autonomia em idosos e garante mais disposição física.

O aumento da massa muscular é importante não apenas por uma questão estética: os músculos são responsáveis pelo aumento do metabolismo basal (calorias gastas para manter as funções vitais), por exigirem do organismo um maior gasto energético para sua manutenção.

Por sua vez, manter a musculatura ativa desencadeia a produção de hormônios responsáveis pela queima de gordura, pela sensação de bem-estar e pelo aumento da síntese proteica, aspectos de grande importância ao longo do processo de envelhecimento.



Idosos
No caso dos idosos, o trabalho muscular com pesos é decisivo para a qualidade de vida: serão menores os riscos de quedas com fraturas graves, menores as restrições articulares de movimento e menores os problemas relacionados à atrite e à artrose.

Normalmente, o objetivo principal do praticante de musculação é o ganho de massa magra, e algumas pessoas acreditam que só se consegue um maior volume muscular utilizando cargas elevadas. Entretanto, existem outras formas de manipular as variáveis do treino para torná-lo mais intenso sem aumentar a carga, obtendo resultados igualmente eficazes.



Intensidade
A intensidade é uma das variáveis mais importantes para o controle e manutenção dos resultados do treinamento, mas nada tem a ver com a carga que se utiliza durante as séries, o que é um dos equívocos quando o assunto é treinamento intenso.

Isto significa dizer que, para um planejamento efetivo do treinamento de musculação, deve-se fazer o máximo de repetições que conseguir, independentemente do peso utilizado, desde que não haja prejuízo à técnica correta de execução do exercício.

Por exemplo, ao utilizar um peso “leve” para realizar 20 repetições e não conseguir realizar a 21ª, a intensidade foi máxima. Por outro lado, ao utilizar uma carga elevada e interromper antes de chegar à falha, significa que o treino foi submáximo. Portanto, a intensidade relativa do primeiro caso será maior do que a do segundo, mesmo que a carga seja menor.

A manipulação correta da intensidade é importante para prevenir lesões ou complicações de saúde por excesso de treino, além da mensuração dos resultados de um programa de exercícios.
Em casos em que a carga utilizada está comprometendo a técnica ou o controle da amplitude de movimento e/ou da velocidade de execução, é mais seguro e efetivo priorizar a técnica correta e reduzir a carga, o que irá reduzir tanto as sobrecargas articulares e as compensações posturais, quanto a possibilidade do aparecimento de lesões.



Tempo
Outro ponto diz respeito ao tempo desprendido dentro da academia. Se o praticante passa muitas horas fazendo exercício, ele não treina intenso, e sim volumoso. Intensidade e volume são inversamente proporcionais.

Mesmo sem perceber, o esforço diminui à medida que aumentamos a quantidade de repetições e exercícios a serem realizados, da mesma forma que acontece em uma corrida. Se o percurso for uma maratona, certamente não iremos correr rápido desde o começo. Na musculação a lógica é a mesma. A intensidade de um treino de 1 hora certamente será menor do que a de um treino de 15 minutos.

Esta pequena reflexão sobre a intensidade de treino na musculação tem como objetivo ressaltar que o seu controle é peça fundamental para o sucesso de um programa de treinamento e que ela não está restrita ao aumento da carga.

Qualquer que seja o objetivo, ter em mãos todas as ferramentas para o controle da intensidade é a chave principal para possibilitar a variação dos estímulos aplicados em cada montagem de séries de exercícios e para a busca constante dos resultados almejados. Fonte: Ministério da Defesa Saúde Naval.', "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20202837%20(2).png?alt=media&token=17f19d2c-8886-496e-97e9-cb7daea70f9d"),
(6, 2, 1, 'Benefícios de uma alimentação saudável', 'A alimentação saudável é uma das melhores maneiras de garantir qualidade de vida, porque faz nosso corpo funcionar de forma adequada e também ajuda na prevenção de doenças.

Ela deve ser balanceada, rica em proteínas, gorduras, carboidratos, fibras, vitaminas, água e sais minerais. Esses itens são essenciais para todas as pessoas que pretendem ter uma vida melhor.A diversidade de grãos, verduras, legumes e frutas deve fazer parte das refeições do dia a dia.

O ideal é que a alimentação seja composta por uma fonte de carboidrato, uma de proteína e uma de gordura boa, além das fibras. Os benefícios podem ser observados em pouco tempo e só tendem a aumentar com o passar dos anos.

Prevenção de doenças
Comer alimentos saudáveis é uma forma de combater doenças crônicas, proporcionando a melhora na qualidade de vida. Muitos itens que ingerimos diariamente são associados ao desenvolvimento de doenças, como o câncer, doenças cardíacas, obesidade, diabetes e outras enfermidades crônicas como hipertensão e dislipidemia. Por isso, alimentos ricos em açúcares e gorduras simples devem ser consumidos moderadamente.

Retarda o envelhecimento
Comer bem também ajuda a evitar doenças que podem diminuir a expectativa de vida. O consumo de alimentos saudáveis, em combinação com exercícios, pode estender a expectativa de vida.

Equilíbrio hormonal
Sempre que comemos algo, nosso corpo libera hormônios em quantidades que podem estar em equilíbrio ou não.

Com um balanço entre proteínas e carboidratos, em cada refeição e lanches do seu dia, o organismo consegue manter os níveis dos hormônios equilibrados, auxiliando não só no combate à obesidade e ao diabetes, como em diversos outros fatores que afetam diretamente na nossa qualidade de vida.

Combate às dores corporais
Desconfortos musculares, como dores nas costas e nas pernas, podem ser resultados da má alimentação, causando indisposição para realizar as atividades do dia a dia.

Existem alimentos que previnem o desgaste muscular e auxiliam na sua regeneração. Além dos alimentos que tem propriedades anti-inflamatórias, como os peixes, gengibre e abacate.

Melhora do humor
Para ter uma mente saudável é necessário um corpo saudável. Se você fornecer ao seu corpo tudo que ele precisa, sua mente lhe recompensará.

Uma boa alimentação reduz alterações de humor e pode contribuir na manutenção da liberação do cortisol, o hormônio do estresse. Consumido os nutrientes adequados você vai se sentir mais equilibrado, em forma e com mais energia para aproveitar a sua vida ao máximo.

Aumenta a energia
A ingestão de alimentos saudáveis também garante mais energia e disposição para executar as atividades do cotidiano. Pessoas com maus hábitos alimentares tendem a sofrer de cansaço, mau humor, insônia, sobrepeso ou obesidade.

Bons hábitos alimentares proporcionam o equilíbrio dos nutrientes essenciais para o fornecimento de energia, além disso, alguns alimentos, como a banana, também podem despertar e fortalecer áreas cerebrais relacionadas ao humor. Fonte: Blog Saladices' , "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCapturar.PNG?alt=media&token=1992d906-df38-4539-9787-8ad04998f9f4"),
(7, 4, 2, 'Um Guia dos Equipamentos de Academia', 'De início, os equipamentos de academia podem parecer complicados. Especialmente se você é novato nos treinos com peso. Que equipamento eu uso? Como posso usá-lo? Quanto peso devo levantar? Há três maneiras de descobrir as respostas a essas perguntas: 1. Peça orientação do pessoal da academia, 2. Pergunte para quem está treinando ao seu lado, ou 3. Leia este artigo.

Primeiro, vamos apresentar a lista de equipamentos que você vai precisar para treinar com as Training Journeys do Freeletics com peso. A boa notícia é que você não vai precisar de muito equipamento e quase tudo pode ser encontrado na área de pesos livres da academia.

Barras
Pesos
Power racks com barras para pullups e dips
Banco
Cinto de Pesos
Máquina de Remo
Barras
Existem diferentes tipos de barras. A seguir estão as mais comuns que você vai encontrar em quase todas as academias.

Barras de Levantamento de Peso Olímpico

As que os homens chamam de Barras de Levantamento de Peso Olímpico, usadas nas competições padrão masculinas de levantamento de peso, pesam 20 kg, ou 45 lb. Enquanto que a versão feminina pesa 15 kg ou 33 lb. A barra de levantamento de peso pesa 25 kg ou 55 lb. Estas barras servem para todos os workouts no seu aplicativo Freeletics.

Peso: Normalmente 20 kg / 45 lb

A maioria das academias tem versões dessa barra que são mais curtas e mais leves, especialmente apropriadas para mulheres que começam a treinar com pesos mais leves no início.

Peso: Entre 7 kg e 15 kg. Pergunte ao pessoal da academia o peso exato antes de começar a usá-los.

Barra SE 
Esta barra pode ser usada para triceps extensions e barbell curls.

Peso: Entre 7,5 kg e 10 kg. Pergunte ao pessoal da academia o peso exato antes de começar a usá-los.

Barra de Tríceps 

Esta barra não deve ser usada nos workouts do Freeletics.

As chamadas barras padrões, ironicamente, não vem com peso padrão; se onde você treina usa esse tipo de barras, antes de começar pergunte ao pessoal da academia quanto elas pesam.

Nota geral: Por razões de segurança use sempre as travas de anilhas. Às vezes um dos lados do seu corpo pode ter mais dificuldade para empurrar, fazendo com que a barra suba torta o que por sua vez fará com que as anilhas deslizem para fora da extremidade da barra. Seja cuidadoso e prenda as anilhas com as travas.

Se você não puder encontrar a barra certa, você também pode treinar só com as anilhas.

Pesos
Na maioria das academias você vai encontrar as seguintes anilhas que serão necessárias para realizar os workouts com pesos do Freeletics.

Anilhas olímpicas variam entre 500 g (1.1 lb) e 30 kg (66 lb). Anilhas de levantamento de peso começam com 250 g (0.55 lb), e vão até 25 kg (55lb). Anilhas de peso padrão tem pesos variados. O peso da anilha – para a olímpica, levantamento de peso e peso padrão – aparece na lateral da anilha em quilos, libras ou ambos. Multiplique o peso da anilha em libras por 2,2 para obter o total em quilos.

Por favor, note que as sugestões de peso dadas a você sempre incluem a barra.

No começo pode ser difícil descobrir qual o peso a ser levantado mas, não se preocupe, com o passar do tempo esse cálculo vai se tornar uma rotina.

Como calcular os pesos 

Calcular o peso da sua barra e anilhas é uma questão de aritmética básica. O peso total inclui o peso da barra e o peso das anilhas. Por exemplo, se o peso sugerido no aplicativo for 50 kg, primeiro você tem que deduzir o peso da barra (suponhamos que seja 20 kg, você pode perguntar ao pessoal da academia se não tiver certeza) e depois dividir o peso restante (ou seja, 30 kg) em duas partes para obter o peso de cada lado (ou seja, 15 kg por anilha, o peso da anilha está escrito em sua lateral).

Power racks
Existem três tipos de racks encontrados em várias academias que podem ser usados com o aplicativo Freeletics Gym. O ideal é que o rack inclua uma barra de pullups e paralelas para dips.

Se você precisar subir a barra para fazer back ou front squat esta deve ser posicionada no ponto médio do seu esterno.

Nota: A principal função de um rack é a segurança. Por isso, você sempre deve usar as travas de segurança. Ajuste-as, para que fiquem um pouco abaixo da barra quando estiver na parte mais baixa do seu squat.

Bancos
Você vai precisar de um banco para alguns exercícios.

Cinto de pesos
Se a sua academia não tiver um cinto de pesos, você pode usar uma corrente com um mosquetão. Se estes também não estiverem disponíveis, é só posicionar entre as pernas o peso (anilha ou haltere) que você precisa, mas mantenha as pernas apertadas para mantê-lo no lugar.

O Freeletics Workouts só usa equipamento mínimo e básico. Por que? A gente quer que você tenha a liberdade de treinar a qualquer hora e em qualquer lugar. Sem desculpas. No Blog você pode aprender mais sobre métodos de Treinos do Freeletics com Pesos, treino por contraste e hipertrofia. Fonte: Freeletics.', "https://firebasestorage.googleapis.com/v0/b/jml-musculacao.appspot.com/o/images%2FCaptura%20de%20tela%202021-03-15%20210143.png?alt=media&token=d0db1c15-fe3e-4853-ae6f-b99c428e9a47");

INSERT INTO Comentario(Id_comentario, Id_artigo, Id_user, Titulo, Texto, Data, Publicado) VALUES
(1, 1, 1, 'Artigo muito bom!!', 'Gostei muito desse artigo, muito informativo', '2021-06-20', TRUE),
(2, 1, 2, 'Artigo razoável', 'O artigo poderia conter mais informações', '2021-06-24', TRUE),
(3, 1, 3, 'Muito bom', 'Gostei demais, me ajudou muito', '2021-06-23', TRUE),
(4, 1, 4, 'Artigo ruim', 'Não gostei muito desse artigo, ficou pouco informativo', '2021-06-22', TRUE),
(5, 1, 5, 'Artigo bosta', 'Esse artigo ficou uma m**** nunca deveria ter sido postado', '2021-06-21', FALSE),
(6, 1, 6, 'FICOU MUITO BOM!!!', 'ME AJUDOU DEMAIS, MUITO OBRIGADO, VOU COMPARTILHAR COM MEUS AMIGOS!', '2021-06-22', TRUE),
(7, 1, 7, 'Interessante', 'Achei a informação bem relevante e interessante', '2021-06-25', TRUE);