-- Inserir um Funcionario
DROP PROCEDURE IF EXISTS inserir_funcionario;

DELIMITER //
CREATE PROCEDURE inserir_funcionario(IN idFuncionario INT, IN Nome VARCHAR(60), IN IBAN VARCHAR(25), IN NISS VARCHAR(11), IN Telemovel VARCHAR(20),
			IN Salario DECIMAL(6,2), IN Pass VARCHAR(30), IN eMail VARCHAR(45), IN Cidade VARCHAR(75), IN CodigoPostal VARCHAR(45), IN Rua VARCHAR(50))
            
BEGIN
INSERT INTO funcionario (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua)
VALUES (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua);

END //
DELIMITER ;

CALL inserir_funcionario(5, 'Jerónimo de Sousa', 'PT50547768716664920892230', '67203057242', '900000000', 1500, 'StalinGod', 'avanteportugal@pcp.pt','Lisboa', '1234-000 Chelas', 'Rua do Pão, 000');


-- Inserir um Funcionario
DROP PROCEDURE IF EXISTS inserir_produto;

DELIMITER //
CREATE PROCEDURE inserir_produto(IN idProduto INT, IN Designacao VARCHAR(20), IN Laboratorio VARCHAR(75), IN Administracao VARCHAR(20), IN ReceitaMedica CHAR(1),
			IN Dosagem VARCHAR(20), IN QuantidadeEmbalagem INT, IN Preco DECIMAL(6,2), IN Validade DATETIME, IN EmbalagensEmStock INT)
            
BEGIN
INSERT INTO produto (idProduto, Designacao, Laboratorio, Administracao, ReceitaMedica, Dosagem, QuantidadeEmbalagem, Preco, Validade, EmbalagensEmStock)
VALUES (idProduto, Designacao, Laboratorio, Administracao, ReceitaMedica, Dosagem, QuantidadeEmbalagem, Preco, Validade, EmbalagensEmStock);

END //
DELIMITER ;

CALL inserir_produto(30, 'Primadex', 'Cave do António', 'Uso cutâneo', '0', '1000 ml', 1, 14.20, '2021/04/20', 5);