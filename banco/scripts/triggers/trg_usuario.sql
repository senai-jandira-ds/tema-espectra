DELIMITER $$

CREATE TRIGGER trg_delete_usuario
BEFORE DELETE ON tb_usuario
FOR EACH ROW
BEGIN

	DELETE FROM tb_usuario_paciente WHERE id_usuario = OLD.id;
		
	IF (OLD.id_tipo_usuario = 1) THEN
        DELETE FROM tb_atividade_personalizada WHERE id_usuario = OLD.id;
    END IF;
    
END$$

DELIMITER ;