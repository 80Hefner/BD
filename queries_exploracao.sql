-- Consultar os dados de um cliente
DROP PROCEDURE IF EXISTS dados_cliente;

DELIMITER //
CREATE PROCEDURE dados_cliente (IN nome VARCHAR(60))
BEGIN
	SELECT * FROM cliente WHERE cliente.Nome = nome;
END //
DELIMITER ;

-- CALL dados_cliente ('Francisco Correia Franco');


-- Consultar as faturas de um cliente
DROP PROCEDURE IF EXISTS faturas_cliente;

DELIMITER //
CREATE PROCEDURE faturas_cliente (IN nome VARCHAR(60))
BEGIN
	SET @id = (SELECT idCliente FROM cliente WHERE cliente.Nome = nome);
	SELECT * FROM fatura WHERE fatura.Cliente = @id;
END //
DELIMITER ;

-- CALL faturas_cliente ('Maria Beatriz Araújo Lacerda');


-- Verificar disponibilidade de um produto
DROP PROCEDURE IF EXISTS verificar_disponibilidade_produto;

DELIMITER //
CREATE PROCEDURE verificar_disponibilidade_produto (IN nome_produto VARCHAR(20))
BEGIN
	SELECT * FROM produto WHERE designacao = nome_produto;
END //
DELIMITER ;

-- CALL verificar_disponibilidade_produto ('Halibut');
-- CALL verificar_disponibilidade_produto ('Parodontax');


-- Procurar um cliente
DROP PROCEDURE IF EXISTS procurar_cliente;

DELIMITER //
CREATE PROCEDURE procurar_cliente (IN nome VARCHAR(60))
BEGIN
	SELECT * FROM cliente WHERE cliente.Nome = nome;
END //
DELIMITER ;

-- CALL procurar_cliente ('Francisco Correia Franco');


-- Consultar os diversos produtos
DROP PROCEDURE IF EXISTS consultar_produtos;

DELIMITER //
CREATE PROCEDURE consultar_produtos ()
BEGIN
	SELECT * FROM produto;
END //
DELIMITER ;

-- CALL consultar_produtos ();


-- Consultar um produto farmacêutico
DROP PROCEDURE IF EXISTS consultar_produto_designacao;

DELIMITER //
CREATE PROCEDURE consultar_produto_designacao (IN desig VARCHAR(20))
BEGIN
	SELECT * FROM produto WHERE Designacao = desig;
END //
DELIMITER ;

-- CALL consultar_produto_designacao('Halibut');


-- Consultar o vencimento de um funcionário
DROP PROCEDURE IF EXISTS consultar_vencimento_funcionario;

DELIMITER //
CREATE PROCEDURE consultar_vencimento_funcionario (IN nome VARCHAR(60))
BEGIN
	SELECT idFuncionario, Nome, Salario FROM funcionario f WHERE f.Nome = nome;
END //
DELIMITER ;

-- CALL consultar_vencimento_funcionario('Jaime Oliveira');


-- Consultar quantas vendas foram feitas num certo período de tempo
DROP FUNCTION IF EXISTS numero_vendas_entre;

DELIMITER //
CREATE FUNCTION numero_vendas_entre (dataInicial DATETIME, dataFinal DATETIME) RETURNS INT
BEGIN
	RETURN (SELECT COUNT(*) AS TotalVendas FROM fatura f WHERE f.DataFatura >= dataInicial AND f.DataFatura <= dataFinal);
END //
DELIMITER ;

-- SELECT numero_vendas_entre('2020/12/04 10:16:00', '2020/12/04 12:00:00');


-- Consultar o total faturado pela farmácia num certo período de tempo
DROP FUNCTION IF EXISTS total_faturado_entre;

DELIMITER //
CREATE FUNCTION total_faturado_entre (dataInicial DATETIME, dataFinal DATETIME) RETURNS DECIMAL(6,2)
BEGIN
	RETURN (SELECT SUM(PrecoTotal) AS TotalFaturado FROM fatura f WHERE f.DataFatura >= dataInicial AND f.DataFatura <= dataFinal);
END //
DELIMITER ;

-- SELECT total_faturado_entre('2020/12/04 10:16:00', '2020/12/04 12:00:00');


-- Consultar quem faturou mais num certo período de tempo
DROP PROCEDURE IF EXISTS quem_faturou_mais_entre;

DELIMITER //
CREATE PROCEDURE quem_faturou_mais_entre (IN dataInicial DATETIME, IN dataFinal DATETIME)
BEGIN
	SELECT f.Funcionario AS funcionario, SUM(f.PrecoTotal) AS total FROM fatura f WHERE f.DataFatura >= dataInicial AND f.DataFatura <= dataFinal
    GROUP BY funcionario ORDER BY total DESC LIMIT 1;
END //
DELIMITER ;

-- CALL quem_faturou_mais_entre('2020/12/03 10:16:00', '2020/12/05 12:00:00');


-- Consultar os 'n' produtos farmacêuticos mais vendidos 
DROP PROCEDURE IF EXISTS produtos_mais_vendidos;

DELIMITER //
CREATE PROCEDURE produtos_mais_vendidos (IN n INT)
BEGIN
	SELECT lf.Produto AS IDProduto, p.Designacao AS Designacao, SUM(lf.Quantidade) AS totalVendido
    FROM linhaFatura lf, produto p
    WHERE lf.Produto = p.idProduto
    GROUP BY IDProduto ORDER BY totalVendido DESC LIMIT n;
END //
DELIMITER ;

-- CALL produtos_mais_vendidos(3);


-- Consultar o cliente que mais compras efetuou num certo período de tempo 
DROP PROCEDURE IF EXISTS quem_comprou_mais_entre;

DELIMITER //
CREATE PROCEDURE quem_comprou_mais_entre (IN dataInicial DATETIME, IN dataFinal DATETIME)
BEGIN
	SELECT f.Cliente AS IDCliente, c.Nome AS nomeCliente, COUNT(f.Cliente) AS total
    FROM fatura f, cliente c
    WHERE f.Cliente = c.idCliente AND f.DataFatura >= dataInicial AND f.DataFatura <= dataFinal
    GROUP BY IDCliente ORDER BY total DESC LIMIT 1;
END //
DELIMITER ;

-- CALL quem_comprou_mais_entre('2020/12/03 10:16:00', '2020/12/05 12:00:00');