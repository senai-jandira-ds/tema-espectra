-- --------- Legenda ------------
-- p = parametro
-- v = variavel
-- ------------------------------

-- Perfil do paciente
DELIMITER $$

CREATE PROCEDURE prc_buscar_paciente_completo(
    IN p_id_paciente INT,
    OUT p_mensagem JSON
) BEGIN

    -- PACIENTE
    DECLARE v_nome VARCHAR(150);
    DECLARE v_foto VARCHAR(255);
    DECLARE v_data_nascimento DATE;
    DECLARE v_idade INT;
    DECLARE v_cpf VARCHAR(20);
    DECLARE v_serie_escolar VARCHAR(30);
    DECLARE v_grau_suporte VARCHAR(30);

    -- JSONS
    DECLARE v_habilidades JSON;
    DECLARE v_psicopedagogo JSON;
    DECLARE v_responsaveis JSON;
    

    -- VALIDAÇÃO
    IF NOT EXISTS (
        SELECT 1 FROM tb_paciente WHERE id = p_id_paciente
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', '404',
            'message', 'Paciente não encontrado',
            'data', NULL
        );

    ELSE
    
		SELECT

        

    END IF;

END $$

DELIMITER ;

-- Adiciona o paciente
DELIMITER $$

CREATE PROCEDURE prc_adicionar_paciente(
    IN p_nome VARCHAR(150),
    IN p_foto VARCHAR(255),
    IN p_data_nascimento DATE,
    IN p_diagnostico VARCHAR(50),
    IN p_id_serie_escolar INT,
    IN p_id_grau_suporte INT,
    IN p_id_responsavel INT,
    OUT p_mensagem JSON
) BEGIN

    DECLARE v_numero_registro VARCHAR(20);
    DECLARE novo_id INT;

    -- valida duplicidade
    IF EXISTS (
        SELECT 1 FROM tb_paciente WHERE nome = p_nome
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Este paciente já existe',
            'data', NULL
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_serie_escolar WHERE id = p_id_serie_escolar) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_serie_esolar Incorreto',
            'data', NULL
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_grau_suporte WHERE id = p_id_grau_suporte) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_grau_suporte Incorreto',
            'data', NULL
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_responsavel WHERE id = p_id_responsavel) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_responsavel Incorreto',
            'data', NULL
        );
    
    

    ELSE

        -- gera número de registro
        SELECT CONCAT(
            DATE_FORMAT(NOW(), '%Y%m'),
            LPAD(
                IFNULL(MAX(SUBSTRING(numero_registro, 7, 4)), 0) + 1,
                4,
                '0'
            )
        )
        INTO v_numero_registro
        FROM tb_paciente
        WHERE numero_registro LIKE CONCAT(DATE_FORMAT(NOW(), '%Y%m'), '%');

        -- insert paciente
        INSERT INTO tb_paciente(
            numero_registro,
            nome,
            foto,
            data_nascimento,
            diagnostico,
            id_serie_escolar,
            id_grau_suporte
        )
        VALUES (
            v_numero_registro,
            p_nome,
            p_foto,
            p_data_nascimento,
            p_diagnostico,
            p_id_serie_escolar,
            p_id_grau_suporte
        );

        SET novo_id = LAST_INSERT_ID();

        -- vínculo responsável
        INSERT INTO tb_responsavel_paciente(id_responsavel, id_paciente)
        VALUES (p_id_responsavel, novo_id);
        
        INSERT INTO tb_paciente_habilidade (id_paciente, id_habilidade, anos_meses)
		SELECT novo_id AS id_paciente,
		h.id,
        0.0 AS anos_meses
		FROM tb_habilidade h
        WHERE NOT EXISTS (
            SELECT 1
            FROM tb_paciente_habilidade ph
            WHERE ph.id_paciente = novo_id
              AND ph.id_habilidade = h.id
        );

        CALL prc_buscar_paciente_completo(novo_id, p_mensagem);

        -- sobrescreve mensagem padrão
        SET p_mensagem = JSON_SET(
            p_mensagem,
            '$.message',
            'Paciente cadastrado com sucesso'
        );

    END IF;

END $$

DELIMITER ;

-- Atualiza dados do paciente
DELIMITER $$

CREATE PROCEDURE prc_atualizar_paciente(
	IN p_id_paciente INT,
	IN p_nome VARCHAR(150),
    IN p_foto VARCHAR(255),
    IN p_data_nascimento DATE,
    IN p_diagnostico VARCHAR(50),
    IN p_id_serie_escolar INT,
    IN p_id_grau_suporte INT,
    OUT p_mensagem JSON
) BEGIN
    
    IF NOT EXISTS(SELECT 1 FROM tb_serie_escolar WHERE id = p_id_serie_escolar) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_serie_esolar Incorreto',
            'data', NULL
        );
        
	ELSEIF NOT EXISTS(SELECT 1 FROM tb_grau_suporte WHERE id = p_id_grau_suporte) THEN
		
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 400,
            'message', 'id_grau_suporte Incorreto',
            'data', NULL
        );
        
    ELSEIF EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
		
        -- atualiza o paciente
        UPDATE tb_paciente SET
			nome = p_nome,
            foto = p_foto,
            data_nascimento = p_data_nascimento,
            diagnostico = p_diagnostico,
            id_serie_escolar = p_id_serie_escolar,
            id_grau_suporte = p_id_grau_suporte
	WHERE id = p_id_paciente;
    
    CALL prc_buscar_paciente_completo(p_id_paciente, p_mensagem);
    
    -- sobrescreve mensagem
        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
			'status_code', 200,
            'message', 'Item atualizado com sucesso'
        );
        
	ELSE
    
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Paciente não encontrado'
		);
        
	END IF;
END $$

DELIMITER ;

-- Deleta familiar se responsável, deleta só a relação entre psico e paciente 
DELIMITER $$

CREATE PROCEDURE proc_delete_familiar(
	IN p_id_paciente INT,
    OUT p_mensagem JSON
) BEGIN
	
    -- valida se o paciente existe
    IF NOT EXISTS (SELECT 1 FROM tb_paciente WHERE id = p_id_paciente) THEN
	
		SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
			'status_code', 404,
            'message', 'Paciente não encontrado',
            'data', NULL
		);
	
    ELSE
		
        -- remove tentativas
		DELETE t
		FROM tb_tentativa t
		JOIN tb_atividade a ON a.id = t.id_atividade
		WHERE a.id_paciente = p_id_paciente;

		-- remove atividades
		DELETE FROM tb_atividade
		WHERE id_paciente = p_id_paciente;
        
        -- remove formulários do paciente
		DELETE FROM tb_formulario
		WHERE id_paciente = p_id_paciente;

		-- remove responsáveis
		DELETE FROM tb_responsavel_paciente
		WHERE id_paciente = p_id_paciente;

		-- remove habilidades
		DELETE FROM tb_paciente_habilidade
		WHERE id_paciente = p_id_paciente;

	-- remove vínculo psicopedagogo
		UPDATE tb_paciente
		SET id_psicopedagogo = NULL
		WHERE id = p_id_paciente;

		-- remove paciente
		DELETE FROM tb_paciente
		WHERE id = p_id_paciente;
        
        SET p_mensagem = JSON_OBJECT(
			'status', TRUE,
            'status_code', 200,
            'message', 'Delete realizado com sucesso!!'
        );
        
	END IF;
    
END $$

DELIMITER ;

-- Insere relacao com usuario
DELIMITER $$

CREATE PROCEDURE prc_inserir_relacao_psicopedagogo_paciente(
    IN p_id_paciente INT,
    IN p_id_psicopedagogo INT,
    OUT p_mensagem JSON
) BEGIN

    -- valida paciente
    IF NOT EXISTS (
        SELECT 1 FROM tb_paciente WHERE id = p_id_paciente
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Paciente não encontrado',
            'data', NULL
        );

    -- valida psicopedagogo
    ELSEIF NOT EXISTS (
        SELECT 1 FROM tb_psicopedagogo WHERE id = p_id_psicopedagogo
    ) THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Psicopedagogo não encontrado',
            'data', NULL
        );
        
	ELSEIF EXISTS (
        SELECT 1 
        FROM tb_responsavel_paciente 
        WHERE id_paciente = p_id_paciente 
          AND id_responsavel = p_id_responsavel
    ) THEN
    
        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 409,
            'message', 'Essa relação já existe',
            'data', NULL
        );

    ELSE

        -- atualiza relação
        UPDATE tb_paciente
        SET id_psicopedagogo = p_id_psicopedagogo
        WHERE id = p_id_paciente;

        CALL prc_buscar_paciente_completo(p_id_paciente, p_mensagem);

        -- sobrescreve mensagem
        SET p_mensagem = JSON_SET(
            p_mensagem,
            '$.message',
            'Relação inserida com sucesso'
        );

    END IF;

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE prc_retorna_paciente_pelo_cpf(
) BEGIN

END$$

DELIMITER ;

drop view vw_data_paciente;
-- Dados do paciente (serie e grau de suporte ) pelo id
CREATE VIEW vw_data_paciente AS
SELECT
	paciente.id as id_paciente,
	paciente.nome,
    paciente.foto,
    paciente.data_nascimento,
    paciente.idade,
    paciente.cpf,
    serie_escolar.serie,
    grau_suporte.grau
FROM tb_paciente paciente
	JOIN tb_serie_escolar serie_escolar ON
    serie_escolar.id = paciente.id_serie_escolar
    JOIN tb_grau_suporte grau_suporte ON
    grau_suporte.id = paciente.id_grau_suporte
    ORDER BY paciente.id ASC;
    
SELECT * FROM vw_data_paciente WHERE id_paciente = 1;    

-- Diagnóstico do paciente pelo id
CREATE VIEW vw_diagnostico_paciente AS
SELECT
	paciente.id as id_paciente,
	diagnostico.id,
    diagnostico.sigla,
    diagnostico.nome_completo_transtorno
FROM tb_sigla_transtorno diagnostico
	JOIN tb_paciente_transtorno transtorno ON
    transtorno.id_sigla_transtorno = diagnostico.id
    JOIN tb_paciente paciente ON
    transtorno.id_paciente = paciente.id
    ORDER BY paciente.id ASC;

SELECT * FROM vw_diagnostico_paciente WHERE id_paciente = 1; 

-- Psicopedagogo pelo id de paciente
CREATE VIEW vw_psicopedagogo_paciente AS
SELECT
	paciente.id AS id_paciente,
	usuario.id,
    usuario.nome,
    usuario.telefone
FROM tb_usuario usuario
	JOIN tb_usuario_paciente relacao ON
    usuario.id = relacao.id_usuario
    JOIN tb_paciente paciente ON
    paciente.id = relacao.id_paciente
    WHERE usuario.id_tipo_usuario = 1
    ORDER BY paciente.id ASC;
    
SELECT * FROM vw_psicopedagogo_paciente WHERE id_paciente = 1; 

-- Responsaveis pelo id de paciente
CREATE VIEW vw_responsavel_paciente AS
SELECT
	paciente.id AS id_paciente,
	usuario.id,
    usuario.nome,
    usuario.telefone
FROM tb_usuario usuario
	JOIN tb_usuario_paciente relacao ON
    usuario.id = relacao.id_usuario
    JOIN tb_paciente paciente ON
    paciente.id = relacao.id_paciente
    WHERE usuario.id_tipo_usuario = 2
    ORDER BY paciente.id ASC;
    
SELECT * FROM vw_responsavel_paciente WHERE id_paciente = 1; 
    

