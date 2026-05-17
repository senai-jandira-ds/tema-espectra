CREATE DATABASE db_espectra;
USE db_espectra;

-- Usuario
CREATE TABLE tb_tipo_usuario(

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tipo_usuario VARCHAR(40) NOT NULL

);

CREATE TABLE tb_usuario(
	
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    foto VARCHAR(255) NULL,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    id_tipo_usuario INT NOT NULL,
    
    CONSTRAINT fk_tipo_usuario_usuario
    FOREIGN KEY (id_tipo_usuario) REFERENCES tb_tipo_usuario(id)
    
);

-- Paciente
CREATE TABLE tb_sigla_transtorno(

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sigla VARCHAR(20) NOT NULL,
    nome_completo_transtorno VARCHAR(100) NOT NULL

);

CREATE TABLE tb_serie_escolar(
	
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    serie VARCHAR(30) NOT NULL
    
);

CREATE TABLE tb_grau_suporte(
		
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	grau VARCHAR(30) NOT NULL
    
);

CREATE TABLE tb_paciente(
	
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    foto VARCHAR(255) NULL,
    cpf VARCHAR(20) NOT NULL,
 	nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_serie_escolar INT NOT NULL,
    id_grau_suporte INT NOT NULL,
    id_usuario INT NOT NULL,
    
    CONSTRAINT fk_serie_escolar_paciente
    FOREIGN KEY (id_serie_escolar) REFERENCES tb_serie_escolar(id),
    
    CONSTRAINT fk_grau_suporte_paciente
    FOREIGN KEY (id_grau_suporte)  REFERENCES tb_grau_suporte(id),
    
    CONSTRAINT fk_usuario_paciente
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id)
    
);

CREATE TABLE tb_paciente_transtorno(

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_paciente INT NOT NULL,
    id_sigla_transtorno INT NOT NULL,
    
    CONSTRAINT fk_paciente_paciente_transtorno
    FOREIGN KEY (id_paciente) REFERENCES tb_paciente(id),
    
    CONSTRAINT fk_sigla_transtorno_paciente_transtorno
    FOREIGN KEY (id_sigla_transtorno) REFERENCES tb_sigla_transtorno(id)
    

);


-- Paciente & Usuario
CREATE TABLE tb_usuario_paciente(

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_usuario INT NOT NULL,
    id_paciente INT NOT NULL,
    
    CONSTRAINT fk_usuario_usuario_paciente
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id),
    
    CONSTRAINT fk_paciente_usuario_paciente
    FOREIGN KEY (id_paciente) REFERENCES tb_paciente(id)

);


-- Habilidade
CREATE TABLE tb_habilidade(
	
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50) NOT NULL

);


-- Habilidade & Paciente
CREATE TABLE tb_paciente_habilidade(
		
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	idade_meses DECIMAL(10,4) NOT NULL,
	id_paciente INT NOT NULL,
	id_habilidade INT NOT NULL,
	
	
	CONSTRAINT fk_paciente_paciente_habilidade
	FOREIGN KEY (id_paciente)  REFERENCES tb_paciente(id),

	CONSTRAINT fk_habilidade_paciente_habilidade
	FOREIGN KEY (id_habilidade)  REFERENCES tb_habilidade(id)
        
);

-- Atividade
CREATE TABLE tb_faixa_idade(
	
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idade_min INT NOT NULL,
    idade_max INT NOT NULL,
    valor_atividade DECIMAL(10, 4) NOT NULL
    
);

CREATE TABLE tb_atividade_personalizada(

	id 	INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    comportamento VARCHAR(300) NOT NULL,
    valor_meses INT NOT NULL,
    id_habilidade INT NOT NULL,
    id_usuario INT NOT NULL,
    
    CONSTRAINT fk_usuario_atividade_personalizada
    FOREIGN KEY (id_usuario)  REFERENCES tb_usuario(id),
    
	CONSTRAINT fk_habilidade_atividade_personalizada
    FOREIGN KEY (id_habilidade)  REFERENCES tb_habilidade(id)
    
);

CREATE TABLE tb_atividade_portage(
		
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	numero_questao INT NOT NULL,
	comportamento VARCHAR(300) NOT NULL,
	id_faixa_idade INT NOT NULL,
	id_habilidade INT NOT NULL,
	
	
	CONSTRAINT fk_faixa_idade_atividade_portage
	FOREIGN KEY (id_faixa_idade) REFERENCES tb_faixa_idade(id),

	CONSTRAINT fk_habilidade_atividade_portage
	FOREIGN KEY (id_habilidade) REFERENCES tb_habilidade(id)
        
);

CREATE TABLE tb_atividade(
	
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    concluida BOOLEAN NOT NULL DEFAULT FALSE,
    id_paciente INT NOT NULL,
    id_atividade_personalizada INT NULL,
    id_atividade_portage INT NULL,
    
    CONSTRAINT fk_paciente_atividade
    FOREIGN KEY (id_paciente) REFERENCES tb_paciente(id),
    
    CONSTRAINT fk_atividade_personalizada_atividade
    FOREIGN KEY (id_atividade_personalizada) REFERENCES tb_atividade_personalizada(id),
    
    CONSTRAINT fk_atividade_portage_atividade
    FOREIGN KEY (id_atividade_portage) REFERENCES tb_atividade_portage(id)
    
);


-- Tentativa
CREATE TABLE tb_tipo_aplicacao(	

    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    alternativa varchar(30) NOT NULL
    
);

CREATE TABLE tb_tentativa(

	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    resultado BOOLEAN NOT NULL,
	data_tentativa DATE NOT NULL,
    observacao TEXT NULL,
	id_tipo_aplicacao INT NOT NULL,
    id_atividade INT NOT NULL,
    
    
    CONSTRAINT fk_tipo_aplicacao_tentativa
    FOREIGN KEY (id_tipo_aplicacao)  REFERENCES tb_tipo_aplicacao(id),
    
	CONSTRAINT fk_atividade_tentativa
    FOREIGN KEY (id_atividade)  REFERENCES tb_atividade(id)

);


-- Formulario
CREATE TABLE tb_resposta_formulario(
		
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	alternativa VARCHAR(30) NOT NULL
     
);

CREATE TABLE tb_formulario(
		
        id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        id_paciente INT NOT NULL,
		id_atividade_portage INT NOT NULL,
        id_resposta INT NULL,
	
        
        CONSTRAINT fk_paciente_formulario
		FOREIGN KEY (id_paciente)  REFERENCES tb_paciente(id),
    
		CONSTRAINT fk_atividade_portage_formulario
		FOREIGN KEY (id_atividade_portage)  REFERENCES tb_atividade_portage(id),
        
        CONSTRAINT fk_resposta_formulario
		FOREIGN KEY (id_resposta)  REFERENCES tb_resposta_formulario(id)
    
    );
    
-- Dados do paciente (serie e grau de suporte ) pelo id
CREATE VIEW vw_data_paciente AS
SELECT
	paciente.id as id_paciente,
	paciente.nome as nome,
    paciente.foto as foto,
    paciente.data_nascimento as data_nascimento,
    paciente.cpf as cpf,
    serie_escolar.serie as serie,
    grau_suporte.grau as grau
FROM tb_paciente paciente
	JOIN tb_serie_escolar serie_escolar ON
    serie_escolar.id = paciente.id_serie_escolar
    JOIN tb_grau_suporte grau_suporte ON
    grau_suporte.id = paciente.id_grau_suporte
    ORDER BY paciente.id ASC;

-- Habilidades do paciente pelo id
CREATE VIEW vw_habilidades_paciente AS
SELECT
	paciente.id as id_paciente,
	habilidade.id as id_habilidade,
    habilidade.nome as nome_habilidade,
    relacao.idade_meses as idade_meses
FROM 
	tb_habilidade habilidade
	JOIN tb_paciente_habilidade relacao ON
    relacao.id_habilidade = habilidade.id
    JOIN tb_paciente paciente ON
    paciente.id = relacao.id_paciente
    ORDER BY paciente.id ASC;

-- Diagnóstico do paciente pelo id
CREATE VIEW vw_diagnostico_paciente AS
SELECT
	paciente.id as id_paciente,
	diagnostico.id as id_diagnostico,
    diagnostico.sigla as sigla,
    diagnostico.nome_completo_transtorno as nome_completo
FROM tb_sigla_transtorno diagnostico
	JOIN tb_paciente_transtorno transtorno ON
    transtorno.id_sigla_transtorno = diagnostico.id
    JOIN tb_paciente paciente ON
    transtorno.id_paciente = paciente.id
    ORDER BY paciente.id ASC; 

-- Psicopedagogo pelo id de paciente
CREATE VIEW vw_psicopedagogo_paciente AS
SELECT
	paciente.id AS id_paciente,
	usuario.id as id_usuario,
    usuario.nome as nome,
    usuario.telefone as telefone
FROM tb_usuario usuario
	JOIN tb_usuario_paciente relacao ON
    usuario.id = relacao.id_usuario
    JOIN tb_paciente paciente ON
    paciente.id = relacao.id_paciente
    WHERE usuario.id_tipo_usuario = 1
    ORDER BY paciente.id ASC;

-- Responsaveis pelo id de paciente
CREATE VIEW vw_responsavel_paciente AS
SELECT
	paciente.id AS id_paciente,
	usuario.id as id_usuario,
    usuario.nome as nome,
    usuario.telefone as telefone
FROM tb_usuario usuario
	JOIN tb_usuario_paciente relacao ON
    usuario.id = relacao.id_usuario
    JOIN tb_paciente paciente ON
    paciente.id = relacao.id_paciente
    WHERE usuario.id_tipo_usuario = 2
    ORDER BY paciente.id ASC;

CREATE VIEW vw_formulario_usuario AS
SELECT
	formulario.id_paciente as id_paciente,
	atividade.id as id_atividade,
    atividade.numero_questao as numero_questao,
    atividade.comportamento as comportamento,
    atividade.id_faixa_idade as id_faixa_idade,
    atividade.id_habilidade as id_habilidade,
	formulario.id_resposta as id_resposta
FROM tb_formulario formulario
	JOIN tb_atividade_portage atividade ON
    atividade.id = formulario.id_atividade_portage
    ORDER BY id_atividade_portage ASC;

CREATE VIEW vw_atividade_portage AS
SELECT
	'Portage' as tipo_atividade,
	tb_atividade.id as id_atividade,
    tb_atividade.concluida as concluida,
    tb_atividade_portage.numero_questao as numero_questao,
    tb_atividade_portage.comportamento as comportamento,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade
    
    FROM tb_atividade
    JOIN tb_atividade_portage ON
    tb_atividade.id_atividade_portage = tb_atividade_portage.id
    JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_portage.id_habilidade;
    
CREATE VIEW vw_atividade_personalizada AS
SELECT
	'Personalizada' as tipo_atividade,
	tb_atividade.id as id_atividade,
    tb_atividade.concluida as concluida,
    tb_atividade_personalizada.comportamento as comportamento,
    tb_atividade_personalizada.valor_meses as valor_meses,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade
	
    FROM tb_atividade
    JOIN tb_atividade_personalizada ON
    tb_atividade_personalizada.id = tb_atividade.id_atividade_personalizada
	JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_personalizada.id_habilidade;

CREATE VIEW vw_todas_atividades AS
SELECT
	tb_atividade.id_paciente as id_paciente,
	'Portage' as tipo_atividade,
	tb_atividade.id as id_atividade,
    tb_atividade.concluida as concluida,
    tb_atividade_portage.numero_questao as numero_questao,
    tb_atividade_portage.comportamento as comportamento,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade,
    NULL as valor_meses
    
    FROM tb_atividade
    JOIN tb_atividade_portage ON
    tb_atividade.id_atividade_portage = tb_atividade_portage.id
    JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_portage.id_habilidade
    
    UNION ALL

SELECT
	tb_atividade.id_paciente as id_paciente,
    'Personalizada' as tipo_atividade,
	tb_atividade.id as id_atividade,
    tb_atividade.concluida as concluida,
    NULL AS numero_questao,
    tb_atividade_personalizada.comportamento as comportamento,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade,
    tb_atividade_personalizada.valor_meses as valor_meses
	
    FROM tb_atividade
    JOIN tb_atividade_personalizada ON
    tb_atividade_personalizada.id = tb_atividade.id_atividade_personalizada
	JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_personalizada.id_habilidade
    ORDER BY numero_questao;

CREATE VIEW vw_tentativas AS
SELECT
	
	tb_tentativa.id as id_tentativa,
    tb_tentativa.resultado as resultado,
    tb_tentativa.data_tentativa as data_tentativa,
    tb_tentativa.observacao as observacao,
    tb_tipo_aplicacao.alternativa as auxilio,
    tb_atividade.id AS id_atividade,
    NULL AS numero_questao,
    tb_atividade_personalizada.comportamento AS comportamento,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade
	
    FROM tb_tentativa
    JOIN tb_tipo_aplicacao ON
    tb_tipo_aplicacao.id = tb_tentativa.id_tipo_aplicacao
    JOIN tb_atividade ON
    tb_atividade.id = tb_tentativa.id_atividade
    JOIN tb_atividade_personalizada ON
    tb_atividade_personalizada.id = tb_atividade.id_atividade_personalizada
    JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_personalizada.id_habilidade

UNION ALL

SELECT 
	tb_tentativa.id as id_tentativa,
    tb_tentativa.resultado as resultado,
    tb_tentativa.data_tentativa as data_tentativa,
    tb_tentativa.observacao as observacao,
    tb_tipo_aplicacao.alternativa as auxilio,
    tb_atividade.id AS id_atividade,
    tb_atividade_portage.numero_questao AS numero_questao,
    tb_atividade_portage.comportamento AS comportamento,
    tb_habilidade.id as id_habilidade,
    tb_habilidade.nome as nome_habilidade
	
    FROM tb_tentativa
    JOIN tb_tipo_aplicacao ON
    tb_tipo_aplicacao.id = tb_tentativa.id_tipo_aplicacao
    JOIN tb_atividade ON
    tb_atividade.id = tb_tentativa.id_atividade
    JOIN tb_atividade_portage ON
    tb_atividade_portage.id = tb_atividade.id_atividade_portage
    JOIN tb_habilidade ON
    tb_habilidade.id = tb_atividade_portage.id_habilidade
    ORDER BY data_tentativa DESC;

DELIMITER $$

CREATE PROCEDURE prc_usuario(
	IN p_id INT,
    OUT p_message JSON
) BEGIN
	
    DECLARE v_foto VARCHAR(255);
    DECLARE v_nome VARCHAR(150);
    DECLARE v_data_nascimento DATE;
    DECLARE v_telefone VARCHAR(20);
    DECLARE v_email VARCHAR(255);
    
    DECLARE data_hoje DATE;
    SET data_hoje = curdate();
		
    IF NOT EXISTS (
		
        SELECT 1
        FROM tb_usuario
        WHERE id = p_id
        
    ) THEN 
		SET p_message = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Não foram encontrados dados de retorno!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    ELSE
		
        SELECT foto, nome, data_nascimento, telefone, email
        INTO v_foto, v_nome, v_data_nascimento, v_telefone, v_email
        FROM tb_usuario
        WHERE id = p_id;
        
        SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
				'id', p_id,
                'foto', v_foto,
                'nome', v_nome,
                'email', v_email,
                'data_nascimento', v_data_nascimento,
                'telefone', v_telefone
            )
        );
    
    END IF;
    
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_usuario_login(
    IN p_email VARCHAR(255),
    IN p_senha VARCHAR(255),
    OUT v_id INT,
    OUT p_message JSON
) BEGIN

	DECLARE data_hoje DATE;

	SET data_hoje = CURDATE();

	SELECT id INTO v_id
	FROM tb_usuario 
	WHERE email = p_email AND senha = p_senha;

    IF v_id IS NULL THEN

        SET p_message = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Não foram encontrados dados de retorno!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSE 
    
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Requisição feita com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_home(v_id, @resultHome);
        
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_home(
	IN p_id_usuario INT,
    OUT p_message JSON
) BEGIN 
	
    DECLARE v_id INT;
    DECLARE v_foto VARCHAR(150);
    DECLARE v_nome VARCHAR(255);
	DECLARE v_tipo_usuario VARCHAR(40);
    DECLARE data_hoje DATE;
    DECLARE return_object JSON;
    
    SET data_hoje = curdate();
    
    IF NOT EXISTS (
		SELECT 1
		FROM tb_usuario
        WHERE id = p_id_usuario 
    
    ) THEN SET p_message = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Não foram encontrados dados de retorno!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
	
    ELSE
    
		SELECT usuario.nome, usuario.foto, tipo_usuario.tipo_usuario
        INTO v_nome, v_foto, v_tipo_usuario
        FROM tb_usuario usuario
        INNER JOIN tb_tipo_usuario tipo_usuario
        ON tipo_usuario.id = usuario.id_tipo_usuario
        WHERE usuario.id = p_id_usuario;
        
        SELECT JSON_ARRAYAGG(
			JSON_OBJECT(
				'id', paciente.id,
                'foto', paciente.foto,
                'nome', paciente.nome,
                'data_nascimento', DATE_FORMAT(paciente.data_nascimento, '%d/%m/%Y'),
                'idade', TIMESTAMPDIFF(YEAR, paciente.data_nascimento, CURDATE()),
                'cpf', paciente.cpf,
                'serie_escolar', serie.serie,
                'grau_suporte', grau_suporte.grau,
                'diagnostico_breve', (
					SELECT IFNULL(JSON_ARRAYAGG(
						JSON_OBJECT(
							'id_transtorno', diagnostico.id,
							'sigla', diagnostico.sigla,
                            'nome_completo', diagnostico.nome_completo_transtorno
                        )
                    ), JSON_ARRAY())
                    FROM tb_paciente_transtorno transtorno
                    JOIN tb_sigla_transtorno diagnostico
                    ON transtorno.id_sigla_transtorno = diagnostico.id
                    WHERE transtorno.id_paciente = paciente.id
                )
            )
        )
        
        INTO return_object
        FROM tb_paciente paciente
        JOIN tb_usuario_paciente relacao
        ON relacao.id_paciente = paciente.id
        JOIN tb_serie_escolar serie
        ON serie.id = paciente.id_serie_escolar
        JOIN tb_grau_suporte grau_suporte
        ON grau_suporte.id = paciente.id_grau_suporte
        WHERE relacao.id_usuario = p_id_usuario
        ORDER BY paciente.id ASC;
        
        IF v_tipo_usuario = 'Psicopedagogo' THEN 
        
			SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
                'id', p_id_usuario,
                'foto', v_foto,
                'nome', v_nome,
                'tipo_usuario', v_tipo_usuario,
                'pacientes', return_object                
            )
        );
        
        ELSE 
         
         SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
                'id', p_id_usuario,
                'foto', v_foto,
                'nome', v_nome,
                'tipo_usuario', v_tipo_usuario,
                'familiares', return_object
            )
        );
        
        END IF;
        
    END IF; 

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_cria_usuario(
	IN p_nome VARCHAR(150),
    IN p_email VARCHAR(255),
    IN p_senha VARCHAR(255),
    IN p_data_nascimento DATE,
    IN p_telefone VARCHAR(20),
    IN p_id_tipo_usuario INT,
    OUT p_message JSON
) BEGIN
	
	DECLARE data_hoje DATE;

	SET data_hoje = CURDATE();
    
    IF EXISTS(
    
		SELECT 1 
        FROM tb_usuario 
        WHERE email = p_email
        
    ) THEN SET p_message = JSON_OBJECT(
			'status', FALSE,
            'status_code', 409,
            'message', 'Existem dados de inserção já cadastrados no sistema!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
        
    ELSE
    
		INSERT INTO tb_usuario (
				nome,
				data_nascimento,
				telefone,
				email,
				senha,
				id_tipo_usuario
		) VALUES (
				p_nome,
				p_data_nascimento,
				p_telefone,
				p_email,
				p_senha,
				p_id_tipo_usuario
		);
		
		SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 201,
            'message', 'Cadastro bem sucedido!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
        
		CALL prc_usuario_login(p_email, p_senha, @idUsuarioLogin, @resultUsuarioLogin);
    
    END IF;
    
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualiza_usuario(
	IN p_id INT,
	IN p_foto VARCHAR(255),
	IN p_nome VARCHAR(150),
    IN p_email VARCHAR(255),
    IN p_data_nascimento DATE,
    IN p_telefone VARCHAR(20),
    OUT p_message JSON
) BEGIN 
	
    DECLARE data_hoje DATE;
    SET data_hoje = curdate();
    
    IF NOT EXISTS (
		SELECT 1
        FROM tb_usuario
        WHERE id = p_id
    ) THEN SET p_message = JSON_OBJECT(
		'status', FALSE,
		'status_code', 404,
		'message', 'Não foram encontrados dados de retorno!!!',
		'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
    );
	
    ELSEIF EXISTS (
		SELECT 1 
        FROM tb_usuario
        WHERE email = p_email AND id != p_id
    ) THEN SET p_message = JSON_OBJECT(
		'status', FALSE,
		'status_code', 409,
		'message', 'Existem dados de inserção já cadastrados no sistema!!!',
		'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
	);
	
	ELSE
	
		UPDATE tb_usuario SET
			foto = p_foto,
            nome = p_nome,
            email = p_email,
            data_nascimento = p_data_nascimento,
            telefone = p_telefone
		WHERE id = p_id;
            
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Item atualizado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_usuario(p_id, @resultUsuario);
    
    END IF;
    
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_solicita_redefinicao_senha(
	
    IN p_email VARCHAR(255),
    OUT p_message JSON

) BEGIN 

	DECLARE data_hoje DATE;
    SET data_hoje = curdate();

	IF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE email = p_email) THEN
    
		SET p_message = JSON_OBJECT(
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
    ELSE
    
		SET p_message = JSON_OBJECT(
			'status', TRUE,
			'status_code', 200,
			'message', 'Requisição bem sucedida!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    END IF;
    
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualiza_senha_usuario(

	IN p_id INT,
	IN p_senha VARCHAR(255),
    OUT p_message JSON

) BEGIN
	
    DECLARE data_hoje DATE;
    SET data_hoje = curdate();
    
	IF NOT EXISTS(SELECT 1 FROM tb_usuario WHERE id = p_id) THEN
		
		SET p_message =JSON_OBJECT(
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
			
    ELSE
    
		UPDATE tb_usuario SET
			senha = p_senha
		WHERE id = p_id;
    
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Item atualizado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_home(p_id, @resultHome);
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_deleta_usuario(
	
    IN p_id INT,
    IN p_senha VARCHAR(255),
	OUT p_message JSON 
    
) BEGIN
	
    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();
    
    IF NOT EXISTS (
		SELECT 1
        FROM tb_usuario
        WHERE id = p_id
    ) THEN SET p_message = JSON_OBJECT(
		'status', FALSE,
		'status_code', 404,
		'message', 'Não foram encontrados dados de retorno!!!',
		'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
    );
    
    ELSEIF (
		SELECT 1
        FROM tb_usuario
        WHERE id = p_id AND senha = p_senha
    ) THEN 
		
        DELETE FROM tb_usuario WHERE id = p_id AND senha = p_senha;
    
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Item deletado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    ELSE 
		
        SET p_message = JSON_OBJECT(
		'status', FALSE,
		'status_code', 401,
		'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
		'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
    );
    
    
    END IF;

END$$
    
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_buscar_paciente_completo(
    IN p_id_paciente INT,
    OUT p_mensagem JSON
) BEGIN

    -- PACIENTE
    DECLARE v_nome VARCHAR(150);
    DECLARE v_foto VARCHAR(255);
    DECLARE v_data_nascimento DATE;
    DECLARE v_cpf VARCHAR(20);
    DECLARE v_serie_escolar VARCHAR(30);
    DECLARE v_grau_suporte VARCHAR(30);

    -- JSONS
    DECLARE v_diagnostico 	JSON;
    DECLARE v_habilidades 	JSON;
    DECLARE v_psicopedagogo JSON;
    DECLARE v_responsaveis 	JSON;
    
    DECLARE data_hoje DATE;
    SET data_hoje = curdate();

    -- VALIDAÇÃO
    IF NOT EXISTS (
        SELECT 1 FROM tb_paciente WHERE id = p_id_paciente
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSE

        -- PACIENTE
        SELECT nome, foto, data_nascimento, cpf, serie, grau
        INTO v_nome, v_foto, v_data_nascimento, v_cpf, v_serie_escolar, v_grau_suporte
        FROM vw_data_paciente WHERE id_paciente = p_id_paciente;

		-- DIAGNÓSTICO
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'sigla', 			diagnostico.sigla,
                'id_transtorno', 	diagnostico.id_diagnostico,
                'nome_completo', 	diagnostico.nome_completo
            )
        )
        INTO v_diagnostico
        FROM vw_diagnostico_paciente diagnostico
        WHERE id_paciente = p_id_paciente;
        
        SET v_diagnostico = IFNULL(v_diagnostico, JSON_ARRAY());

        -- HABILIDADES
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'id', 			habilidade_paciente.id_habilidade,
                'nome', 		habilidade_paciente.nome_habilidade,
                'idade_meses', 	habilidade_paciente.idade_meses
            )
        )
        INTO v_habilidades 
        FROM vw_habilidades_paciente habilidade_paciente
        WHERE id_paciente = p_id_paciente;

        SET v_habilidades = IFNULL(v_habilidades, JSON_ARRAY());

        -- RESPONSÁVEIS
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'id', 		responsavel.id_usuario,
                'nome', 	responsavel.nome,
                'telefone', responsavel.telefone
            )
        )
        INTO v_responsaveis
        FROM vw_responsavel_paciente responsavel
        WHERE id_paciente = p_id_paciente;

        SET v_responsaveis = IFNULL(v_responsaveis, JSON_ARRAY());

		-- PSICOPEDAGOGO
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'id', 		psicopedagogo.id_usuario,
                'nome', 	psicopedagogo.nome,
                'telefone', psicopedagogo.telefone
            )
        )
        INTO v_psicopedagogo
        FROM vw_psicopedagogo_paciente psicopedagogo
        WHERE id_paciente = p_id_paciente;

        SET v_psicopedagogo = IFNULL(v_psicopedagogo, JSON_ARRAY());

        -- RETORNO FINAL
        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
            'status_code', '200',
            'message', 'Paciente encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
                'id', p_id_paciente,
                'foto', v_foto,
                'nome', v_nome,
                'data_nascimento', DATE_FORMAT(v_data_nascimento, '%d/%m/%Y'),
                'idade', TIMESTAMPDIFF(YEAR, v_data_nascimento, CURDATE()),
                'cpf', v_cpf,
                'grau_suporte', v_grau_suporte,
                'serie_escolar', v_serie_escolar,
                'grafico', v_habilidades,
                'diagnostico', v_diagnostico,
				'psicopedagogo', v_psicopedagogo,
                'responsavel', v_responsaveis
            )
        );

    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_adicionar_paciente(
    IN p_foto VARCHAR(255),
	IN p_nome VARCHAR(150),
    IN p_diagnostico VARCHAR(400),
    IN p_cpf VARCHAR(20),
    IN p_data_nascimento DATE,
    IN p_id_serie_escolar INT,
    IN p_id_grau_suporte INT,
    IN p_id_responsavel INT,
    OUT p_mensagem JSON
) BEGIN

	DECLARE novo_id INT;
	DECLARE data_hoje DATE;
    SET data_hoje = curdate();


    -- valida duplicidade
    IF EXISTS (
        SELECT 1 FROM tb_paciente WHERE cpf = p_cpf
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Dados de inserção foram encontrados já cadastrados!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_serie_escolar WHERE id = p_id_serie_escolar) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'Não foi possível processar a requisição pois existem campos obrigatórios que devem ser encaminhados, e atendidos conforme documentação!!! [ID SÉRIE ESCOLAR]',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_grau_suporte WHERE id = p_id_grau_suporte) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'Não foi possível processar a requisição pois existem campos obrigatórios que devem ser encaminhados, e atendidos conforme documentação!!! [ID GRAU DE SUPORTE]',
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_usuario WHERE id = p_id_responsavel) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'Não foi possível processar a requisição pois existem campos obrigatórios que devem ser encaminhados, e atendidos conforme documentação!!! [ID RESPONSAVEL]',
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSEIF (SELECT 1 FROM tb_usuario WHERE id = p_id_responsavel AND id_tipo_usuario = 1) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 401,
            'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    ELSE

        -- insert paciente
        INSERT INTO tb_paciente(
            foto,
            nome,
            cpf,
            data_nascimento,
            id_serie_escolar,
            id_grau_suporte,
            id_usuario
        )
        VALUES (
            p_foto,
            p_nome,
            p_cpf,
            p_data_nascimento,
            p_id_serie_escolar,
            p_id_grau_suporte,
            p_id_responsavel
        );

        SET novo_id = LAST_INSERT_ID();

        -- vínculo responsável
        INSERT INTO tb_usuario_paciente(id_usuario, id_paciente)
        VALUES (p_id_responsavel, novo_id);

        INSERT INTO tb_paciente_transtorno (id_paciente, id_sigla_transtorno)
        SELECT novo_id, v_id_transtorno
        FROM JSON_TABLE(
			p_diagnostico,
            '$[*]' COLUMNS (
				v_id_transtorno INT PATH '$'
            )
        ) AS lista_transtornos;

		
        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
            'status_code', 201,
            'message', 'Item criado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_buscar_paciente_completo(novo_id, @resultPaciente);

    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualizar_paciente(

	IN p_id_usuario INT,
	IN p_id_paciente INT,
	IN p_nome VARCHAR(150),
    IN p_foto VARCHAR(255),
    IN p_data_nascimento DATE,
    IN p_diagnostico VARCHAR(400),
    IN p_cpf VARCHAR(20),
    IN p_id_serie_escolar INT,
    IN p_id_grau_suporte INT,
    OUT p_mensagem JSON
    
) BEGIN
    
	DECLARE data_hoje DATE;
    SET data_hoje = curdate();
    
    IF NOT EXISTS(SELECT 1 FROM tb_usuario WHERE id = p_id_usuario) THEN 
    
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Não foram encontrados, dados de retorno!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
        
    ELSEIF NOT EXISTS(SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 2) THEN
    
		SET p_mensagem = JSON_OBJECT(
			'status', TRUE,
			'status_code', 401,
			'message', 'Não autorizado',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
		
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_usuario_paciente WHERE id_paciente = p_id_paciente AND id_usuario = p_id_usuario) THEN
    
		SET p_mensagem = JSON_OBJECT(
			'status', TRUE,
			'status_code', 401,
			'message', 'Não autorizado',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
    ELSEIF NOT EXISTS(SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
    
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Não foram encontrados, dados de retorno!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
    ELSEIF EXISTS (SELECT 1 FROM tb_paciente WHERE cpf = p_cpf AND id != p_id_paciente) THEN
    
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Dados de inserção foram encontrados já cadastrados!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    ELSEIF NOT EXISTS(SELECT 1 FROM tb_serie_escolar WHERE id = p_id_serie_escolar) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_serie_esolar Incorreto',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_grau_suporte WHERE id = p_id_grau_suporte) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_grau_suporte Incorreto',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
    ELSE
		
        -- atualiza o paciente
        UPDATE tb_paciente SET
			nome = p_nome,
            foto = p_foto,
            cpf = p_cpf,
            data_nascimento = p_data_nascimento,
            id_serie_escolar = p_id_serie_escolar,
            id_grau_suporte = p_id_grau_suporte
		WHERE id = p_id_paciente;
    
		INSERT INTO tb_paciente_transtorno (id_paciente, id_sigla_transtorno)
        SELECT p_id_paciente, v_id_transtorno
        FROM JSON_TABLE(
			p_diagnostico,
            '$[*]' COLUMNS (
				v_id_transtorno INT PATH '$'
            )
        ) AS lista_transtornos;
    
        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
			'status_code', 200,
            'message', 'Item atualizado com sucesso'
        );
        
        CALL prc_buscar_paciente_completo(p_id_paciente, @resultPaciente);
        
	END IF;
    
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE proc_delete_paciente(
	IN p_id_usuario INT,
	IN p_id_paciente INT,
    OUT p_mensagem JSON
) BEGIN
	
	DECLARE data_hoje DATE;
    SET data_hoje = curdate();
    
    -- valida se o paciente existe
    IF NOT EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
	
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
	
    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario_paciente WHERE id_usuario = p_id_usuario AND id_paciente = p_id_paciente) THEN
    
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
    ELSE
		
        IF  EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 2) THEN
        
			DELETE FROM tb_usuario_paciente 	WHERE id_paciente = p_id_paciente;
			DELETE FROM tb_paciente_habilidade	WHERE id_paciente = p_id_paciente;
			DELETE FROM tb_paciente_transtorno 	WHERE id_paciente = p_id_paciente;
			DELETE FROM tb_formulario			WHERE id_paciente = p_id_paciente;
			DELETE FROM tb_atividade			WHERE id_paciente = p_id_paciente;
            DELETE FROM tb_paciente				WHERE id = p_id_paciente;
        
			SET p_mensagem = JSON_OBJECT(
				'status', TRUE,
				'status_code', 200,
				'message', 'Delete realizado com sucesso',
				'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
            );
        
        ELSEIF EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 1) THEN
			
			DELETE FROM tb_usuario_paciente WHERE id_paciente = p_id_paciente AND id_usuario = p_id_usuario;
        
			SET p_mensagem = JSON_OBJECT(
				'status', TRUE,
				'status_code', 200,
				'message', 'Delete realizado com sucesso',
				'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
            );
        
        ELSE
        
			SET p_mensagem = JSON_OBJECT(
				'status', TRUE,
				'status_code', 401,
				'message', 'Não autorizado',
				'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
            );
        
		END IF;
    
    END IF;
    
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_inserir_relacao_usuario_paciente(
    IN p_id_paciente INT,
    IN p_id_usuario INT,
    OUT p_mensagem JSON
) BEGIN

	DECLARE data_hoje DATE;
    SET data_hoje = curdate();

    -- valida paciente
    IF NOT EXISTS (
        SELECT 1 FROM tb_paciente WHERE id = p_id_paciente
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    -- valida psicopedagogo
    ELSEIF NOT EXISTS (
        SELECT 1 FROM tb_usuario WHERE id = p_id_usuario
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Usuário não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
	ELSEIF EXISTS (
        SELECT 1 
        FROM tb_usuario_paciente 
        WHERE id_paciente = p_id_paciente 
          AND id_usuario = p_id_usuario
    ) THEN
    
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Essa relação já existe',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSE

        INSERT INTO tb_usuario_paciente (id_usuario, id_paciente) VALUES (p_id_usuario, p_id_paciente);

        -- sobrescreve mensagem
        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
            'status_code', 201,
            'message', 'Item criado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_buscar_paciente_completo(p_id_paciente, @resultPaciente);

    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_retorna_paciente_pelo_cpf(

	IN p_cpf VARCHAR(20),
    OUT p_message JSON

) BEGIN
	
	DECLARE v_id INT;
    DECLARE v_nome VARCHAR(150);
    DECLARE v_foto VARCHAR(255);
    DECLARE v_data_nascimento DATE;
    DECLARE v_serie VARCHAR(30);
    DECLARE v_grau VARCHAR(30);
	DECLARE data_hoje DATE;
    SET data_hoje = curdate();

	IF NOT EXISTS(
		SELECT 1
        FROM tb_paciente
        WHERE cpf = p_cpf
    ) THEN  SET p_message = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    ELSE
    
		SELECT id_paciente, nome, foto, data_nascimento, serie, grau 
        FROM vw_data_paciente WHERE cpf = p_cpf
        INTO v_id, v_nome, v_foto, v_data_nascimento, v_serie, v_grau;
        
        
        SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
            
				'id', v_id,
                'nome', v_nome,
                'foto', v_foto,
                'cpf', p_cpf,
                'data_nascimento', DATE_FORMAT(v_data_nascimento, '%d/%m/%Y'),
                'idade', TIMESTAMPDIFF(YEAR, v_data_nascimento, CURDATE()),
                'serie_escolar', v_serie,
                'grau_suporte', v_grau
            
            )
        );
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualizar_respostas_formulario(
	IN p_id_usuario INT,
    IN p_id_paciente INT,
    IN p_lista_respostas JSON,
    OUT p_message JSON
) BEGIN 

	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

	IF NOT EXISTS(SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSEIF NOT EXISTS(SELECT 1 FROM tb_usuario_paciente WHERE id_usuario = p_id_usuario AND id_paciente = p_id_paciente) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
    
    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 1) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
    
	ELSE
    
		-- INICIA UPDATE NA TABELA FORMULARIO
		UPDATE tb_formulario
		JOIN JSON_TABLE( -- JOIN CRIA A TABELA VIRTUAL, E JSON_TABLE É RESPONSÁVEL POR LER OS JSONS
			p_lista_respostas, -- ARRAY JSON VINDO DO BACK
			'$[*]' COLUMNS ( -- [*] QUER DIZER: PERCORRA TODOS OS OBJETOS DENTRO DO ARRAY JSON
				id_atividade_portage INT PATH '$.id_atividade_portage', -- CRIA COLUNA VIRTUAL, O PATH INDICA ONDE PROCURAR NO JSON
				id_resposta INT PATH '$.id_resposta'
			)
		) AS novo_formulario 
		
		ON tb_formulario.id_atividade_portage = novo_formulario.id_atividade_portage -- ENCONTRE A LINHA DE TB_FORMULARIO ONDE O ID DA ATIVIDADE PORTAGE SEJA IGUAL A QUE VEM DO JSON
		SET tb_formulario.id_resposta = novo_formulario.id_resposta -- PEGUE O VALOR DE RESPOSTA QUE ESTÁ NO BANCO E SUBSTITUA PELO VALOR DE RESPOSTA VINDO DO JSON
		WHERE tb_formulario.id_paciente = p_id_paciente;
		
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Item atualizado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_buscar_paciente_completo(p_id_paciente, @resultPaciente);
        
    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_formulario_pelo_id_paciente(
	IN p_id_usuario INT,
    IN p_id_paciente INT,
    OUT p_message JSON
	
) BEGIN

	DECLARE array_comportamento JSON;
	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();
    
    
    IF NOT EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
        
	ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 1) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
        
	ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario_paciente WHERE id_paciente = p_id_paciente AND id_usuario = p_id_usuario) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
        
	ELSE
		
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
				'id_atividade_portage', id_atividade,
                'numero_questao', numero_questao,
                'comportamento', comportamento,
                'id_faixa_idade', id_faixa_idade,
                'id_habilidade', id_habilidade,
                'id_resposta', id_resposta
            )
        ) FROM vw_formulario_usuario WHERE id_paciente = p_id_paciente
        INTO array_comportamento;
        
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', '200',
            'message', 'Formulario encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', array_comportamento
        );
    
    END IF;

END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE prc_inserir_atividade_tipo_portage(
    IN p_id_usuario INT,
    IN p_id_paciente INT,
    IN p_id_atividade_portage INT,
    OUT p_message JSON
) BEGIN

    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

    IF NOT EXISTS (SELECT 1 FROM tb_usuario where id = p_id_usuario) THEN
    
        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario_paciente WHERE id_usuario = p_id_usuario AND id_paciente = p_id_paciente) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 1) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
        
	ELSEIF EXISTS (SELECT 1 FROM tb_atividade WHERE id_atividade_portage = p_id_atividade_portage) THEN 

		SET p_message = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Essa relação já existe',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_atividade_portage WHERE id = p_id_atividade_portage) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSE

        INSERT INTO tb_atividade (

            id_paciente,
            id_atividade_portage

        ) VALUES (

            p_id_paciente,
            p_id_atividade_portage

        );

        SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 201,
            'message', 'Inserção feita com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        call prc_atividades(p_id_paciente, 
		( SELECT id_habilidade FROM tb_atividade_portage WHERE id = p_id_atividade_portage )
        , @resultAtividade);


    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_inserir_atividade_tipo_personalizada(
    IN p_id_usuario INT,
    IN p_id_paciente INT,
    IN p_comportamento VARCHAR(300),
    IN p_valor_meses INT,
    IN p_id_habilidade INT,
    OUT p_message JSON
) BEGIN

	DECLARE last_id_atividade_personalizada INT;
    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

    IF NOT EXISTS (SELECT 1 FROM tb_usuario where id = p_id_usuario) THEN
    
        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario_paciente WHERE id_usuario = p_id_usuario AND id_paciente = p_id_paciente) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);

    ELSEIF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario AND id_tipo_usuario = 1) THEN

        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
	
	ELSE
    
		INSERT INTO tb_atividade_personalizada(
			
			comportamento,
            valor_meses,
            id_habilidade,
            id_usuario
            
        ) VALUES (
        
			p_comportamento,
            p_valor_meses,
            p_id_habilidade,
            p_id_usuario
        
        );
        
        SET last_id_atividade_personalizada = LAST_INSERT_ID();
        
        INSERT INTO tb_atividade(
        
			id_paciente,
            id_atividade_personalizada
            
        ) VALUES (
			
            p_id_paciente,
            last_id_atividade_personalizada
            
        );
        
        SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 201,
            'message', 'Cadastro bem sucedido!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
        
        call prc_atividades(p_id_paciente, p_id_habilidade, @resultAtividade);
    
    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualiza_atividade_personalizada(
	IN p_id_atividade INT,
    IN p_id_usuario INT,
    IN p_comportamento VARCHAR(300),
    IN p_valor_meses INT,
    OUT p_message JSON
) BEGIN

	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();
    
    IF NOT EXISTS(SELECT 1 FROM tb_usuario WHERE id = p_id_usuario) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSEIF NOT EXISTS(SELECT 1 FROM tb_atividade WHERE id = p_id_atividade) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSEIF NOT EXISTS(
    
    SELECT 1 FROM tb_atividade_personalizada WHERE id = (
		SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade
    ) AND id_usuario = p_id_usuario ) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
    
    ELSE 
    
		UPDATE tb_atividade_personalizada
        SET 
			comportamento = p_comportamento,
            valor_meses = p_valor_meses
		WHERE id = (
			SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade
        );
    
		SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 200,
            'message', 'Item atualizado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
		call prc_atividades(
		(SELECT id_paciente FROM tb_atividade WHERE id_atividade_personalizada = (SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade)), 
		(SELECT id_habilidade FROM tb_atividade_personalizada WHERE id = (SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade)),
        @resultAtividade);
    
	END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_delete_atividade(
    IN p_id_usuario INT,
    IN p_id_paciente INT,
    IN p_id_atividade INT,
    OUT p_message JSON
) BEGIN

    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();
    
	IF NOT EXISTS (SELECT 1 FROM tb_usuario WHERE id = p_id_usuario) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
    ELSEIF NOT EXISTS (SELECT 1 FROM tb_atividade WHERE id = p_id_atividade) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
        
	ELSEIF NOT EXISTS (
    
		SELECT 1 
        FROM tb_atividade atividade
        INNER JOIN tb_usuario_paciente relacao ON relacao.id_paciente = atividade.id_paciente
        WHERE atividade.id = p_id_atividade 
          AND atividade.id_paciente = p_id_paciente 
          AND relacao.id_usuario = p_id_usuario
    
	) THEN 
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 401,
			'message', 'Não foi possível processar a requisição pois faltam credenciais válidas!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
			
		);
        
	ELSE
    
		IF ((SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade) IS NOT NULL) THEN
        
			call prc_atividades(p_id_paciente, 
			( SELECT id_atividade_personalizada FROM tb_atividade WHERE id = p_id_atividade )
			, @resultAtividade);
            
		ELSE
        
			call prc_atividades(p_id_paciente, 
			( SELECT id_atividade_portage FROM tb_atividade WHERE id = p_id_atividade )
			, @resultAtividade);
        
        END IF;
    
		DELETE FROM tb_atividade WHERE id = p_id_atividade;
		
        SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Atividade excluída com sucesso.',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
    
    END IF;
    

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atividades(
	IN p_id_paciente INT,
    IN p_id_habilidade INT,
    OUT p_message JSON
) BEGIN

	DECLARE atividades JSON;

	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

	IF NOT EXISTS(SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
		
        SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_habilidade WHERE id = p_id_habilidade) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
    
	ELSE
    
		-- portage
		SELECT JSON_ARRAYAGG(
			JSON_OBJECT(
				
                'id_atividade', id_atividade,
                'concluida', concluida,
                'numero_questao', numero_questao,
                'comportamento', comportamento,
                'habilidade', JSON_OBJECT(
					'id_habilidade', id_habilidade,
					'nome_habilidade', nome_habilidade
				)
            )
        )
        FROM vw_todas_atividades
        WHERE id_paciente = p_id_paciente
        AND id_habilidade = p_id_habilidade
		INTO atividades;
        
        SET p_message = JSON_OBJECT(
			
			'status', TRUE,
			'status_code', '200',
			'message', 'Requisição feita com sucesso!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
			'data', atividades
            
        );
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_atualiza_status_atividade(
	IN p_id_atividade INT,
    OUT p_message JSON
) BEGIN

	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

	IF NOT EXISTS(SELECT 1 FROM tb_atividade WHERE id = p_id_atividade) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
		
    ELSE
		
		UPDATE tb_atividade SET
			concluida = TRUE
		WHERE id = p_id_atividade;
        
        SET p_message = JSON_OBJECT(
			'status', TRUE,
            'status_code', 200,
            'message', 'Item atualizado com sucesso!!!',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
		);
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_inserir_tentativa(
    IN p_id_tipo_aplicacao INT,
    IN p_id_atividade INT,
    IN p_resultado BOOLEAN, 
    IN p_observacao VARCHAR(1500),
    IN p_data_tentativa DATE,
    OUT p_message JSON
) BEGIN
    
    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

   IF NOT EXISTS(SELECT 1 FROM tb_tipo_aplicacao WHERE id = p_id_tipo_aplicacao) THEN
		SELECT * FROM tb_tipo_aplicacao;
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
   
   ELSEIF NOT EXISTS (SELECT 1 FROM tb_atividade WHERE id = p_id_atividade) THEN
		SELECT * FROM tb_atividade;
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
   
   ELSE
   
		INSERT INTO tb_tentativa(
			
			id_atividade,
            id_tipo_aplicacao,
            observacao,
            data_tentativa,
            resultado
            
        ) VALUES (
			
            p_id_atividade,
            p_id_tipo_aplicacao,
            p_observacao,
            p_data_tentativa,
            p_resultado
            
        );
        
        SET p_message = JSON_OBJECT(
        
			'status', TRUE,
			'status_code', 201,
			'message', 'Inserção feita com sucesso!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
        
        CALL prc_tentativa(p_id_atividade, @resultTentativa);
   
   END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_tentativa(

	IN p_id_atividade INT,
    OUT p_message JSON

) BEGIN

	DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

	IF NOT EXISTS (SELECT 1 FROM tb_atividade WHERE id = p_id_atividade) THEN
    
		SET p_message = JSON_OBJECT(
        
			'status', FALSE,
			'status_code', 404,
			'message', 'Não foram encontrados dados de retorno!!!',
			'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        
        );
		
    ELSE
        
		SET p_message = JSON_OBJECT(
        
			'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', (SELECT json_arrayagg(
				json_object(
                'id_atividade', id_atividade,
                'id_tentativa', id_tentativa,
                'resultado', resultado,
                'data_tentativa', data_tentativa,
                'observacao', observacao,
                'auxilio', auxilio,
                'numero_questao', numero_questao,
                'comportamento', comportamento,
				'habilidade', json_object(
					'id_habilidade', id_habilidade,
                    'nome_habilidade', nome_habilidade
                )
            )
        ) FROM vw_tentativas 
        WHERE id_atividade = p_id_atividade)
        
        );
    
    END IF;


END $$ 

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_habilidade_paciente
AFTER INSERT ON tb_paciente
FOR EACH ROW
BEGIN

	INSERT INTO tb_paciente_habilidade(id_paciente, id_habilidade, idade_meses) VALUES
    (NEW.id, 1, 0.0),
    (NEW.id, 2, 0.0),
    (NEW.id, 3, 0.0),
    (NEW.id, 4, 0.0),
    (NEW.id, 5, 0.0);

END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_formulario_paciente
AFTER INSERT ON tb_paciente
FOR EACH ROW
BEGIN
    
	INSERT INTO tb_formulario(id_paciente, id_atividade_portage, id_resposta)
    SELECT NEW.id, id, NULL
    FROM tb_atividade_portage
    ORDER BY id ASC;

END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_delete_diagnostico_paciente
BEFORE UPDATE ON tb_paciente
FOR EACH ROW
BEGIN

	DELETE FROM tb_paciente_transtorno WHERE id_paciente = OLD.id;

END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_update_idade_formulario
AFTER UPDATE ON tb_formulario
FOR EACH ROW
BEGIN
	
    -- SE ATUALIZADO PARA SIM
	IF (NEW.id_resposta = 1 AND OLD.id_resposta = NULL OR OLD.id_resposta = 2 OR OLD.id_resposta = 3) THEN
		
        -- VERIFICA SE TEM UMA ATIVIDADE COM ESSE ID DE ATIVIDADE PORTAGE
		IF EXISTS (
			SELECT 1 FROM tb_atividade WHERE id_atividade_portage = OLD.id_atividade_portage
        ) THEN
        
			-- SE TIVER, MARCA COMO CONCLUÍDA
			UPDATE tb_atividade SET
				concluida = TRUE
                WHERE id_atividade_portage = OLD.id_atividade_portage;
		
        ELSE
			
            -- SE NÃO INSERE UMA CONCLUÍDA
			INSERT INTO tb_atividade(
				concluida,
                id_paciente,
                id_atividade_portage
            ) VALUES (
				TRUE,
                OLD.id_paciente,
				OLD.id_atividade_portage
            );
        
	END IF;
		
        -- ATUALIZA O VALOR DA IDADE EM MESES NA TABELA HABILIDADE_PACIENTE (GRÁFICO)
		UPDATE tb_paciente_habilidade
        SET idade_meses = idade_meses + (
			SELECT
				valor_atividade
            FROM tb_faixa_idade
            JOIN tb_atividade_portage ON
            tb_atividade_portage.id_faixa_idade = tb_faixa_idade.id
            WHERE tb_atividade_portage.id = OLD.id_atividade_portage
        ) WHERE id_paciente = OLD.id_paciente
			AND id_habilidade = (SELECT id_habilidade FROM tb_atividade_portage WHERE id = OLD.id_atividade_portage);
        
	-- CASO A RESPOSTA TENHA SIDO "NÃO" OU "SIM, COM MEDIAÇÃO"
	ELSEIF (NEW.id_resposta = 2 OR NEW.id_resposta = 3) THEN
    
		-- ELE VERIFICA SE ANTERIORMENTE A RESPOSTA ESTAVA MARCADA COMO SIM E SUBTRAI O VALOR DESSA ATIVIDADE PORTAGE
		IF(OLD.id_resposta = 1) THEN
        
			UPDATE tb_paciente_habilidade
			SET idade_meses = idade_meses - (
				SELECT
					valor_atividade
				FROM tb_faixa_idade
				JOIN tb_atividade_portage ON
				tb_atividade_portage.id_faixa_idade = tb_faixa_idade.id
				WHERE tb_atividade_portage.id = OLD.id_atividade_portage
			) WHERE id_paciente = OLD.id_paciente
				AND id_habilidade = (SELECT id_habilidade FROM tb_atividade_portage WHERE id = OLD.id_atividade_portage);
                
			-- VERIFICA SE TEM UMA ATIVIDADE COM ESSE ID DE ATIVIDADE PORTAGE MARCADA COMO CONCLUIDA NO BANCO
			IF EXISTS(SELECT 1 FROM tb_atividade WHERE id_atividade_portage = OLD.id_atividade_portage AND CONCLUIDA = 1) THEN
				
				-- CASO TENHA, ELE DEFINE ELA COMO NÃO CONCLUIDA PARA DESENVOLVER
				UPDATE tb_atividade SET
					concluida = FALSE
				WHERE id_atividade_portage = OLD.id_atividade_portage;
				
			END IF;
        
        END IF;
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_deleta_tentativas_atividade
BEFORE DELETE ON tb_atividade
FOR EACH ROW
BEGIN
    
    DELETE FROM tb_tentativa WHERE id_atividade = OLD.id;

END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_deleta_atividade_personalizada_atividade
AFTER DELETE ON tb_atividade
FOR EACH ROW
BEGIN
    
    IF (OLD.id_atividade_personalizada IS NOT NULL) THEN
    
    DELETE FROM tb_atividade_personalizada WHERE id = OLD.id_atividade_personalizada;
    
    END IF;

END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_atividade_status
AFTER UPDATE ON tb_atividade
FOR EACH ROW

BEGIN

    IF (OLD.concluida = 0 AND NEW.concluida = 1) THEN

        -- Verifica se é uma atividade do tipo portage
        IF (OLD.id_atividade_portage IS NOT NULL) THEN

            -- Caso seja ele atualiza o comportamento no formulario do paciente para sim
            UPDATE tb_formulario SET
                id_resposta = 1
            WHERE id_atividade_portage = OLD.id_atividade_portage
            AND id_paciente = OLD.id_paciente;

        -- Verifica se é uma atividade do tipo personalizada
        ELSEIF (OLD.id_atividade_personalizada IS NOT NULL) THEN

            -- Caso seja atualiza o valor somando o valor da atividade personalizada
            UPDATE tb_paciente_habilidade SET
                idade_meses = idade_meses + ( -- Soma com o valor da 

                    SELECT valor_meses FROM tb_atividade_personalizada
                    WHERE id = OLD.id_atividade_personalizada

                )
            WHERE id_paciente = OLD.id_paciente
            AND id_habilidade = (
                
                SELECT id_habilidade 
                FROM tb_atividade_personalizada 
                WHERE id = OLD.id_atividade_personalizada
                
                );

        END IF;

    END IF;

END$$

DELIMITER ;