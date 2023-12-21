DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_borrar_admin` $$

CREATE PROCEDURE `sp_borrar_admin`(
    IN p_administrador_id INT
)
BEGIN
    DECLARE admin_count INT;

    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `administrador_id` = p_administrador_id;

    IF admin_count > 0 THEN
        DELETE FROM `administradores`
        WHERE `administrador_id` = p_administrador_id;
        SELECT 'El administrador fue borrado exitosamente' AS result;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador con el ID proporcionado no existe';
    END IF;
END$$

DELIMITER ;
