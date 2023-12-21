DELIMITER $$
CREATE PROCEDURE `sp_crear_admin`(
    IN p_nombre VARCHAR(60),
    IN p_cargo VARCHAR(30),
    IN p_correo VARCHAR(45),
    IN p_contraseña VARCHAR(64)
)
BEGIN
    DECLARE admin_count INT;
    DECLARE hashedPassword VARCHAR(64);
    
    SET hashedPassword = SHA2(p_contraseña, 256);

    SELECT COUNT(*) INTO admin_count
    FROM `administradores`
    WHERE `nombre` = p_nombre;

    IF admin_count = 0 THEN
        INSERT INTO `administradores` (`nombre`, `cargo`, `correo`, `contraseña`)
        VALUES (p_nombre, p_cargo, p_correo, hashedPassword);
    ELSE
        SELECT 'El administrador ya existe' AS `mensaje_error`;
    END IF;
END$$
DELIMITER ;
