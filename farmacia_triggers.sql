-- Trigger ativado quando é inserida uma linha na tabela LinhaFatura
DROP TRIGGER IF EXISTS insere_na_fatura;

DELIMITER //
CREATE TRIGGER insere_na_fatura AFTER INSERT ON linhafatura FOR EACH ROW
BEGIN
	-- Update da fatura
    UPDATE fatura SET precoTotal = precoTotal + (NEW.PrecoTotal * (1-(Desconto/100))) WHERE idFatura = NEW.Fatura;
    
    -- Update do stock
    UPDATE produto SET EmbalagensEmStock = EmbalagensEmStock - NEW.Quantidade WHERE idProduto = NEW.Produto;
END //
DELIMITER ;

-- CALL inserir_linha_fatura(7, 1, 5.99, 5.99, 1);
