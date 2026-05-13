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
            'status_code', '404',
            'message', 'Paciente não encontrado',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSE

        -- PACIENTE
        SELECT nome, foto, data_nascimento, idade, cpf, serie, grau
        INTO v_nome, v_foto, v_data_nascimento, v_idade, v_cpf, v_serie_escolar, v_grau_suporte
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
            'data', JSON_OBJECT(
                'id', p_id_paciente,
                'foto', v_foto,
                'nome', v_nome,
                'data_nascimento', v_data_nascimento,
                'idade', v_idade,
                'cpf', v_cpf,
                'grau_suporte', v_grau_suporte,
                'serie_escolar', v_serie_escolar,
                'grafico', v_habilidades,
				'psicopedagogo', v_psicopedagogo,
                'responsavel', v_responsaveis
            )
        );

    END IF;

END $$

DELIMITER ;

CALL prc_buscar_paciente_completo(1, @resultPaciente);
SELECT @resultPaciente;

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