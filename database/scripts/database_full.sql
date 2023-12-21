
CREATE SCHEMA IF NOT EXISTS `db_webcuponera` ;

USE `db_webcuponera` ;
/*DROP TABLE IF EXISTS `usuario` ;*/

CREATE TABLE `usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nombres_completos` VARCHAR(60) NOT NULL,
  `dni` INT NOT NULL,
  `genero` VARCHAR(15) NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `departamento` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(20) NOT NULL,
  `contraseña` VARCHAR(20) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`usuario_id`)
  );
/*INSERT INTO usuario(nombres_completos, dni, genero, fecha_nacimiento, direccion, departamento, correo, contraseña, telefono) VALUES ('Mario', 12345678, 'masculino', '1958-01-30', 'Av La gardenias 1345', 'lima', 'mario@gmail.com', 'dsjfno234', 9756123)*/

/*DROP TABLE IF EXISTS `cliente_tienda` ;*/

CREATE TABLE `cliente_tienda` (
  `cliente_tienda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `ruc` VARCHAR(11) NOT NULL,
  `razon_social` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NULL,
  `correo` VARCHAR(30) NOT NULL,
  `nombre_contacto` VARCHAR(60) NOT NULL,
  `contraseña` VARCHAR(20) NOT NULL,
  `telefono` INT NULL,
  PRIMARY KEY (`cliente_tienda_id`));
/*INSERT INTO cliente_tienda(nombre_empresa, ruc, razon_social, direccion, correo, nombre_contacto, contraseña, telefono) VALUES ('Tayloy', 00254756, 'venta materiales', 'Av Colina verde', 'tayloy@gmail.com', 'Perez', 'jndnduo67dhih', 577496)*/


/*DROP TABLE IF EXISTS `categorias` ;*/

CREATE TABLE `categorias` (
  `categorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`categorias_id`));
  
/*INSERT INTO categorias(nombre, descripcion) VALUES ('belleza', 'encuentra todas los productos a mejor precio')
INSERT INTO categorias(nombre) VALUES ('diversion')*/
/*DROP TABLE IF EXISTS `cupones` ;*/

CREATE TABLE `cupones` (
  `cupones_id` INT NOT NULL AUTO_INCREMENT, 
  `titulo` VARCHAR(60) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `precio_normal` FLOAT NOT NULL,
  `precio_oferta` FLOAT NOT NULL,
  `porcentaje_descuento` FLOAT NOT NULL,
  `diseño_oferta_foto` VARCHAR(45) NOT NULL,
  `terminos_condiciones` VARCHAR(400) NOT NULL,
  `cliente_tienda_id` INT NOT NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`cupones_id`),
  INDEX `fk_CUPONES_CLIENTE-TIENDA1_idx` (`cliente_tienda_id` ASC) VISIBLE,
  INDEX `fk_CUPONES_CATEGORIAS1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_CUPONES_CLIENTE-TIENDA1`
    FOREIGN KEY (`cliente_tienda_id`)
    REFERENCES `db_webcuponera`.`cliente_tienda` (`cliente_tienda_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUPONES_CATEGORIAS1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_webcuponera`.`categorias` (`categorias_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
    
/*INSERT INTO cupones(titulo, descripcion, fecha_inicio, fecha_vencimiento, precio_normal, precio_oferta, porcentaje_descuento, diseño_oferta_foto, terminos_condiciones, cliente_tienda_id, categorias_id) VALUES ('Nuevo descuento escolar', 'Aprovecha este 20% de decuento en tu segunda compra de utiles escolares', '2023-12-11', '2023-12-30', 150.26, 125.6, 20, '/images/libros.png', 'Solo 1 cupon por persona sera permitido, valido de lunes a viernes', 1, 1)
INSERT INTO cupones(titulo, descripcion, fecha_inicio, fecha_vencimiento, precio_normal, precio_oferta, porcentaje_descuento, diseño_oferta_foto, terminos_condiciones, cliente_tienda_id, categorias_id) VALUES ('Alisado brasileño', 'De regalo rizado de pestañas', '2024-01-02', '2024-01-13', 120.20, 100, 15, '/images/alisado.png', 'Solo 2 cupon por persona sera permitido, valido de lunes a viernes', 1, 2)*/

/*DROP TABLE IF EXISTS `cupon_comprado` ;*/

CREATE TABLE `cupon_comprado` (
    `fecha_compra` DATE NOT NULL,
    `codigo_venta` INT NOT NULL,
    `cantidad_comprada` INT NOT NULL,
    `estado_cupon` ENUM('canjeado', 'no canjeado', 'vencido') NOT NULL,
    `usuario_id` INT NOT NULL,
    `cupones_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`, `cupones_id`),
    INDEX `fk_CUPON_COMPRADO_USUARIO_idx` (`usuario_id` ASC),
    INDEX `fk_CUPON_COMPRADO_CUPONES1_idx` (`cupones_id` ASC),
    CONSTRAINT `fk_CUPON_COMPRADO_USUARIO`
        FOREIGN KEY (`usuario_id`)
        REFERENCES `db_webcuponera`.`usuario` (`usuario_id`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION,
    CONSTRAINT `fk_CUPON_COMPRADO_CUPONES1`
        FOREIGN KEY (`cupones_id`)
        REFERENCES `db_webcuponera`.`cupones` (`cupones_id`)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
);

/*INSERT INTO cupon_comprado(fecha_compra, codigo_venta, cantidad_comprada, estado_cupon, usuario_id, cupones_id) VALUES ('2023-12-11', '202345754', '2', 'canjeado', '1', '1')*/

/*DROP TABLE IF EXISTS `subcategorias` ;*/

CREATE TABLE `subcategorias` (
  `subcategorias_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `categorias_id` INT NOT NULL,
  PRIMARY KEY (`subcategorias_id`),
  INDEX `fk_SUBCATEGORIAS_CATEGORIAS1_idx` (`categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_SUBCATEGORIAS_CATEGORIAS1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `db_webcuponera`.`categorias` (`categorias_id`)
);

/*INSERT INTO subcategorias(nombre, categorias_id) VALUES ('estetica', 2)*/
/*DROP TABLE IF EXISTS `administradores` ;*/

CREATE TABLE `administradores` (
  `administrador_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `cargo` VARCHAR(30) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`administrador_id`));
 
  /*INSERT INTO administradores(nombre, cargo, correo, contraseña) VALUES ('Carlos', 'admin', 'carlos@gmail.com', 'fjnefike29392' )*/