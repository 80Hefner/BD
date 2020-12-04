-- Inserir um Cliente
DROP PROCEDURE IF EXISTS inserir_cliente;

DELIMITER $$
CREATE PROCEDURE inserir_cliente(IN idCliente INT, IN Nome VARCHAR(80), IN NIF VARCHAR(9), IN Telemovel VARCHAR(20),
			IN eMail VARCHAR(100), IN Pass VARCHAR(30), IN Cidade VARCHAR(75), IN CodigoPostal VARCHAR(45), IN Rua VARCHAR(75))
            
BEGIN
INSERT INTO cliente (idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua)
VALUES (idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua);

END $$
DELIMITER ;

CALL inserir_cliente(12, 'Rogério Matias', 321654987, 969696969, 'matias@gmail.com', 'Pass123', 'Braga', '4710-000 Braga', 'Rua das Andorinhas, 10');


-- Inserir um Funcionario
DROP PROCEDURE IF EXISTS inserir_funcionario;

DELIMITER $$
CREATE PROCEDURE inserir_funcionario(IN idFuncionario INT, IN Nome VARCHAR(80), IN IBAN VARCHAR(25), IN NISS VARCHAR(11), IN Telemovel VARCHAR(20),
			IN Salario DECIMAL(6,2), IN Pass VARCHAR(30), IN eMail VARCHAR(100), IN Cidade VARCHAR(75), IN CodigoPostal VARCHAR(45), IN Rua VARCHAR(75))
            
BEGIN
INSERT INTO funcionario (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua)
VALUES (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua);

END $$
DELIMITER ;

CALL inserir_funcionario(5, 'Jerónimo de Sousa', 'PT50547768716664920892230', '67203057242', '900000000', 1500, 'StalinGod', 'avanteportugal@pcp.pt','Lisboa', '1234-000 Chelas', 'Rua do Pão, 000');


-- Inserir um Funcionario
DROP PROCEDURE IF EXISTS inserir_produto;

DELIMITER $$
CREATE PROCEDURE inserir_produto(IN idProduto INT, IN Designacao VARCHAR(20), IN Laboratorio VARCHAR(75), IN Administracao VARCHAR(20), IN ReceitaMedica CHAR(1),
			IN Dosagem VARCHAR(20), IN QuantidadeEmbalagem INT, IN Preco DECIMAL(6,2), IN Validade DATETIME, IN EmbalagensEmStock INT)
            
BEGIN
INSERT INTO produto (idProduto, Designacao, Laboratorio, Administracao, ReceitaMedica, Dosagem, QuantidadeEmbalagem, Preco, Validade, EmbalagensEmStock)
VALUES (idProduto, Designacao, Laboratorio, Administracao, ReceitaMedica, Dosagem, QuantidadeEmbalagem, Preco, Validade, EmbalagensEmStock);

END $$
DELIMITER ;

CALL inserir_produto(30, 'Primadex', 'Cave do António', 'Uso cutâneo', '0', '1000 ml', 1, 14.20, '2021/04/20', 5);


-- Inserir uma Fatura
DROP PROCEDURE IF EXISTS inserir_fatura;

DELIMITER $$
CREATE PROCEDURE inserir_fatura(IN idFatura INT, IN Funcionario INT, IN Cliente INT, IN DataFatura DATETIME,
								IN Desconto INT, IN IVA INT, IN PrecoTotal DECIMAL(6,2))

BEGIN
INSERT INTO fatura (idFatura, Funcionario, Cliente, DataFatura, Desconto, IVA, PrecoTotal)
VALUES (idFatura, Funcionario, Cliente, DataFatura, Desconto, IVA, PrecoTotal);

END $$
DELIMITER ;

CALL inserir_fatura(8, 5, 11, '2020/12/04 18:40:51', 0, 6, 14.99);


-- Inserir uma LinhaFatura
DROP PROCEDURE IF EXISTS inserir_linha_fatura;

DELIMITER $$
CREATE PROCEDURE inserir_linha_fatura(IN Fatura INT, IN Produto INT, IN PrecoUnitario DECIMAL(6,2),
										IN PrecoTotal DECIMAL(6,2), IN Quantidade INT)

BEGIN
INSERT INTO linhafatura (Fatura, Produto, PrecoUnitario, PrecoTotal, Quantidade)
VALUES (Fatura, Produto, PrecoUnitario, PrecoTotal, Quantidade);

END $$
DELIMITER ;

CALL inserir_linha_fatura(8, 3, 14.99, 14.99, 1);