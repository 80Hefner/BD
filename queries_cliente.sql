-- Requisitos de exploração

-- Consultar os seus dados
DROP PROCEDURE IF EXISTS dados_cliente;

DELIMITER //
CREATE PROCEDURE dados_cliente (IN nome VARCHAR(60))
BEGIN
	SELECT * FROM cliente WHERE cliente.Nome = nome;
END //
DELIMITER ;

CALL dados_cliente ('Francisco Correia Franco');

-- Consultar as suas faturas
DROP PROCEDURE IF EXISTS faturas_cliente;

DELIMITER //
CREATE PROCEDURE faturas_cliente (IN nome VARCHAR(60))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	SELECT * FROM fatura WHERE fatura.Cliente = @id;
END //
DELIMITER ;

CALL faturas_cliente ('Maria Beatriz Araújo Lacerda');

-- Consultar as suas faturas
DROP PROCEDURE IF EXISTS verificar_disponibilidade_produto;

DELIMITER //
CREATE PROCEDURE verificar_disponibilidade_produto (IN nome_produto VARCHAR(20))
BEGIN
	SELECT * FROM produto WHERE designacao = nome_produto;
END //
DELIMITER ;

CALL verificar_disponibilidade_produto ('Halibut');
CALL verificar_disponibilidade_produto ('Parodontax');


-- Requisitos de controlo

-- Alterar as suas informações pessoais
-- Alterar NIF
DROP PROCEDURE IF EXISTS alterar_nif_cliente;

DELIMITER //
CREATE PROCEDURE alterar_nif_cliente (IN nome VARCHAR(60), IN nif_novo VARCHAR(9))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET NIF = nif_novo WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_nif_cliente ('Carminho Cunha Bastos', '543234000');

-- Alterar Telemovel
DROP PROCEDURE IF EXISTS alterar_telemovel_cliente;

DELIMITER //
CREATE PROCEDURE alterar_telemovel_cliente (IN nome VARCHAR(60), IN telemovel_novo VARCHAR(20))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Telemovel = telemovel_novo WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_telemovel_cliente ('Carminho Cunha Bastos', '918888888');

-- Alterar eMail
DROP PROCEDURE IF EXISTS alterar_email_cliente;

DELIMITER //
CREATE PROCEDURE alterar_email_cliente (IN nome VARCHAR(60), IN email_novo VARCHAR(45))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET eMail = email_novo WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_email_cliente ('Carminho Cunha Bastos', 'cbastos@gmail.com');

-- Alterar Pass
DROP PROCEDURE IF EXISTS alterar_pass_cliente;

DELIMITER //
CREATE PROCEDURE alterar_pass_cliente (IN nome VARCHAR(60), IN pass_nova VARCHAR(30))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Pass = pass_nova WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_pass_cliente ('Carminho Cunha Bastos', 'BastosBoy1976');

-- Alterar Cidade
DROP PROCEDURE IF EXISTS alterar_cidade_cliente;

DELIMITER //
CREATE PROCEDURE alterar_cidade_cliente (IN nome VARCHAR(60), IN cidade_nova VARCHAR(30))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Cidade = cidade_nova WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_cidade_cliente ('Carminho Cunha Bastos', 'Vila Nova de Cordoniz');

-- Alterar Codigo Postal
DROP PROCEDURE IF EXISTS alterar_codigoPostal_cliente;

DELIMITER //
CREATE PROCEDURE alterar_codigoPostal_cliente (IN nome VARCHAR(60), IN codigoPostal_novo VARCHAR(45))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET CodigoPostal = codigoPostal_novo WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_codigoPostal_cliente ('Carminho Cunha Bastos', '6000-600 VNC');

-- Alterar Rua
DROP PROCEDURE IF EXISTS alterar_rua_cliente;

DELIMITER //
CREATE PROCEDURE alterar_rua_cliente (IN nome VARCHAR(60), IN rua_nova VARCHAR(50))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	UPDATE cliente SET Rua = rua_nova WHERE idCliente = @id;
END //
DELIMITER ;

CALL alterar_rua_cliente ('Carminho Cunha Bastos', 'Rua das Tranças do Careca, 177');