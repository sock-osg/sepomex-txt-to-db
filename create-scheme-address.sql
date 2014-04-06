-- -----------------------------------------------------
-- Table `nombrebasededatos`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombrebasededatos`.`state` (
  `id_state` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `short_name` VARCHAR(3) NULL,
  PRIMARY KEY (`id_state`))
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `nombrebasededatos`.`municipality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombrebasededatos`.`municipality` (
  `id_municipality` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(75) NOT NULL,
  `id_state` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_municipality`),
  INDEX `fk_municipal_state_idx` (`id_state` ASC),
  CONSTRAINT `fk_municipal_state`
    FOREIGN KEY (`id_state`)
    REFERENCES `nombrebasededatos`.`state` (`id_state`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `nombrebasededatos`.`suburb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombrebasededatos`.`suburb` (
  `id_suburb` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_municipality` INT UNSIGNED NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `zipcode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_suburb`),
  INDEX `fk_suburb_municipal_idx` (`id_municipality` ASC),
  CONSTRAINT `fk_suburb_municipal`
    FOREIGN KEY (`id_municipality`)
    REFERENCES `nombrebasededatos`.`municipality` (`id_municipality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `nombrebasededatos`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombrebasededatos`.`address` (
  `id_address` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_suburb` BIGINT UNSIGNED NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `geo_lat` INT(11) NULL COMMENT 'Informacion geografica de latitud',
  `geo_lon` INT(11) NULL COMMENT 'Informacion geografica de longitud.',
  PRIMARY KEY (`id_address`),
  INDEX `fk_address_suburb_idx` (`id_suburb` ASC),
  CONSTRAINT `fk_address_suburb`
    FOREIGN KEY (`id_suburb`)
    REFERENCES `nombrebasededatos`.`suburb` (`id_suburb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1;

