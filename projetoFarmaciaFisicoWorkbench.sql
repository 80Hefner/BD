-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProjetoFarmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ProjetoFarmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProjetoFarmacia` DEFAULT CHARACTER SET utf8 ;
USE `ProjetoFarmacia` ;

-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(80) NOT NULL,
  `NIF` INT NULL,
  `Telemovel` INT NOT NULL,
  `eMail` VARCHAR(100) NULL,
  `Pass` VARCHAR(30) NOT NULL,
  `Cidade` VARCHAR(75) NULL,
  `CodigoPostal` VARCHAR(45) NULL,
  `Rua` VARCHAR(75) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `Nome` VARCHAR(80) NOT NULL,
  `IBAN` VARCHAR(25) NOT NULL,
  `NISS` VARCHAR(11) NOT NULL,
  `Telemovel` VARCHAR(20) NOT NULL,
  `eMail` VARCHAR(100) NULL,
  `Cidade` VARCHAR(75) NULL,
  `CodigoPostal` VARCHAR(20) NULL,
  `Rua` VARCHAR(75) NULL,
  `Salario` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`Fatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`Fatura` (
  `idFatura` INT NOT NULL,
  `DataFatura` DATETIME NOT NULL,
  `Desconto` INT NOT NULL,
  `IVA` INT NOT NULL,
  `PrecoTotal` DECIMAL(6,2) NOT NULL,
  `Funcionario_idFuncionário` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idFatura`),
  INDEX `fk_Fatura_Funcionário_idx` (`Funcionario_idFuncionário` ASC) VISIBLE,
  INDEX `fk_Fatura_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Fatura_Funcionário`
    FOREIGN KEY (`Funcionario_idFuncionário`)
    REFERENCES `ProjetoFarmacia`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fatura_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `ProjetoFarmacia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`ReceitasFatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`ReceitasFatura` (
  `codReceita` INT NOT NULL,
  `Fatura_idFatura` INT NOT NULL,
  PRIMARY KEY (`codReceita`),
  INDEX `fk_ReceitasFatura_Fatura1_idx` (`Fatura_idFatura` ASC) VISIBLE,
  CONSTRAINT `fk_ReceitasFatura_Fatura1`
    FOREIGN KEY (`Fatura_idFatura`)
    REFERENCES `ProjetoFarmacia`.`Fatura` (`idFatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`ProdutoFarmaceutico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`ProdutoFarmaceutico` (
  `idProduto` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Laboratorio` VARCHAR(45) NOT NULL,
  `Receita` CHAR(1) BINARY NOT NULL,
  `Validade` DATETIME NOT NULL,
  `UnidadesEmbalagem` VARCHAR(10) NOT NULL,
  `QuantidadeEmbalagem` DECIMAL(6,2) NOT NULL,
  `EmbalagensEmStock` INT NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProjetoFarmacia`.`LinhaFatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ProjetoFarmacia`.`LinhaFatura` (
  `PrecoUnitario` DECIMAL(6,2) NOT NULL,
  `PrecoTotal` DECIMAL(6,2) NOT NULL,
  `Quantidade` INT NOT NULL,
  `Fatura_idFatura` INT NOT NULL,
  `ProdutoFarmaceutico_idProduto` INT NOT NULL,
  INDEX `fk_Linha-Fatura_Produto-Famacêutico1_idx` (`ProdutoFarmaceutico_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Linha-Fatura_Fatura1`
    FOREIGN KEY (`Fatura_idFatura`)
    REFERENCES `ProjetoFarmacia`.`Fatura` (`idFatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linha-Fatura_Produto-Famacêutico1`
    FOREIGN KEY (`ProdutoFarmaceutico_idProduto`)
    REFERENCES `ProjetoFarmacia`.`ProdutoFarmaceutico` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
