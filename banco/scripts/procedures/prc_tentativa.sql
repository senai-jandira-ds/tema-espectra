DELIMITER $$

CREATE PROCEDURE prc_inserir_tentativa(
    IN p_tipo_aplicacao_id INT,
    IN p_atividade_id INT,
    IN p_resultado BOOLEAN, 
    IN p_observacao VARCHAR(1500),
    IN p_data DATE,
    OUT p_mensagem JSON
) BEGIN

    DECLARE v_tipo_existe INT;
    DECLARE v_atividade_existe INT;
    DECLARE v_id_tentativa INT;
    
    DECLARE data_hoje DATE;
    SET data_hoje = CURDATE();

    -- VALIDAÇÕES
    SELECT COUNT(*) INTO v_tipo_existe
    FROM tb_tipo_aplicacao 
    WHERE id = p_tipo_aplicacao_id;

    SELECT COUNT(*) INTO v_atividade_existe
    FROM tb_atividade 
    WHERE id = p_atividade_id;

    IF v_tipo_existe = 0 THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Tipo de aplicação não encontrado',
            'data', NULL
        );

    ELSEIF v_atividade_existe = 0 THEN

        SET p_mensagem = JSON_OBJECT(
            'status', FALSE,
            'status_code', 404,
            'message', 'Atividade não encontrada',
            'data', NULL
        );

    ELSE

        -- INSERT
        INSERT INTO tb_tentativa (
            resultado,
            observacao,
            data_tentativa,
            id_tipo_aplicacao,
            id_atividade
        )
        VALUES (
            p_resultado,
            p_observacao,
            p_data,
            p_tipo_aplicacao_id,
            p_atividade_id
        );

        SET v_id_tentativa = LAST_INSERT_ID();

        SET p_mensagem = JSON_OBJECT(
            'status', TRUE,
            'status_code', 201,
            'message', 'Tentativa cadastrada com sucesso',
            'date', DATE_FORMAT(data_hoje, '%d/%m/%Y'),
            'data', JSON_OBJECT(
                'id', v_id_tentativa,
                'resultado', p_resultado,
                'observacao', p_observacao,
                'data_tentativa', DATE_FORMAT(p_data, '%d/%m/%Y'),
                'id_tipo_aplicacao', p_tipo_aplicacao_id,
                'id_atividade', p_atividade_id
            )
        );

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
        WHERE id_atividade = p_id_atividade 
        ORDER BY data_tentativa DESC)
        
        );
    
    END IF;


END $$ 

DELIMITER ;