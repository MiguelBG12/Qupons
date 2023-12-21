DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_actualizar_admin` $$

CREATE PROCEDURE `sp_actualizar_admin`(
    IN p_administrador_id INT,
    IN p_nuevo_nombre VARCHAR(60),
    IN p_nuevo_cargo VARCHAR(30),
    IN p_nuevo_correo VARCHAR(45),
    IN p_nueva_contraseña VARCHAR(20)
)
BEGIN
    UPDATE `administradores`
    SET
        `cargo` = p_nuevo_cargo,
        `correo` = p_nuevo_correo,
        `contraseña` = p_nueva_contraseña
    WHERE
        `administrador_id` = p_administrador_id;
END$$

DELIMITER ;
