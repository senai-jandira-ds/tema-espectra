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

INSERT INTO tb_paciente (foto, nome, cpf, data_nascimento, idade, id_serie_escolar, id_grau_suporte, id_usuario) VALUES
(NULL, 'Lucas Andrade', '68212059812', '2015-04-10', timestampdiff(YEAR, data_nascimento, CURDATE()), 4, 1, 1),
(NULL, 'Beatriz Oliveira', '75287318898', '2013-09-22', timestampdiff(YEAR, data_nascimento, CURDATE()), 6, 2, 1),
(NULL, 'Pedro Santos', '71121093884', '2011-01-30', timestampdiff(YEAR, data_nascimento, CURDATE()), 8, 1, 1),
(NULL, 'Juliana Costa', '50773850848', '2016-07-15', timestampdiff(YEAR, data_nascimento, CURDATE()), 3, 2, 2),
(NULL, 'Rafael Mendes', '50805139850', '2010-12-05', timestampdiff(YEAR, data_nascimento, CURDATE()), 9, 3, 2);

INSERT INTO tb_sigla_transtorno (sigla, nome_completo_transtorno) VALUES
('TDAH', 'Transtorno do Déficit de Atenção com Hiperatividade'),
('TEA', 'Transtorno do Espectro Autista'),
('TAG', 'Transtorno de Ansiedade Generalizada'),
('TAB', 'Transtorno Afetivo Bipolar'),
('TOC', 'Transtorno Obsessivo-Compulsivo'),
('TEPT', 'Transtorno de Estresse Pós-Traumático'),
('TPL', 'Transtorno de Personalidade Borderline'),
('TOD', 'Transtorno Opositor Desafiador'),
('TDC', 'Transtorno Dismórfico Corporal'),
('TCA', 'Transtorno de Compulsão Alimentar'),
('TDA', 'Transtorno do Déficit de Atenção'),
('TPAS', 'Transtorno da Personalidade Antissocial'),
('TPN', 'Transtorno de Personalidade Narcisista'),
('TPE', 'Transtorno de Personalidade Esquizoide'),
('TP Esquizo', 'Transtorno de Personalidade Esquizotípica'),
('TPE-Evit', 'Transtorno de Personalidade Evitativa'),
('TPD', 'Transtorno de Personalidade Dependente'),
('TP Histri', 'Transtorno de Personalidade Histriônica'),
('T Pânico', 'Transtorno de Pânico'),
('TAS', 'Transtorno de Ansiedade Social'),
('Fob. Esp.', 'Fobia Específica'),
('Agorafob', 'Agorafobia'),
('T. Depr. M', 'Transtorno Depressivo Maior'),
('Distimia', 'Transtorno Depressivo Persistente'),
('T. Somat', 'Transtorno de Sintomas Somáticos'),
('T. Convers', 'Transtorno Conversivo'),
('T. Factíc', 'Transtorno Factício'),
('Anorexia', 'Anorexia Nervosa'),
('Bulimia', 'Bulimia Nervosa'),
('Insônia', 'Transtorno de Insônia'),
('Hipersônia', 'Transtorno de Hipersônia'),
('Narcolep', 'Narcolepsia'),
('Apneia', 'Apneia Obstrutiva do Sono'),
('Dislexia', 'Transtorno Específico de Aprendizagem com prejuízo na leitura'),
('Discalc', 'Transtorno Específico de Aprendizagem com prejuízo na matemática'),
('Tiques', 'Transtorno de Tiques'),
('Tourette', 'Transtorno de Tourette'),
('Esquizof', 'Esquizofrenia'),
('T. Esquizoa', 'Transtorno Esquizoafetivo'),
('T. Delir', 'Transtorno Delirante');

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


INSERT INTO tb_faixa_idade (idade_min, idade_max) VALUES
(0, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6);



INSERT INTO tb_status_atividade (status_atividade) VALUES
('Não iniciado'),
('Em andamento'),
('Concluído');


INSERT INTO tb_habilidade (nome) VALUES
('Socialização'),
('Linguagem'),
('Cognição'),
('Auto-Cuidados'),
('Desenvolvimento motor');



INSERT INTO tb_atividade_personalizada (questao, valor_meses, id_psicopedagogo, id_habilidade) VALUES
('Estende a mão em direção a um objeto oferecido', 6, 1, 6),
('Segue com o olhar um objeto em movimento', 4, 2, 7),
('Responde ao ser chamado pelo nome', 8, 3, 8),
('Imita gestos simples como bater palmas', 10, 4, 9),
('Segura objetos pequenos com as mãos', 5, 5, 10);



INSERT INTO tb_responsavel_paciente (id_responsavel, id_paciente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);



INSERT INTO tb_atividade_portage (numero_questao, questao, id_faixa_idade, id_habilidade) VALUES
(1, 'Segue com os olhos um objeto em movimento lateral', 1, 6),
(2, 'Responde ao sorriso de um adulto conhecido', 2, 7),
(3, 'Aponta para objetos desejados quando solicitado', 3, 8),
(4, 'Imita ações simples realizadas por um adulto', 4, 9),
(5, 'Empilha dois ou mais blocos quando solicitado', 5, 10);



INSERT INTO tb_atividade (id_status_atividade, id_paciente, id_atividade_personalizada, id_atividade_portage) VALUES
(1, 1, 6, NULL),
(2, 2, NULL, 2),
(3, 3, 7, NULL),
(1, 4, NULL, 4),
(2, 5, 8, NULL);




INSERT INTO tb_tipo_aplicacao (alternativa) VALUES
('Auxílio total'),
('Auxílio parcial'),
('Independente');



INSERT INTO tb_tentativa (resultado, observacao, data_tentativa, id_tipo_aplicacao, id_atividade) VALUES
(TRUE, 'Realizou a atividade com auxílio mínimo', '2026-04-10', 3, 11),
(FALSE, 'Não conseguiu completar mesmo com apoio', '2026-04-11', 1, 12),
(TRUE, 'Executou parcialmente a tarefa solicitada', '2026-04-12', 2, 13),
(TRUE, 'Concluiu a atividade de forma independente', '2026-04-13', 3, 14),
(FALSE, 'Demonstrou dificuldade de compreensão da tarefa', '2026-04-14', 2, 15);



INSERT INTO tb_formulario (id_paciente, id_atividade_portage, id_resposta) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2);



INSERT INTO tb_paciente_habilidade (anos_meses, id_paciente, id_habilidade) VALUES
(2.0, 1, 6),
(3.5, 2, 7),
(4.0, 3, 8),
(5.2, 4, 9),
(1.8, 5, 10);






