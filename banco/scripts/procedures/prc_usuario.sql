-- --------- Legenda ------------
-- p = parametro
-- v = variavel
-- ------------------------------

-- Retorna home do psicopedagogo
DELIMITER $$

CREATE PROCEDURE prc_home_psicopedagogo(
	IN p_id_psicopedagogo INT,
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
        WHERE id = p_id_psicopedagogo AND id_tipo_usuario = 1
    
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
        WHERE usuario.id = p_id_psicopedagogo;
        
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
        WHERE relacao.id_usuario = p_id_psicopedagogo
        ORDER BY paciente.id ASC;
        
         SET p_message = JSON_OBJECT(
            'status', TRUE,
            'status_code', 200,
            'message', 'Requisição bem sucedida!!!',
            'data', JSON_OBJECT(
                'id', p_id_psicopedagogo,
                'foto', v_foto,
                'nome', v_nome,
                'tipo_usuario', v_tipo_usuario,
                'pacientes', return_object
            )
        );
        
    END IF; 

END$$

DELIMITER ;

CALL prc_home_psicopedagogo(1, @object);
select @object;

