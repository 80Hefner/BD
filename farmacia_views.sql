-- VIEW das faturas e clientes associados
DROP VIEW IF EXISTS view_faturas;

DELIMITER //
CREATE VIEW view_faturas
AS
	SELECT c.Nome AS Nome_Cliente, f.Nome AS Nome_Funcionario, fat.DataFatura AS Data_Compra, fat.IVA AS IVA, fat.PrecoTotal AS Dinheiro_Gasto
    FROM fatura fat
    INNER JOIN cliente AS c ON fat.Cliente = c.idCliente
    INNER JOIN funcionario AS f ON fat.Funcionario = f.idFuncionario;
//
DELIMITER ;
    
SELECT * FROM view_faturas;


-- VIEW das linhas duma fatura e dos produtos associados
DROP VIEW IF EXISTS view_linhas_fatura;

DELIMITER //
CREATE VIEW view_linhas_fatura
AS
	SELECT lf.Fatura AS Fatura, p.Designacao AS Designacao_Produto, p.Administracao AS Administracao, lf.PrecoUnitario AS Preco_Por_Embalagem, lf.Quantidade AS Embalagens
    FROM linhaFatura lf
    INNER JOIN produto AS p ON lf.Produto = p.idProduto
    ORDER BY Fatura ASC;
//
DELIMITER ;
    
SELECT * FROM view_linhas_fatura;