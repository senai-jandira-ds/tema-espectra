-- --------- Legenda ------------
-- p = parametro
-- v = variavel
-- ------------------------------

drop procedure prc_usuario_login;
drop procedure prc_home;

-- Retorna id do usuario que está fazendo login
DELIMITER $$

CREATE PROCEDURE prc_usuario_login(
    IN p_email VARCHAR(255),
    IN p_senha VARCHAR(255),
    OUT v_id INT,
    OUT p_message JSON
)
BEGIN

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
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );

    ELSE 
    
		SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Requisição feita com sucesso!!!',
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
        );
        
        CALL prc_home(v_id, @resultLogin);
        
    
    END IF;

END$$


DELIMITER ;

select * from tb_usuario;

call prc_usuario_login('maria@email.com', '654321@CBA', @id, @message);
select @id;
select @resultLogin;


-- Retorna home do psicopedagogo
DELIMITER $$

CREATE PROCEDURE prc_home(
	IN p_id_usuario INT,
    OUT p_message JSON
)
BEGIN 
	
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
            'data', DATE_FORMAT(data_hoje, '%d/%m/%Y')
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
                'idade', paciente.idade,
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

CALL prc_home_psicopedagogo(1, @object);
select @object;

