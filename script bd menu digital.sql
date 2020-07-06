-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema menuDigital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema menuDigital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `menuDigital` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema phpmyadmin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema phpmyadmin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET latin1 ;
USE `menuDigital` ;

-- -----------------------------------------------------
-- Table `menuDigital`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuDigital`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`item` (
  `idItem` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `imagen` BLOB NULL,
  `descripcion` VARCHAR(45) NULL,
  `categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idItem`, `categoria_idCategoria`),
  INDEX `fk_Plato_Categoria_idx` (`categoria_idCategoria` ASC),
  CONSTRAINT `fk_Plato_Categoria`
    FOREIGN KEY (`categoria_idCategoria`)
    REFERENCES `menuDigital`.`categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuDigital`.`mesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`mesa` (
  `idMesa` INT NOT NULL AUTO_INCREMENT,
  `mesa` INT NULL,
  PRIMARY KEY (`idMesa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuDigital`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `notas` VARCHAR(45) NULL,
  `mesa_idMesa` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  PRIMARY KEY (`idPedido`, `mesa_idMesa`),
  INDEX `fk_Pedido_Mesa1_idx` (`mesa_idMesa` ASC),
  CONSTRAINT `fk_Pedido_Mesa1`
    FOREIGN KEY (`mesa_idMesa`)
    REFERENCES `menuDigital`.`mesa` (`idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuDigital`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`admin` (
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `menuDigital`.`pedido_has_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `menuDigital`.`pedido_has_item` (
  `pedido_idPedido` INT NOT NULL,
  `pedido_mesa_idMesa` INT NOT NULL,
  `item_idItem` INT NOT NULL,
  `item_categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`pedido_idPedido`, `pedido_mesa_idMesa`, `item_idItem`, `item_categoria_idCategoria`),
  INDEX `fk_pedido_has_item_item1_idx` (`item_idItem` ASC, `item_categoria_idCategoria` ASC),
  INDEX `fk_pedido_has_item_pedido1_idx` (`pedido_idPedido` ASC, `pedido_mesa_idMesa` ASC),
  CONSTRAINT `fk_pedido_has_item_pedido1`
    FOREIGN KEY (`pedido_idPedido` , `pedido_mesa_idMesa`)
    REFERENCES `menuDigital`.`pedido` (`idPedido` , `mesa_idMesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_item_item1`
    FOREIGN KEY (`item_idItem` , `item_categoria_idCategoria`)
    REFERENCES `menuDigital`.`item` (`idItem` , `categoria_idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `phpmyadmin` ;

-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__bookmark` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dbase` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `user` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `label` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `query` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Bookmarks';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__central_columns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__central_columns` (
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `col_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `col_type` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `col_length` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `col_collation` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `col_isNull` TINYINT(1) NOT NULL,
  `col_extra` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT '',
  `col_default` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`db_name`, `col_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Central list of columns';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__column_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__column_info` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `column_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `comment` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `mimetype` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `transformation` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `transformation_options` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `input_transformation` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `input_transformation_options` VARCHAR(255) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `db_name` (`db_name` ASC, `table_name` ASC, `column_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Column information for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__designer_settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__designer_settings` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `settings_data` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Settings related to Designer';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__export_templates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__export_templates` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `export_type` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
  `template_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `template_data` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `u_user_type_template` (`username` ASC, `export_type` ASC, `template_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Saved export templates';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__favorite` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `tables` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Favorite tables';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__history` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `db` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `table` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `timevalue` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `username` (`username` ASC, `db` ASC, `table` ASC, `timevalue` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'SQL history for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__navigationhiding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__navigationhiding` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `item_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `item_type` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`, `item_name`, `item_type`, `db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Hidden items of navigation tree';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__pdf_pages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__pdf_pages` (
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `page_nr` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `page_descr` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  PRIMARY KEY (`page_nr`),
  INDEX `db_name` (`db_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'PDF relation pages for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__recent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__recent` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `tables` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Recently accessed tables';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__relation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__relation` (
  `master_db` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `master_table` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `master_field` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `foreign_db` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `foreign_table` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `foreign_field` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  PRIMARY KEY (`master_db`, `master_table`, `master_field`),
  INDEX `foreign_field` (`foreign_db` ASC, `foreign_table` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Relation table';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__savedsearches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__savedsearches` (
  `id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `search_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `search_data` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `u_savedsearches_username_dbname` (`username` ASC, `db_name` ASC, `search_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Saved searches';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_coords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_coords` (
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `pdf_page_number` INT(11) NOT NULL DEFAULT '0',
  `x` FLOAT UNSIGNED NOT NULL DEFAULT '0',
  `y` FLOAT UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`db_name`, `table_name`, `pdf_page_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table coordinates for phpMyAdmin PDF output';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_info` (
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  `display_field` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL DEFAULT '',
  PRIMARY KEY (`db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Table information for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__table_uiprefs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__table_uiprefs` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `prefs` TEXT CHARACTER SET 'utf8' NOT NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`, `db_name`, `table_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Tables\' UI preferences';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__tracking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__tracking` (
  `db_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `table_name` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `version` INT(10) UNSIGNED NOT NULL,
  `date_created` DATETIME NOT NULL,
  `date_updated` DATETIME NOT NULL,
  `schema_snapshot` TEXT CHARACTER SET 'utf8' NOT NULL,
  `schema_sql` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `data_sql` LONGTEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `tracking` SET('UPDATE', 'REPLACE', 'INSERT', 'DELETE', 'TRUNCATE', 'CREATE DATABASE', 'ALTER DATABASE', 'DROP DATABASE', 'CREATE TABLE', 'ALTER TABLE', 'RENAME TABLE', 'DROP TABLE', 'CREATE INDEX', 'DROP INDEX', 'CREATE VIEW', 'ALTER VIEW', 'DROP VIEW') NULL DEFAULT NULL,
  `tracking_active` INT(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`db_name`, `table_name`, `version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Database changes tracking for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__userconfig`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__userconfig` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `timevalue` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` TEXT CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User preferences storage for phpMyAdmin';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__usergroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__usergroups` (
  `usergroup` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `tab` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `allowed` ENUM('Y', 'N') CHARACTER SET 'utf8' NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usergroup`, `tab`, `allowed`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'User groups with configured menu items';


-- -----------------------------------------------------
-- Table `phpmyadmin`.`pma__users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `phpmyadmin`.`pma__users` (
  `username` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  `usergroup` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`username`, `usergroup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'Users and their assignments to user groups';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
