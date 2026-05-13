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