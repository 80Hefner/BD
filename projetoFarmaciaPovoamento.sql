--
-- Esquema: "Farmácia"
USE `ProjetoFarmacia` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

--
-- Povoamento da tabela "Cliente"
INSERT INTO cliente
	(idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua)
	VALUES 
		(1, 'João da Costa e Campos', 	  123456789,  911111111,  'jcc@ntbh.pt',  'JonyCosta83',  'Aguada do Queixo',
			'9999-99-99 Queijadas',       'Rua das Adegas Felizes, 12, 1ª Cave'),
		(2, 'Josefina Vivida da Paz', 	  122133144,  912222222,  'josefina@ntbh.pt', 'JosfPazz', 'Friso do Eixo',
			'7799-77-77 Friso do Eixo',   'Av dos Castros Reais, 122, 3º'),
		(3, 'Ana Santa do Carmo', 		  876543298,  913333333,  'saca@ntbh.pt',  'SantaCarmo123',  'Abre o Tacho',
			'4534-54-21 Vale do Tacho',   'Travessa do Jacob, 21'),
		(4, 'Jesualdo Peza-Mor', 		  564352786,  914444444,  'pezamor@ntbh.pt',  'JesusJ88',  'Vale dos Lençóis',
			'1245-64-11 Camadas',         'Estrada do Sossego, Km10'),
		(5, 'Maria da Trindade Pascoal',  777666555,  915555555,  'trindade@ntbh.pt',  'Teletubbies2000',  'Aguada do Queixo',
			'9999-99-99 Queijadas',       'Rua das Adegas da Rua, 15, 10 Esq/T'),
		(6, 'Florindo Teixo Figueirinha', 787676651,  916666666,  'teixof@ntbh.pt',  'Flores6969',  'Veloandro',
			'5555-59-55 Veloandro',       'Autódromo das Vagas, Garagem 123'),
		(7, 'Carminho Cunha Bastos', 	  543234111,  917777777,  'cbastos@ntbh.pt',  'CunhaBoy1976',  'Vitalis do Sousa',
			'6532-A2-43 Vitalis',         'Rua do Mus-Vitalis, 56, r/c ')
	;
--
-- DELETE FROM Cliente;
-- SELECT * FROM Cliente;