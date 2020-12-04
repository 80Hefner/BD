-- Alterar as informações pessoais de um cliente
-- Alterar NIF
DROP PROCEDURE IF EXISTS alterar_nif_cliente;

DELIMITER //
CREATE PROCEDURE alterar_nif_cliente (IN nome VARCHAR(60), IN nif_novo VARCHAR(9))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET NIF = nif_novo WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_nif_cliente ('Carminho Cunha Bastos', '543234000');

-- Alterar Telemovel
DROP PROCEDURE IF EXISTS alterar_telemovel_cliente;

DELIMITER //
CREATE PROCEDURE alterar_telemovel_cliente (IN nome VARCHAR(60), IN telemovel_novo VARCHAR(20))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Telemovel = telemovel_novo WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_telemovel_cliente ('Carminho Cunha Bastos', '918888888');

-- Alterar eMail
DROP PROCEDURE IF EXISTS alterar_email_cliente;

DELIMITER //
CREATE PROCEDURE alterar_email_cliente (IN nome VARCHAR(60), IN email_novo VARCHAR(45))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET eMail = email_novo WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_email_cliente ('Carminho Cunha Bastos', 'cbastos@gmail.com');

-- Alterar Pass
DROP PROCEDURE IF EXISTS alterar_pass_cliente;

DELIMITER //
CREATE PROCEDURE alterar_pass_cliente (IN nome VARCHAR(60), IN pass_nova VARCHAR(30))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Pass = pass_nova WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_pass_cliente ('Carminho Cunha Bastos', 'BastosBoy1976');

-- Alterar Cidade
DROP PROCEDURE IF EXISTS alterar_cidade_cliente;

DELIMITER //
CREATE PROCEDURE alterar_cidade_cliente (IN nome VARCHAR(60), IN cidade_nova VARCHAR(30))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Cidade = cidade_nova WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_cidade_cliente ('Carminho Cunha Bastos', 'Vila Nova de Cordoniz');

-- Alterar Codigo Postal
DROP PROCEDURE IF EXISTS alterar_codigoPostal_cliente;

DELIMITER //
CREATE PROCEDURE alterar_codigoPostal_cliente (IN nome VARCHAR(60), IN codigoPostal_novo VARCHAR(45))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET CodigoPostal = codigoPostal_novo WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_codigoPostal_cliente ('Carminho Cunha Bastos', '6000-600 VNC');

-- Alterar Rua
DROP PROCEDURE IF EXISTS alterar_rua_cliente;

DELIMITER //
CREATE PROCEDURE alterar_rua_cliente (IN nome VARCHAR(60), IN rua_nova VARCHAR(50))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Rua = rua_nova WHERE idCliente = @id;
END //
DELIMITER ;

-- CALL alterar_rua_cliente ('Carminho Cunha Bastos', 'Rua das Tranças do Careca, 177');


-- Registar novos clientes
DROP PROCEDURE IF EXISTS registar_cliente;

DELIMITER //
CREATE PROCEDURE registar_cliente (IN idCliente INT, IN Nome VARCHAR(60), IN NIF VARCHAR(9), IN Telemovel VARCHAR(20), IN eMail VARCHAR(45),
									IN Pass VARCHAR(30), IN Cidade VARCHAR(30), IN CodigoPostal VARCHAR(45), IN Rua VARCHAR(50))
BEGIN
	INSERT INTO cliente (idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua)
	VALUES (idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua);
END //
DELIMITER ;

-- CALL registar_cliente(12, 'Rogério Matias', 321654987, 969696969, 'matias@gmail.com', 'Pass123', 'Braga', '4710-000 Braga', 'Rua das Andorinhas, 10');

-- Inserir uma Fatura
DROP PROCEDURE IF EXISTS inserir_fatura;

DELIMITER //
CREATE PROCEDURE inserir_fatura(IN idFatura INT, IN Funcionario INT, IN Cliente INT, IN DataFatura DATETIME,
								IN Desconto INT, IN IVA INT, IN PrecoTotal DECIMAL(6,2))
BEGIN
	INSERT INTO fatura (idFatura, Funcionario, Cliente, DataFatura, Desconto, IVA, PrecoTotal)
	VALUES (idFatura, Funcionario, Cliente, DataFatura, Desconto, IVA, PrecoTotal);

END //
DELIMITER ;

-- CALL inserir_fatura(8, 5, 11, '2020/12/04 18:40:51', 0, 6, 14.99);


-- Inserir uma LinhaFatura
DROP PROCEDURE IF EXISTS inserir_linha_fatura;

DELIMITER //
CREATE PROCEDURE inserir_linha_fatura(IN Fatura INT, IN Produto INT, IN PrecoUnitario DECIMAL(6,2),
										IN PrecoTotal DECIMAL(6,2), IN Quantidade INT)
BEGIN
INSERT INTO linhafatura (Fatura, Produto, PrecoUnitario, PrecoTotal, Quantidade)
VALUES (Fatura, Produto, PrecoUnitario, PrecoTotal, Quantidade);

END //
DELIMITER ;

-- CALL inserir_linha_fatura(7, 1, 5.99, 5.99, 1);

-- Registar novos funcionários
DROP PROCEDURE IF EXISTS registar_funcionario;

DELIMITER //
CREATE PROCEDURE registar_funcionario (IN idFuncionario INT, IN Nome VARCHAR(60), IN IBAN VARCHAR(25), IN NISS VARCHAR(11), IN Telemovel VARCHAR(20),
			IN Salario DECIMAL(6,2), IN Pass VARCHAR(30), IN eMail VARCHAR(45), IN Cidade VARCHAR(30), IN CodigoPostal VARCHAR(45), IN Rua VARCHAR(50))
BEGIN
	INSERT INTO funcionario (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua)
	VALUES (idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua);
END //
DELIMITER ;

-- CALL registar_funcionario(5, 'Jerónimo de Sousa', 'PT50547768716664920892230', '67203057242', '900000000', 1500, 'StalinGod', 'avanteportugal@pcp.pt','Lisboa', '1234-000 Chelas', 'Rua do Pão, 000');
