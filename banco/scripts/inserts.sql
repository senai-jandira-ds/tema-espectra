-- ----------------------------------
-- INSERTS
-- ----------------------------------
USE db_espectra;


INSERT INTO tb_tipo_usuario(tipo_usuario) VALUES ('Psicopedagogo'),('Responsável');


INSERT INTO tb_usuario (foto, nome, data_nascimento, telefone, email, senha, id_tipo_usuario) VALUES
(NULL, 'Gabriel Lacerda Correia', '2005-08-09', '(11) 92479-2057', 'gabriel@email.com', '123456@ABC', 1),
(NULL, 'Maria Cecília Pereira Jardim', '2008-03-21', '(11) 95324-6654', 'maria@email.com', '654321@CBA', 2);


INSERT INTO tb_serie_escolar (serie) VALUES
('MATERNAL'),
('JARDIM I'),
('JARDIM II'),
('1º ANO'),
('2º ANO'),
('3º ANO'),
('4º ANO'),
('5º ANO'),
('6º ANO'),
('7º ANO'),
('8º ANO'),
('9º ANO'),
('1º MÉDIO'),
('2º MÉDIO'),
('3º MÉDIO'),
('CONCLUIDO');


INSERT INTO tb_grau_suporte (grau) VALUES
('GRAU 1'),
('GRAU 2'),
('GRAU 3');


INSERT INTO tb_paciente (foto, nome, cpf, data_nascimento, id_serie_escolar, id_grau_suporte, id_usuario) VALUES
(NULL, 'Lucas Andrade', '68212059812', '2015-04-10', 4, 1, 2),
(NULL, 'Beatriz Oliveira', '75287318898', '2013-09-22', 6, 2, 2),
(NULL, 'Pedro Santos', '71121093884', '2011-01-30', 8, 1, 2),
(NULL, 'Juliana Costa', '50773850848', '2016-07-15', 3, 2, 2),
(NULL, 'Rafael Mendes', '50805139850', '2010-12-05', 9, 3, 2);

INSERT INTO tb_usuario_paciente (id_paciente, id_usuario) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2);

INSERT INTO tb_sigla_transtorno (sigla, nome_completo_transtorno) VALUES
('TDAH', 'Transtorno do Déficit de Atenção com Hiperatividade'),
('TEA', 'Transtorno do Espectro Autista'),
('TAG', 'Transtorno de Ansiedade Generalizada'),
('TAB', 'Transtorno Afetivo Bipolar'),
('TOC', 'Transtorno Obsessivo-Compulsivo'),
('TEPT', 'Transtorno de Estresse Pós-Traumático'),
('TPB', 'Transtorno de Personalidade Borderline'),
('TOD', 'Transtorno Opositor Desafiador'),
('TDC', 'Transtorno Dismórfico Corporal'),
('TCA', 'Transtorno de Compulsão Alimentar'),
('TDA', 'Transtorno do Déficit de Atenção'),
('TPAS', 'Transtorno da Personalidade Antissocial'),
('TPN', 'Transtorno de Personalidade Narcisista'),
('TPE', 'Transtorno de Personalidade Esquizoide'),
('TPEQT', 'Transtorno de Personalidade Esquizotípica'),
('TPEV', 'Transtorno de Personalidade Evitativa'),
('TPD', 'Transtorno de Personalidade Dependente'),
('TPH', 'Transtorno de Personalidade Histriônica'),
('TP', 'Transtorno de Pânico'),
('TAS', 'Transtorno de Ansiedade Social'),
('FE', 'Fobia Específica'),
('AG', 'Agorafobia'),
('TDM', 'Transtorno Depressivo Maior'),
('TDP', 'Transtorno Depressivo Persistente (Distimia)'),
('TSS', 'Transtorno de Sintomas Somáticos'),
('TC', 'Transtorno Conversivo'),
('TF', 'Transtorno Factício'),
('AN', 'Anorexia Nervosa'),
('BN', 'Bulimia Nervosa'),
('TI', 'Transtorno de Insônia'),
('TH', 'Transtorno de Hipersônia'),
('NARC', 'Narcolepsia'),
('AOS', 'Apneia Obstrutiva do Sono'),
('DISL', 'Transtorno Específico de Aprendizagem com prejuízo na leitura (Dislexia)'),
('DISC', 'Transtorno Específico de Aprendizagem com prejuízo na matemática (Discalculia)'),
('TT', 'Transtorno de Tiques'),
('ST', 'Transtorno de Tourette'),
('SZ', 'Esquizofrenia'),
('TEAF', 'Transtorno Esquizoafetivo'),
('TD', 'Transtorno Delirante');


INSERT INTO tb_paciente_transtorno (id_paciente, id_sigla_transtorno) VALUES
-- Paciente 1 com TDAH e TEA
(1, 1), 
(1, 2),

-- Paciente 2 com TAG e TOC
(2, 3),
(2, 5);


INSERT INTO tb_resposta_formulario (alternativa) VALUES
('Sim'),
('Não'),
('Sim com mediação');



INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES
(0, 1, 0.0089),
(1, 2, 0.0128),
(2, 3, 0.0086),
(3, 4, 0.0121),
(4, 5, 0.0109),
(5, 6, 0.0098);


INSERT INTO tb_habilidade (nome) VALUES
('Socialização'),
('Linguagem'),
('Cognição'),
('Auto-Cuidados'),
('Desenvolvimento motor');

INSERT INTO tb_paciente_habilidade (idade_meses, id_paciente, id_habilidade) VALUES
(0.0, 1, 1),
(0.0, 1, 2),
(0.0, 1, 3),
(0.0, 1, 4),
(0.0, 1, 5),
(0.0, 2, 1),
(0.0, 2, 2),
(0.0, 2, 3),
(0.0, 2, 4),
(0.0, 2, 5),
(0.0, 3, 1),
(0.0, 3, 2),
(0.0, 3, 3),
(0.0, 3, 4),
(0.0, 3, 5),
(0.0, 4, 1),
(0.0, 4, 2),
(0.0, 4, 3),
(0.0, 4, 4),
(0.0, 4, 5),
(0.0, 5, 1),
(0.0, 5, 2),
(0.0, 5, 3),
(0.0, 5, 4),
(0.0, 5, 5);


INSERT INTO tb_atividade_personalizada (comportamento, valor_meses, id_usuario, id_habilidade) VALUES
('Estende a mão em direção a um objeto oferecido', 1, 1, 1),
('Segue com o olhar um objeto em movimento', 1, 1, 1),
('Responde ao ser chamado pelo nome', 1, 1, 1),
('Imita gestos simples como bater palmas', 1, 1, 1),
('Segura objetos pequenos com as mãos', 2, 1, 1);


-- 0 a 1 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (0, 1, 0.036 * 12); -- ID 1
-- 1 a 2 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (1, 2, 0.067 * 12); -- ID 2
-- 2 a 3 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (2, 3, 0.125 * 12); -- ID 3
-- 3 a 4 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (3, 4, 0.084 * 12); -- ID 4
-- 4 a 5 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (4, 5, 0.112 * 12); -- ID 5
-- 5 a 6 soc
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (5, 6, 0.091 * 12); -- ID 6

INSERT INTO tb_atividade_portage (numero_questao, comportamento, id_faixa_idade, id_habilidade) VALUES
-- Socialização - 0 a 1 ano (id_faixa_idade = 1)
(1, 'Observa uma pessoa movimentando-se em seu campo visual.', 1, 1),
(2, 'Sorri em resposta à atenção do adulto.', 1, 1),
(3, 'Vocaliza em resposta à atenção.', 1, 1),
(4, 'Olha para sua própria mão, sorrindo ou vocalizando.', 1, 1),
(5, 'Responde a seu círculo familiar, sorrindo, vocalizando ou parando de chorar.', 1, 1),
(6, 'Sorri em resposta à expressão facial dos outros.', 1, 1),
(7, 'Sorri e vocaliza ao ver sua imagem no espelho', 1, 1),
(8, 'Acaricia ou toca no rosto de adultos (puxa cabelo, nariz, óculos, etc.).', 1, 1),
(9, 'Estende a mão em direção a um objeto oferecido.', 1, 1),
(10, 'Estende os braços em direção a pessoas familiares.', 1, 1),
(11, 'Estende a mão e toca sua imagem refletida no espelho.', 1, 1),
(12, 'Segura e examina por 1 minuto um objecto que lhe foi dado.', 1, 1),
(13, 'Sacode ou aperta um objeto colocado em sua mão, produzindo sons involuntários.', 1, 1),
(14, 'Brinca sozinho por 10 minutos.', 1, 1),
(15, 'Procura contato visual quando alguém lhe dá atenção por 2 a 3 minutos.', 1, 1),
(16, 'Brinca sozinho sem reclamar por 15 a 20 minutos, próximo de um adulto.', 1, 1),
(17, 'Vocaliza para obter atenção.', 1, 1),
(18, 'Imita adulto em brincadeiras de esconde-esconde.', 1, 1),
(19, 'Bate palmas, imitando um adulto.', 1, 1),
(20, 'Acena a mão, imitando um adulto.', 1, 1),
(21, 'Ergue os braços para expressar "grande", imitando um adulto.', 1, 1),
(22, 'Oferece algo, mas nem sempre entrega.', 1, 1),
(23, 'Abraça, acaricia e beija familiares.', 1, 1),
(24, 'Responde ao próprio nome, olhando ou estendendo o braço para ser pego.', 1, 1),
(25, 'Aperta ou sacode um brinquedo para produzir sons, em imitação.', 1, 1),
(26, 'Manipula brinquedo ou objeto.', 1, 1),
(27, 'Estende um brinquedo ou objeto a um adulto e o entrega.', 1, 1),
(28, 'Imita movimentos de outras crianças ao brincar.', 1, 1),

-- Socialização - 1 a 2 anos (id_faixa_idade = 2)
(29, 'Imita um adulto em uma tarefa simples.', 2, 1),
(30, 'Brinca ao lado de outra criança, cada uma realizando tarefas diferentes.', 2, 1),
(31, 'Toma parte em uma brincadeira com outra criança por 2 a 5 minutos.', 2, 1),
(32, 'Aceita a ausência dos pais, embora possa reclamar.', 2, 1),
(33, 'Explora ativamente seu meio ambiente.', 2, 1),
(34, 'Realiza atividade manipulativa com outra pessoa.', 2, 1),
(35, 'Abraça e carrega uma boneca ou brinquedo macio.', 2, 1),
(36, 'Repete ações que produzem risos e atenção.', 2, 1),
(37, 'Dá um livro para que um adulto o leia ou para que ambos o compartilhem.', 2, 1),
(38, 'Puxa uma pessoa a mostrar-lhe algo.', 2, 1),
(39, 'Retira a mão ou diz "não" quando está próximo de um objeto não permitido e alguém o lembra disto.', 2, 1),
(40, 'Quando colocado em sua cadeira ou trocador espera ser atendido.', 2, 1),
(41, 'Brinca com 2 ou 3 crianças da sua idade.', 2, 1),
(42, 'Compartilha um objeto ou alimento com outra criança.', 2, 1),
(43, 'Cumprimenta colegas ou adultos quando lembrado.', 2, 1),

-- Socialização - 2 a 3 anos (id_faixa_idade = 3)
(44, 'Obedece às ordens dos pais pelo menos 1½ das vezes.', 3, 1),
(45, 'Busca / leva um objeto ou pessoa, quando solicitado.', 3, 1),
(46, 'Presta atenção à estória ou música por 5 a 10 min.', 3, 1),
(47, 'Diz "Por favor" ou "Obrigado" quando lembrado.', 3, 1),
(48, 'Tenta ajudar os pais a executarem tarefas realizando parte da mesma.', 3, 1),
(49, 'Brinca de usar roupas de adultos.', 3, 1),
(50, 'Faz uma escolha quando indagado.', 3, 1),
(51, 'Demonstra entender sentimentos, expressando-os.', 3, 1),

-- Socialização - 3 a 4 anos (id_faixa_idade = 4)
(52, 'Canta e dança ao ouvir músicas.', 4, 1),
(53, 'Segue regras de um jogo imitando ações de outras crianças.', 4, 1),
(54, 'Cumprimenta pessoas familiares sem ser lembrado.', 4, 1),
(55, 'Seguem regras em jogos de grupos dirigidos por adultos.', 4, 1),
(56, 'Pede permissão para brincar com um brinquedo que está sendo usado por outra criança.', 4, 1),
(57, 'Diz "Por favor" e "Obrigado" sem ser lembrado 1½ das vezes.', 4, 1),
(58, 'Atende ao telefone, chamando um adulto e falando com pessoas familiares.', 4, 1),
(59, 'Espera a sua vez.', 4, 1),
(60, 'Segue regras em jogos dirigidos por uma criança mais velha.', 4, 1),
(61, 'Obedece às ordens de um adulto 75% das vezes.', 4, 1),
(62, 'Permanece em seu próprio quintal ou jardim.', 4, 1),
(63, 'Brinca perto de outras crianças conversando com elas enquanto trabalha em um projeto próprio (30 min.).', 4, 1),

-- Socialização - 4 a 5 anos (id_faixa_idade = 5)
(64, 'Pede ajuda quando está tendo dificuldades.', 5, 1),
(65, 'Contribui para a conversa de adultos.', 5, 1),
(66, 'Repete rimas, canções ou dança para os outros.', 5, 1),
(67, 'Faz uma tarefa sozinha por 20 a 30 minutos.', 5, 1),
(68, 'Pede desculpas sem ser lembrado 75% das vezes.', 5, 1),
(69, 'Espera sua vez em brincadeiras que envolvam de 8 a 9 crianças.', 5, 1),
(70, 'Brinca com 2 a 3 crianças por 20 min. em uma atividade que envolva cooperação.', 5, 1),
(71, 'Quando em público, apresenta um comportamento socialmente aceitável.', 5, 1),
(72, 'Pede permissão para usar objetos dos outros em 75% das vezes.', 5, 1),

-- Socialização - 5 a 6 anos (id_faixa_idade = 6)
(73, 'Manifesta seus sentimentos.', 6, 1),
(74, 'Brinca com 4 a 5 crianças em atividade de cooperação por 20 minutos, sem supervisão.', 6, 1),
(75, 'Explica aos outros as regras do jogo ou atividade.', 6, 1),
(76, 'Imita papéis de adulto.', 6, 1),
(77, 'Colabora para a conversa durante as refeições.', 6, 1),
(78, 'Segue regras de jogo que envolva raciocínio verbal.', 6, 1),
(79, 'Conforta colegas quando estes estão tristes.', 6, 1),
(80, 'Escolhe seus próprios amigos.', 6, 1),
(81, 'Planeja e constrói, usando ferramentas simples.', 6, 1),
(82, 'Estabelece metas para si próprio e executa atividade para atingi-las.', 6, 1),
(83, 'Dramatiza trechos de histórias, desempenhando um papel ou utilizando fantoches.', 6, 1);

-- ========================================================
-- FAIXAS ETÁRIAS - LINGUAGEM
-- ========================================================
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (0, 1, 0.100 * 12);  -- ID 7
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (1, 2, 0.0555 * 12); -- ID 8
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (2, 3, 0.0333 * 12); -- ID 9
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (3, 4, 0.0833 * 12); -- ID 10
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (4, 5, 0.0666 * 12); -- ID 11
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (5, 6, 0.0714 * 12); -- ID 12

-- ========================================================
-- ATIVIDADES - LINGUAGEM (id_habilidade = 2)
-- ========================================================
INSERT INTO tb_atividade_portage (numero_questao, comportamento, id_faixa_idade, id_habilidade) VALUES
-- 0 a 1 ano (id_faixa_idade = 7)
(1, 'Repete sons emitidos por outras pessoas.', 7, 2),
(2, 'Repete a mesma sílaba 2 a 3 vezes.', 7, 2),
(3, 'Responde a gestos com gestos.', 7, 2),
(4, 'Obedece a uma ordem simples, quando acompanhada de gestos indicativos.', 7, 2),
(5, 'Interrompe a atividade quando lhe dizem "Não" 75% das vezes.', 7, 2),
(6, 'Responde a perguntas simples com respostas não verbais.', 7, 2),
(7, 'Combina 2 sílabas diferentes quando tenta verbalizar.', 7, 2),
(8, 'Imita padrões de entonação da voz de outras pessoas.', 7, 2),
(9, 'Usa uma palavra funcionalmente para indicar objetos ou pessoas.', 7, 2),
(10, 'Vocaliza em resposta à fala de outras pessoas.', 7, 2),

-- 1 a 2 anos (id_faixa_idade = 8)
(11, 'Diz 5 palavras diferentes.', 8, 2),
(12, 'Pede "mais".', 8, 2),
(13, 'Diz "acabou".', 8, 2),
(14, 'Obedece a 3 ordens diferentes que não são acompanhadas de gestos indicativos.', 8, 2),
(15, 'Consegue "dar" ou "mostrar" quando solicitado.', 8, 2),
(16, 'Aponta para 12 objetos quando nomeados.', 8, 2),
(17, 'Aponta para 3 a 5 figuras em um livro.', 8, 2),
(18, 'Aponta para 3 partes de seu próprio corpo.', 8, 2),
(19, 'Diz seu nome ou apelido quando solicitado.', 8, 2),
(20, 'Responde à pergunta "O que é isto?"', 8, 2),
(21, 'Combina palavras e gestos para expressar desejos.', 8, 2),
(22, 'Nomeia 5 membros da família, incluindo animais.', 8, 2),
(23, 'Nomeia 4 brinquedos.', 8, 2),
(24, 'Produz sons de animais, ou os nomeia pelo som.', 8, 2),
(25, 'Pede alimentos conhecidos pelo nome, quando mostrados.', 8, 2),
(26, 'Faz perguntas variando a entonação da voz.', 8, 2),
(27, 'Nomeia 3 partes do corpo em uma boneca ou outra pessoa.', 8, 2),
(28, 'Responde a perguntas de sim / não.', 8, 2),

-- 2 a 3 anos (id_faixa_idade = 9)
(29, 'Combina substantivos ou adjetivos e substantivos em frases de 2 palavras.', 9, 2),
(30, 'Combina substantivo e verbo em frases de 2 palavras', 9, 2),
(31, 'Usa uma palavra para indicar que quer ir ao banheiro', 9, 2),
(32, 'Combina verbo ou substantivo com "lá" e "aqui" em frases de 2 palavras.', 9, 2),
(33, 'Combina 2 palavras para expressar posse.', 9, 2),
(34, 'Emprega "não" na fala.', 9, 2),
(35, 'Responde à pergunta "O que .... está fazendo?" para atividade habituais.', 9, 2),
(36, 'Responde a perguntas tipo "Onde está objeto?"', 9, 2),
(37, 'Nomeia sons ambientais familiares.', 9, 2),
(38, 'Dá mais de um objeto quando se usa a forma plural na solicitação.', 9, 2),
(39, 'Ao falar, refere-se a si próprio pelo nome.', 9, 2),
(40, 'Aponta para figuras de objetos comuns descritos pelo uso (hasta 10) ("O que se usa pra comer? = colher")', 9, 2),
(41, 'Mostra a idade pelos dedos.', 9, 2),
(42, 'Diz seu sexo quando solicitado.', 9, 2),
(43, 'Obedece à seqüência de duas ordens relacionadas.', 9, 2),
(44, 'Usa a forma do verbo no gerúndio.', 9, 2),
(45, 'Emprega formas regulares no plural.', 9, 2),
(46, 'Emprega algumas formas irregulares de verbos no passado de forma sistemática.', 9, 2),
(47, 'Faz perguntas do tipo "O que é isso?"', 9, 2),
(48, 'Controla o volume da voz 90% das vezes.', 9, 2),
(49, 'Usa "este / esta" e "aquele / aquela" na fala.', 9, 2),
(50, 'Emprega "é" e "está" em frases simples.', 9, 2),
(51, 'Diz "eu", "mim", "meu" ao invés do próprio nome.', 9, 2),
(52, 'Aponta objetos e diz que eles não são outras coisas.', 9, 2),
(53, 'Responde à pergunta "Quem?" dando um nome.', 9, 2),
(54, 'Emprega as formas possessivas dos substantivos.', 9, 2),
(55, 'Usa artigos ao falar.', 9, 2),
(56, 'Usa substantivos que indicam grupo ou categoria.', 9, 2),
(57, 'Usa os verbos "ser", "estar" e "ter" no presente com poucos erros.', 9, 2),
(58, 'Diz se os objetos estão abertos ou fechados.', 9, 2),

-- 3 a 4 anos (id_faixa_idade = 10)
(59, 'Expressa diminutivos e aumentativos quando fala.', 10, 2),
(60, 'Presta atenção por 5 minutos a uma estória lida.', 10, 2),
(61, 'Obedece à sequência de 2 ordens não relacionadas.', 10, 2),
(62, 'Diz seu nome completo quando solicitado.', 10, 2),
(63, 'Responde perguntas simples envolvendo "Como".', 10, 2),
(64, 'Emprega verbos regulares, no passado.', 10, 2),
(65, 'Relata experiências imediatas.', 10, 2),
(66, 'Diz como são usados objetos comuns.', 10, 2),
(67, 'Expressa ações futuras empregando os verbos "ir", "ter" e "querer".', 10, 2),
(68, 'Utiliza adequadamente masculino e feminino na fala.', 10, 2),
(69, 'Usa formas imperativas de verbos ao pedir favores.', 10, 2),
(70, 'Conta 2 fatos na ordem de ocorrência.', 10, 2),

-- 4 a 5 anos (id_faixa_idade = 11)
(71, 'Obedece a uma sequência envolvendo 3 ordens.', 11, 2),
(72, 'Demonstra compreensão de verbos reflexivos, usando-os ocasionalmente (ex. ele se machucou).', 11, 2),
(73, 'Consegue identificar objetos/figuras que formem par, sob solicitação.', 11, 2),
(74, 'Emprega o futuro ao falar.', 11, 2),
(75, 'Usa orações compostas por coordenação.', 11, 2),
(76, 'Consegue identificar a parte de cima e de baixo de objetos, quando solicitado.', 11, 2),
(77, 'Emprega ocasionalmente o condicional ao falar (poderia, pudesse, iria, seria, faria).', 11, 2),
(78, 'Consegue identificar absurdos em figuras.', 11, 2),
(79, 'Emprega as seguintes palavras: irmã(o), avó, avô.', 11, 2),
(80, 'Completa frases com antônimos.', 11, 2),
(81, 'Relata uma estória conhecida sem ajuda de figuras.', 11, 2),
(82, 'Em uma figura, nomeia o objeto que não pertence a uma determinada categoria.', 11, 2),
(83, 'Diz se duas palavras rimam ou não.', 11, 2),
(84, 'Usa frases complexas, compostas por subordinação.', 11, 2),
(85, 'Diz se um som é forte ou fraco.', 11, 2),

-- 5 a 6 anos (id_faixa_idade = 12)
(86, 'Consegue indicar alguns, muitos e vários elementos.', 12, 2),
(87, 'Diz seu endereço.', 12, 2),
(88, 'Diz o número de seu telefone.', 12, 2),
(89, 'Aponta para o conjunto que tem mais, menos ou poucos elementos.', 12, 2),
(90, 'Conta piadas simples.', 12, 2),
(91, 'Relata experiências diárias.', 12, 2),
(92, 'Descreve um local ou movimento: através ou entre, longe de, de / desde..., para, por cima de, até.', 12, 2),
(93, 'Responde à pergunta "Porque" com uma explicação.', 12, 2),
(94, 'Ordena e conta uma estória de 2 a 5 episódios na sequência correta.', 12, 2),
(95, 'Define palavras.', 12, 2),
(96, 'Responde adequadamente a pergunta "Qual o contrário de ...".', 12, 2),
(97, 'Responde a pergunta "O que acontece se...".', 12, 2),
(98, 'Usa "ontem" e "amanhã, corretamente".', 12, 2),
(99, 'Pergunta o significado de perguntas novas ou conhecidas.', 12, 2);

-- ========================================================
-- FAIXAS ETÁRIAS - COGNIÇÃO
-- ========================================================
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (0, 1, 0.0714 * 12); -- ID 13
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (1, 2, 0.100 * 12);  -- ID 14
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (2, 3, 0.0625 * 12); -- ID 15
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (3, 4, 0.0416 * 12); -- ID 16
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (4, 5, 0.0454 * 12); -- ID 17
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (5, 6, 0.0454 * 12); -- ID 18

-- ========================================================
-- ATIVIDADES - COGNIÇÃO (id_habilidade = 3)
-- ========================================================
INSERT INTO tb_atividade_portage (numero_questao, comportamento, id_faixa_idade, id_habilidade) VALUES
-- 0 a 1 ano (id_faixa_idade = 13)
(1, 'Remove um pano do rosto que obscureça sua visão.', 13, 3),
(2, 'Procura com o olhar um objeto que foi tirado de seu campo visual.', 13, 3),
(3, 'Remove um objeto de um recipiente colocando a mão dentro do mesmo.', 13, 3),
(4, 'Coloca um objeto em um recipiente imitando um adulto.', 13, 3),
(5, 'Coloca um objeto em um recipiente quando recebe instruções.', 13, 3),
(6, 'Balança um brinquedo que produz som, pendurado em um barbante.', 13, 3),
(7, 'Coloca três objetos em um recipiente e o esvazia.', 13, 3),
(8, 'Transfere um objeto de uma mão à outra para apanhar outro objeto.', 13, 3),
(9, 'Deixa cair e apanha um brinquedo.', 13, 3),
(10, 'Descobre um objeto escondido sob um recipiente.', 13, 3),
(11, 'Empurra 3 blocos como se fosse um comboio.', 13, 3),
(12, 'Remove um círculo de uma prancha, por imitação.', 13, 3),
(13, 'Coloca um pino redondo em uma prancha de pinos, quando solicitado.', 13, 3),
(14, 'Executa gestos simples quando requisitado.', 13, 3),

-- 1 a 2 anos (id_faixa_idade = 14)
(15, 'Retira 6 objetos de um recipiente, um por vez.', 14, 3),
(16, 'Aponta para uma parte do corpo.', 14, 3),
(17, 'Empilha 3 blocks, dada a ordem.', 14, 3),
(18, 'Emparelha objetos semelhantes.', 14, 3),
(19, 'Faz rabiscos no papel.', 14, 3),
(20, 'Aponta para si quando perguntam "Cadê o Fulano?"', 14, 3),
(21, 'Coloca 5 pinos redondos, dada a ordem.', 14, 3),
(22, 'Emparelha objetos com a figura do mesmo nome.', 14, 3),
(23, 'Aponta para a figura nomeada.', 14, 3),
(24, 'Vira as páginas de um livro (2/3 por vez) para encontrar a figura nomeada.', 14, 3),

-- 2 a 3 anos (id_faixa_idade = 15)
(25, 'Encontra determinado livro quando solicitado.', 15, 3),
(26, 'Completa um quebra-cabeça de encaixe de 3 peças.', 15, 3),
(27, 'Nomeia 4 objetos comuns em figuras.', 15, 3),
(28, 'Desenha uma linha vertical imitando um adulto.', 15, 3),
(29, 'Desenha uma linha horizontal imitando um adulto.', 15, 3),
(30, 'Copia um círculo.', 15, 3),
(31, 'Emparelha objetos com a mesma textura.', 15, 3),
(32, 'Aponta o "pequeno" e o "grande" quando solicitado.', 15, 3),
(33, 'Desenha (+) imitando um adulto.', 15, 3),
(34, 'Emparelha 3 cores.', 15, 3),
(35, 'Coloca objetos dentro, em cima e em baixo de um recipiente, dada a ordem.', 15, 3),
(36, 'Nomeia objetos quando ouve o barulho que fazem.', 15, 3),
(37, 'Monta um brinquedo de encaixe de 4 peças.', 15, 3),
(38, 'Nomeia ações em figuras ("O que ... está fazendo?").', 15, 3),
(39, 'Emparelha forma geométrica com a figura da mesma.', 15, 3),
(40, 'Empilha 5 ou mais argolas em uma vara na ordem.', 15, 3),

-- 3 a 4 anos (id_faixa_idade = 16)
(41, 'Nomeia objetos como sendo grandes ou pequenos.', 16, 3),
(42, 'Aponta para 10 partes do corpo quando requisitado.', 16, 3),
(43, 'Aponta para menino e menina, dada a ordem.', 16, 3),
(44, 'Diz se um objeto é pesado ou leve.', 16, 3),
(45, 'Une 2 partes de uma figura para formar o todo.', 16, 3),
(46, 'Descreve 2 eventos ou personagens de uma estória familiar ou programa de televisão.', 16, 3),
(47, 'Repete brincadeiras (rimas ou canções) que envolvam movimentos coordenados.', 16, 3),
(48, 'Emparelha 3 ou mais objetos.', 16, 3),
(49, 'Aponta para objetos compridos ou curtos.', 16, 3),
(50, 'Associa objetos correspondentes. Ex: meia/sapato.', 16, 3),
(51, 'Conta até 3 imitando um adulto.', 16, 3),
(52, 'Agrupa objetos em categorias.', 16, 3),
(53, 'Traça um (V) em imitação.', 16, 3),
(54, 'Traça uma linha diagonal dado o exemplo.', 16, 3),
(55, 'Conta até 10 objetos, imitando um adulto.', 16, 3),
(56, 'Constrói uma ponte com 3 blocos por imitação.', 16, 3),
(57, 'Emparelha uma sequência ou padrão (tamanho, cor) de blocos ou contas.', 16, 3),
(58, 'Copia uma série de (V) interligados.', 16, 3),
(59, 'Acrescenta perna ou braço em um desenho incompleto da figura humana.', 16, 3),
(60, 'Completa um quebra-cabeças de 6 peças.', 16, 3),
(61, 'Indica se os objetos são iguais ou diferentes.', 16, 3),
(62, 'Desenha um quadrado imitando um adulto.', 16, 3),
(63, 'Nomeia 3 cores sendo requisitado.', 16, 3),
(64, 'Nomeia 3 formas geométricas (quadrado, triângulo e círculo).', 16, 3),

-- 4 a 5 anos (id_faixa_idade = 17)
(65, 'Apanha de 1 a 5 objetos quando solicitado.', 17, 3),
(66, 'Nomeia 5 texturas diferentes.', 17, 3),
(67, 'Copia um triângulo ao ser requisitado.', 17, 3),
(68, 'Recorda-se de 4 objetos que haviam sido vistos em uma figura.', 17, 3),
(69, 'Diz o momento do dia associado a cada atividade.', 17, 3),
(70, 'Repete rimas familiares.', 17, 3),
(71, 'Diz se um objeto é mais pesado ou mais leve (objetos com diferença de 0,5 quilo).', 17, 3),
(72, 'Diz o que está faltando quando um objeto é retirado de um grupo de 3 objetos.', 17, 3),
(73, 'Nomeia 8 cores.', 17, 3),
(74, 'Identifica o valor de 3 moedas.', 17, 3),
(75, 'Emparelha símbolos (letras e números).', 17, 3),
(76, 'Diz a cor de objetos nomeados.', 17, 3),
(77, 'Relata 5 principais fatos de uma história contada 3x.', 17, 3),
(78, 'Desenha figura humana (cabeça, tronco e 4 membros)', 17, 3),
(79, 'Canta 5 estrofes de uma canção.', 17, 3),
(80, 'Constrói uma pirâmide de 10 blocos por imitação.', 17, 3),
(81, 'Nomeia objetos como sendo compridos ou curtos.', 17, 3),
(82, 'Coloca objetos "atrás", "ao lado" ou "junto" a outros.', 17, 3),
(83, 'Faz conjuntos iguais de 10 objetos, segundo modelo.', 17, 3),
(84, 'Nomeia ou aponta para a parte ausente da figura.', 17, 3),
(85, 'Conta de 1 a 20.', 17, 3),
(86, 'Identifica o objeto que está colocado no meio, em primeiro e em último lugar.', 17, 3),

-- 5 a 6 anos (id_faixa_idade = 18)
(87, 'Conta até 20 objetos e responde adequadamente à pergunta: "Quantos ... você contou?"', 18, 3),
(88, 'Nomeia 10 numerais.', 18, 3),
(89, 'Identifica qual a sua esquerda e qual a sua direita.', 18, 3),
(90, 'Diz as vogais em ordem.', 18, 3),
(91, 'Escreve seu nome com letras de forma.', 18, 3),
(92, 'Nomeia 5 letras do alfabeto.', 18, 3),
(93, 'Ordena objetos em sequência de comprimento e largura.', 18, 3),
(94, 'Nomeia as letras maiúsculas do alfabeto.', 18, 3),
(95, 'Coloca numerais de 1 a 10 na sequência correta.', 18, 3),
(96, 'Identifica a posição de objetos em 1º, 2º e 3º lugar.', 18, 3),
(97, 'Nomeia as letras minúsculas do alfabeto.', 18, 3),
(98, 'Emparelha letras maiúsculas com minúsculas.', 18, 3),
(99, 'Aponta para numerais de 1 a 25.', 18, 3),
(100, 'Copia um losango.', 18, 3),
(101, 'Completa um labirinto simples.', 18, 3),
(102, 'Diz os dias da semana na ordem.', 18, 3),
(103, 'Soma e subtrai combinações de até 3 elementos.', 18, 3),
(104, 'Diz o mês e o dia de seu aniversário.', 18, 3),
(105, 'Lê 10 palavras impressas.', 18, 3),
(106, 'Prediz o que vai ocorrer.', 18, 3),
(107, 'Aponta para objetos inteiros e partidos ao meio.', 18, 3),
(108, 'Conta de memória de 1 a 100 (pedir que pare no 40, e continue no 80, caso não erre até o 40).', 18, 3);

-- ========================================================
-- FAIXAS ETÁRIAS - AUTO CUIDADOS
-- ========================================================
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (0, 1, 0.0769 * 12); -- ID 19
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (1, 2, 0.0833 * 12); -- ID 20
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (2, 3, 0.0370 * 12); -- ID 21
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (3, 4, 0.0666 * 12); -- ID 22
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (4, 5, 0.0434 * 12); -- ID 23
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (5, 6, 0.0714 * 12); -- ID 24

-- ========================================================
-- ATIVIDADES - AUTO CUIDADOS (id_habilidade = 4)
-- ========================================================
INSERT INTO tb_atividade_portage (numero_questao, comportamento, id_faixa_idade, id_habilidade) VALUES
-- 0 a 1 ano (id_faixa_idade = 19)
(1, 'Suga e deglute líquidos.', 19, 4),
(2, 'Toma mingau / sopinha.', 19, 4),
(3, 'Estende as mãos em direção a mamadeira, tentando pegá-la.', 19, 4),
(4, 'Come alimentos liquidificados dados pelos pais.', 19, 4),
(5, 'Segura a mamadeira sem ajuda enquanto bebe.', 19, 4),
(6, 'Leva a mamadeira até a boca ou a recusa, empurrando-a.', 19, 4),
(7, 'Come alimentos amassados dados pelos pais.', 19, 4),
(8, 'Bebe em uma caneca, segurada pelos pais.', 19, 4),
(9, 'Come alimentos semissólidos dados pelos pais.', 19, 4),
(10, 'Alimenta-se sozinho usando os dedos.', 19, 4),
(11, 'Segura a caneca com ambas as mãos e bebe.', 19, 4),
(12, 'Leva a colher cheia de comida até a boca com ajuda.', 19, 4),
(13, 'Estica braços e pernas ao ser vestido.', 19, 4),

-- 1 a 2 anos (id_faixa_idade = 20)
(14, 'Come com colher de modo independente.', 20, 4),
(15, 'Segura a caneca com uma só mão e bebe.', 20, 4),
(16, 'Coloca a mão na água e dá tapinhas no rosto com as mãos molhadas, imitando alguém.', 20, 4),
(17, 'Senta-se em um piniquinho ou sanitário infantil por 5 min.', 20, 4),
(18, 'Coloca um chapéu na cabeça e o remove.', 20, 4),
(19, 'Tira as meias.', 20, 4),
(20, 'Empurra os braços pelas mangas e os pés pelas pernas da calça.', 20, 4),
(21, 'Tira os sapatos quando os cordões estiverem desamarrados', 20, 4),
(22, 'Tira o casaco quando desabotoado.', 20, 4),
(23, 'Tira a calça quando desabotoada.', 20, 4),
(24, 'Puxa um fecho grande para cima e para baixo.', 20, 4),
(25, 'Utiliza palavras ou gestos indicando necessidade de ir ao banheiro.', 20, 4),

-- 2 a 3 anos (id_faixa_idade = 21)
(26, 'Alimenta-se sozinho usando colher ou caneca, derrubando um pouco de comida ou derramando pouco líquido.', 21, 4),
(27, 'Quando recebe uma toalha enxuga as mãos e o rosto com ajuda.', 21, 4),
(28, 'Suga líquido do copo ou caneca usando canudinho.', 21, 4),
(29, 'Dá garfadas.', 21, 4),
(30, 'Mastiga e engole apenas substâncias comestíveis.', 21, 4),
(31, 'Enxuga as mãos sem ajuda ao lhe darem uma toalha.', 21, 4),
(32, 'Avisa que quer ir ao banheiro, mesmo sendo tarde demais.', 21, 4),
(33, 'Controla sua baba.', 21, 4),
(34, 'Urina ou defeca quando colocado no piniquinho pelo menos 3 vezes por semana.', 21, 4),
(35, 'Calça os sapatos.', 21, 4),
(36, 'Escova os dentes imitando um adulto.', 21, 4),
(37, 'Retira roupas simples que foram desabotoadas.', 21, 4),
(38, 'Usa o banheiro para defecar (falha apenas 1x por semana).', 21, 4),
(39, 'Obtém água de uma torneira sem ajuda.', 21, 4),
(40, 'Lava as mãos e o rosto com um sabonete.', 21, 4),
(41, 'Avisa que quer ir ao banheiro durante o dia a tempo.', 21, 4),
(42, 'Pendura o casaco em um gancho da sua altura.', 21, 4),
(43, 'Permanece seco ao dormir durante o dia.', 21, 4),
(44, 'Evita riscos, por ex: pontas em móveis e escadas sem corrimão.', 21, 4),
(45, 'Usa guardanapo quando recomendado.', 21, 4),
(46, 'Espeta o garfo na comida, levando-a a boca.', 21, 4),
(47, 'Despeja líquido de uma peq. jarra para o copo sem ajuda.', 21, 4),
(48, 'Desprende roupas presas com o feixe de pressão.', 21, 4),
(49, 'Lava seus braços e pernas ao lhe darem banho.', 21, 4),
(50, 'Coloca meias.', 21, 4),
(51, 'Veste casaco, malha ou camisa.', 21, 4),
(52, 'Identifica a parte dianteira da roupa.', 21, 4),

-- 3 a 4 anos (id_faixa_idade = 22)
(53, 'Alimenta-se sozinho por toda a refeição.', 22, 4),
(54, 'Veste-se só, precisando de ajuda apenas quanto há malhas ou camisetas com golas fechadas ou botões e fechos.', 22, 4),
(55, 'Enxuga o nariz quando lembrado.', 22, 4),
(56, 'Acorda seco 2 manhãs por semana.', 22, 4),
(57, 'Se menino, urina no sanitário, em pé.', 22, 4),
(58, 'Veste-se e despe-se sozinho, exceto quanto à botões e fechos em 75% das vezes.', 22, 4),
(59, 'Fecha a roupa com fechos de pressão ou de gancho.', 22, 4),
(60, 'Assoa o nariz quando lembrado.', 22, 4),
(61, 'Evita perigos corriqueiros, por ex: caco de vidro.', 22, 4),
(62, 'Pendura roupa no cabide e põe no armário quando pedem.', 22, 4),
(63, 'Escova os dentes quando recebe instrução.', 22, 4),
(64, 'Coloca luvas.', 22, 4),
(65, 'Desabotoa botões grandes.', 22, 4),
(66, 'Abotoa botões grandes.', 22, 4),
(67, 'Calça botas.', 22, 4),

-- 4 a 5 anos (id_faixa_idade = 23)
(68, 'Limpa o que derramou por conta própria.', 23, 4),
(69, 'Evita veneno e todas as substâncias prejudiciais.', 23, 4),
(70, 'Desabotoa sua roupa.', 23, 4),
(71, 'Abotoa sua roupa.', 23, 4),
(72, 'Retira prato e talheres da mesa.', 23, 4),
(73, 'Encaixa fecho em sua terminação.', 23, 4),
(74, 'Lava as mãos e o rosto.', 23, 4),
(75, 'Usa talher apropriado para alimentar-se.', 23, 4),
(76, 'Acorda de noite para ir ao banheiro, ou acorda seco.', 23, 4),
(77, 'Limpa e assua o nariz em 75% das vezes sem ser lembrado', 23, 4),
(78, 'Toma banho só, precisando de ajuda apenas para lavar as costas, pescoço e orelhas.', 23, 4),
(79, 'Usa faca para espalhar manteiga no pão.', 23, 4),
(80, 'Aperta e afrouxa cintos ou fivelas.', 23, 4),
(81, 'Veste-se sozinho, mas não dá laços.', 23, 4),
(82, 'Serve-se à mesa enquanto seguram a travessa de comida.', 23, 4),
(83, 'Ajuda a pôr a mesa corretamente quando recebe instruções.', 23, 4),
(84, 'Escova os dentes.', 23, 4),
(85, 'Vai ao banheiro a tempo, retira a roupa, usa papel higiênico, dá descarga e veste-se sem ajuda.', 23, 4),
(86, 'Penteia ou escova cabelos.', 23, 4),
(87, 'Pendura roupas em cabides.', 23, 4),
(88, 'Anda pela vizinhança sem constante supervisão.', 23, 4),
(89, 'Enfia cordões em sapatos.', 23, 4),
(90, 'Amarra ou dá laços nos cordões dos sapatos.', 23, 4),

-- 5 a 6 anos (id_faixa_idade = 24)
(91, 'É responsável por uma tarefa semanal e a executa ao ser lembrado.', 24, 4),
(92, 'Seleciona roupas apropriadas ao clima e ocasião.', 24, 4),
(93, 'Pára no passeio, olha para ambos os lados, e atravessa a rua sem precisar ser lembrado.', 24, 4),
(94, 'Serve-se à mesa e passa aos demais a panela de comida.', 24, 4),
(95, 'Prepara sua própria caneca de café com leite.', 24, 4),
(96, 'É responsável por uma tarefa diária em casa.', 24, 4),
(97, 'Ajusta a temperatura da água para o banho.', 24, 4),
(98, 'Prepara seu próprio lanche.', 24, 4),
(99, 'Anda sozinho até a distância de 2 quadras de casa.', 24, 4),
(100, 'Corta alimentos tenros com faca.', 24, 4),
(101, 'Encontra o banheiro em local público, corretamente.', 24, 4),
(102, 'Abre a embalagem de leite.', 24, 4),
(103, 'Apanha uma bandeja com comida, levando-a e pondo sobre a mesa.', 24, 4),
(104, 'Amarra os cordões em casacos com capuz.', 24, 4),
(105, 'Aperta o cinto de segurança do automóvel.', 24, 4);

-- ========================================================
-- FAIXAS ETÁRIAS - DESENVOLVIMENTO MOTOR
-- ========================================================
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (0, 1, 0.0222 * 12); -- ID 25
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (1, 2, 0.0555 * 12); -- ID 26
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (2, 3, 0.0588 * 12); -- ID 27
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (3, 4, 0.0666 * 12); -- ID 28
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (4, 5, 0.0625 * 12); -- ID 29
INSERT INTO tb_faixa_idade (idade_min, idade_max, valor_atividade) VALUES (5, 6, 0.0344 * 12); -- ID 30

-- ========================================================
-- ATIVIDADES - DESENVOLVIMENTO MOTOR (id_habilidade = 5)
-- ========================================================
INSERT INTO tb_atividade_portage (numero_questao, comportamento, id_faixa_idade, id_habilidade) VALUES
-- 0 a 1 ano (id_faixa_idade = 25)
(1, 'Alcança um objeto colocado à sua frente (15 a 20 cm.).', 25, 5),
(2, 'Apanha um objeto colocado à sua frente (8 cm.).', 25, 5),
(3, 'Estende os braços em direção a um objeto à sua frente e o apanha.', 25, 5),
(4, 'Alcança um objeto preferido.', 25, 5),
(5, 'Coloca objetos na boca.', 25, 5),
(6, 'Eleva a cabeça e o tronco apoiando-se nos braços, ao estar deitado de barriga para baixo.', 25, 5),
(7, 'Levanta a cabeça e o tronco apoiando-se em um só braço.', 25, 5),
(8, 'Toca e explora objetos com a boca.', 25, 5),
(9, 'Em DV (decúbito ventral, de bruços), vira de lado e mantém esta posição ½ das vezes.', 25, 5),
(10, 'Em DV, vira de costas.', 25, 5),
(11, 'Em DV, move-se para frente o equivalente à sua altura.', 25, 5),
(12, 'Em DD (decúbito dorsal), rola para o lado.', 25, 5),
(13, 'Em DD, vira de barriga para baixo.', 25, 5),
(14, 'Faz esforço para sentar-se, segurando nos dedos do adulto.', 25, 5),
(15, 'Vira a cabeça com facilidade quando o corpo está apoiado.', 25, 5),
(16, 'Mantém-se sentado por 2 minutos.', 25, 5),
(17, 'Solta um objeto para apanhar outro.', 25, 5),
(18, 'Apanha e deixa cair um objeto propositalmente.', 25, 5),
(19, 'Fica em pé com o máximo de apoio.', 25, 5),
(20, 'Estando em pé com apoio, pula para cima e para baixo.', 25, 5),
(21, 'Engatinha para apanhar um objeto (distante a sua altura).', 25, 5),
(22, 'Senta-se apoiando-se sozinho.', 25, 5),
(23, 'Estando sentado, vira de gatinhas.', 25, 5),
(24, 'Estando em DV consegue sentar-se.', 25, 5),
(25, 'Senta-se sem o apoio das mãos.', 25, 5),
(26, 'Atira objetos ao acaso.', 25, 5),
(27, 'Balança para frente e para trás quando de gatinhas.', 25, 5),
(28, 'Transfere objetos de uma mão para outra quando sentado.', 25, 5),
(29, 'Retém em uma das mãos 2 cubos de 2,5 cm.', 25, 5),
(30, 'Fica de joelhos.', 25, 5),
(31, 'Fica em pé, apoiando-se em algo.', 25, 5),
(32, 'Usa preensão de pinça para pegar objetos.', 25, 5),
(33, 'Engatinha.', 25, 5),
(34, 'Estando de gatinhas, estende uma das mãos para o alto.', 25, 5),
(35, 'Fica em pé com o mínimo de apoio.', 25, 5),
(36, 'Lambe a comida ao redor da boca.', 25, 5),
(37, 'Mantém-se em pé sozinho por um minuto.', 25, 5),
(38, 'Derruba um objeto que está dentro de um recipiente.', 25, 5),
(39, 'Vira várias páginas de um livro ao mesmo tempo.', 25, 5),
(40, 'Escava com uma colher ou pá.', 25, 5),
(41, 'Coloca pequenos objetos dentro do recipiente.', 25, 5),
(42, 'Estando de pé, abaixa-se e senta.', 25, 5),
(43, 'Bate palmas.', 25, 5),
(44, 'Anda com um mínimo de apoio.', 25, 5),
(45, 'Dá alguns passos sem apoio.', 25, 5),

-- 1 a 2 anos (id_faixa_idade = 26)
(46, 'Sobe escadas engatinhando.', 26, 5),
(47, 'Coloca-se em pé, estando sentado.', 26, 5),
(48, 'Rola uma bola imitando um adulto.', 26, 5),
(49, 'Sobe em uma cadeira de adulto, vira-se e senta.', 26, 5),
(50, 'Coloca 4 aros em uma pequena estaca.', 26, 5),
(51, 'Retira pinos de 2,5 cm de uma prancha ou tabuleiro.', 26, 5),
(52, 'Encaixa pinos de 2,5 cm em uma prancha de encaixe.', 26, 5),
(53, 'Constrói uma torre de 3 blocos.', 26, 5),
(54, 'Faz traços no papel com lápis ou lápis de cera.', 26, 5),
(55, 'Anda sozinho.', 26, 5),
(56, 'Desce escadas sentado, colocando primeiro os pés.', 26, 5),
(57, 'Senta-se em uma cadeirinha.', 26, 5),
(58, 'Agacha-se e volta a ficar em pé.', 26, 5),
(59, 'Empurra e puxa brinquedos ao andar.', 26, 5),
(60, 'Usa cadeira ou cavalo de balanço.', 26, 5),
(61, 'Sobe escadas com ajuda.', 26, 5),
(62, 'Dobra o corpo sem cair para apanhar objetos no chão.', 26, 5),
(63, 'Imita um movimento circular.', 26, 5),

-- 2 a 3 anos (id_faixa_idade = 27)
(64, 'Enfia 4 contas grandes em um cordão em 2 minutos.', 27, 5),
(65, 'Vira trincos ou maçanetas em portas.', 27, 5),
(66, 'Salta no mesmo local com ambos os pés.', 27, 5),
(67, 'Anda de costas.', 27, 5),
(68, 'Desce escadas sem ajuda.', 27, 5),
(69, 'Atira uma bola a um adulto à 1 ½ de distância.', 27, 5),
(70, 'Constrói uma torre de 5 a 6 blocos.', 27, 5),
(71, 'Vira páginas de um livro, uma por vez.', 27, 5),
(72, 'Desembrulha um pequeno objeto.', 27, 5),
(73, 'Dobra um papel ao meio, imitando um adulto.', 27, 5),
(74, 'Desmancha e reconstrói brinquedos de encaixe por pressão.', 27, 5),
(75, 'Desenrosca brinquedos que se encaixam por roscas.', 27, 5),
(76, 'Chuta uma bola grande que está imóvel.', 27, 5),
(77, 'Faz bolas de argila, barro ou massinha.', 27, 5),
(78, 'Segura o lápis entre o polegar e o indicador, apoiando-o sobre o dedo médio.', 27, 5),
(79, 'Dá cambalhota para frente com ajuda.', 27, 5),
(80, 'Dá marteladas para encaixar 5 pinos em seus orifícios.', 27, 5),

-- 3 a 4 anos (id_faixa_idade = 28)
(81, 'Faz um quebra cabeça de 3 peças.', 28, 5),
(82, 'Corta algo em pedaços com tesoura.', 28, 5),
(83, 'Pula de uma altura de 20 cm.', 28, 5),
(84, 'Chuta uma bola grande quando enviada para si.', 28, 5),
(85, 'Anda na ponta dos pés.', 28, 5),
(86, 'Corre 10 passos coordenando e alternando o movimento dos braços e pés.', 28, 5),
(87, 'Pedala com triciclo a distância de 1 metro e ½.', 28, 5),
(88, 'Balança em um balanço quando este está em movimento.', 28, 5),
(89, 'Sobe em um escorregador de 1,20m a 1,80m e escorrega.', 28, 5),
(90, 'Dá cambalhotas para frente.', 28, 5),
(91, 'Sobe escadas alternando os pés.', 28, 5),
(92, 'Marcha (anda de forma ritmada).', 28, 5),
(93, 'Apara a bola com ambas as mãos.', 28, 5),
(94, 'Desenha figuras seguindo contornos ou pontilhados.', 28, 5),
(95, 'Recorta ao longo de uma linha reta 20 cm, afastando-se pouco da linha.', 28, 5),

-- 4 a 5 anos (id_faixa_idade = 29)
(96, 'Fica em um só pé sem apoio por 4 a 8 segundos.', 29, 5),
(97, 'Muda de direção ao correr.', 29, 5),
(98, 'Anda sobre uma viga ou tábua, mantendo o equilíbrio.', 29, 5),
(99, 'Pula para frente 10 vezes sem cair.', 29, 5),
(100, 'Salta sobre uma corda suspensa a 5 cm do solo.', 29, 5),
(101, 'Pula de costas 6 vezes.', 29, 5),
(102, 'Rebate e apanha uma bola grande.', 29, 5),
(103, 'Une 2 a 3 pedaços de massa de modelar.', 29, 5),
(104, 'Recorta em torno de linhas curvas.', 29, 5),
(105, 'Encaixa objetos de rosca.', 29, 5),
(106, 'Desce escadas alternando os pés.', 29, 5),
(107, 'Pedala um triciclo fazendo curvas.', 29, 5),
(108, 'Salta em um só pé 5 vezes consecutivas.', 29, 5),
(109, 'Recorta um círculo em 5 cm.', 29, 5),
(110, 'Desenha figuras simples facilmente identificáveis (por ex: casa).', 29, 5),
(111, 'Recorta e cola formas simples.', 29, 5),

-- 5 a 6 anos (id_faixa_idade = 30)
(112, 'Escreve letras de imprensa maiúsculas, isoladas e grandes em qualquer lugar do papel.', 30, 5),
(113, 'Anda sobre uma tábua para trás, para frente e para os lados, mantendo o equilíbrio.', 30, 5),
(114, 'Caminha saltitando.', 30, 5),
(115, 'Balança em um balanço iniciando e mantendo o movimento.', 30, 5),
(116, 'Estica os dedos tocando o polegar em cada um deles.', 30, 5),
(117, 'Copia letras maiúsculas.', 30, 5),
(118, 'Sobe em escadas de mão ou de escorregador de 3 m.', 30, 5),
(119, 'Bate em um prego com martelo.', 30, 5),
(120, 'Rebate a bola à medida que anda com direção.', 30, 5),
(121, 'Consegue colorir sem sair da margem em 95% das vezes.', 30, 5),
(122, 'Recorta figuras sem sair mais que 6 mm da margem.', 30, 5),
(123, 'Usa apontador de lápis.', 30, 5),
(124, 'Copia desenhos complexos (escola, navio).', 30, 5),
(125, 'Rasga figuras simples de um papel.', 30, 5),
(126, 'Dobra um papel quadrado 2x em diagonal por imitação.', 30, 5),
(127, 'Apanha uma bola leve com uma só mão.', 30, 5),
(128, 'Pula corda sozinho.', 30, 5),
(129, 'Golpeia uma bola com um bastão ou pedaço de pau.', 30, 5),
(130, 'Apanha um objeto no chão enquanto corre.', 30, 5),
(131, 'Patina uma distância de 3 m, ou usa skate.', 30, 5),
(132, 'Anda de bicicleta.', 30, 5),
(133, 'Escorrega descendo um monte de areia ou terra.', 30, 5),
(134, 'Anda ou brinca em piscina tendo água até a cintura.', 30, 5),
(135, 'Conduz um patinete dando impulso com um só pé.', 30, 5),
(136, 'Salta e gira em um só pé.', 30, 5),
(137, 'Escreve seu nome com letras de forma em caderno pautado.', 30, 5),
(138, 'Salta de uma altura de 30 cm e cai na ponta dos pés.', 30, 5),
(139, 'Pára em um só pé sem apoio com olhos fechados por 10 segundos.', 30, 5),
(140, 'Dependura-se por 10 segundos em uma barra horizontal.', 30, 5);


INSERT INTO tb_atividade (id_paciente, id_atividade_personalizada, id_atividade_portage) VALUES
(1, 1, null),
(1, 2, null),
(1, 3, null),
(2, 4, null),
(2, 5, null),
(1, null, 1),
(1, null, 2),
(1, null, 3),
(2, null, 2),
(2, null, 4);


INSERT INTO tb_tipo_aplicacao (alternativa) VALUES
('Independente'),
('Auxílio parcial'),
('Auxílio total');


INSERT INTO tb_tentativa (resultado, observacao, data_tentativa, id_tipo_aplicacao, id_atividade) VALUES
(TRUE, 'Realizou a atividade com auxílio mínimo', curdate(), 1, 1),
(FALSE, 'Não conseguiu completar mesmo com apoio', curdate(), 2, 2),
(TRUE, 'Executou parcialmente a tarefa solicitada', curdate(), 3, 3),
(TRUE, 'Concluiu a atividade de forma independente', curdate(), 1, 4),
(FALSE, 'Demonstrou dificuldade de compreensão da tarefa', curdate(), 2, 5);

INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta)
SELECT 1, id, NULL 
FROM tb_atividade_portage 
ORDER BY id ASC;

INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta)
SELECT 2, id, NULL 
FROM tb_atividade_portage 
ORDER BY id ASC;

INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta)
SELECT 3, id, NULL 
FROM tb_atividade_portage 
ORDER BY id ASC;

INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta)
SELECT 4, id, NULL 
FROM tb_atividade_portage 
ORDER BY id ASC;

INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta)
SELECT 5, id, NULL 
FROM tb_atividade_portage 
ORDER BY id ASC;
