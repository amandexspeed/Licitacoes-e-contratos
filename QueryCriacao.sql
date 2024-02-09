-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema licitacoes_contratos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema licitacoes_contratos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `licitacoes_contratos` DEFAULT CHARACTER SET utf8 ;
USE `licitacoes_contratos` ;

-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`secretaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`secretaria` (
  `idsecretaria` INT NOT NULL AUTO_INCREMENT,
  `nomeSecretaria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsecretaria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`funcionario` (
  `CPF` VARCHAR(11) NOT NULL,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `funcao` VARCHAR(45) NOT NULL,
  `status` VARCHAR(1) NOT NULL,
  `admissao` DATE NULL,
  `idsecretaria` INT NOT NULL,
  PRIMARY KEY (`CPF`),
  CONSTRAINT `fk_funcionario_secretaria`
    FOREIGN KEY (`idsecretaria`)
    REFERENCES `licitacoes_contratos`.`secretaria` (`idsecretaria`));


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`empresa` (
  `CNPJ` VARCHAR(14) NOT NULL,
  `razaoSocial` VARCHAR(45) NOT NULL,
  `nomeFantasia` VARCHAR(45) NOT NULL,
  `ramo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`licitacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`licitacao` (
  `idlicitacao` INT NOT NULL,
  `dataLicitacao` DATE NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `idsecretaria` INT NOT NULL,
  PRIMARY KEY (`idlicitacao`),
  CONSTRAINT `fk_licitacao_secretaria1`
    FOREIGN KEY (`idsecretaria`)
    REFERENCES `licitacoes_contratos`.`secretaria` (`idsecretaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`contrato` (
  `idcontrato` INT NOT NULL,
  `dataContrato` DATE NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `idlicitacao` INT NOT NULL,
  PRIMARY KEY (`idcontrato`),
  CONSTRAINT `fk_contrato_licitacao1`
    FOREIGN KEY (`idlicitacao`)
    REFERENCES `licitacoes_contratos`.`licitacao` (`idlicitacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`empresasContratadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`empresasContratadas` (
  `contrato_idcontrato` INT NOT NULL,
  `empresa_CNPJ` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`contrato_idcontrato`, `empresa_CNPJ`),
  CONSTRAINT `fk_contrato_has_empresa_contrato1`
    FOREIGN KEY (`contrato_idcontrato`)
    REFERENCES `licitacoes_contratos`.`contrato` (`idcontrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_has_empresa_empresa1`
    FOREIGN KEY (`empresa_CNPJ`)
    REFERENCES `licitacoes_contratos`.`empresa` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `licitacoes_contratos`.`funcionariosResponsaveisContrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `licitacoes_contratos`.`funcionariosResponsaveisContrato` (
  `funcionario_CPF` VARCHAR(11) NOT NULL,
  `contrato_idcontrato` INT NOT NULL,
  PRIMARY KEY (`funcionario_CPF`, `contrato_idcontrato`),
  CONSTRAINT `fk_funcionario_has_contrato_funcionario1`
    FOREIGN KEY (`funcionario_CPF`)
    REFERENCES `licitacoes_contratos`.`funcionario` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_has_contrato_contrato1`
    FOREIGN KEY (`contrato_idcontrato`)
    REFERENCES `licitacoes_contratos`.`contrato` (`idcontrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
