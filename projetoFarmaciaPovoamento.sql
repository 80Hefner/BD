--
-- Esquema: "Farmácia"
USE `ProjetoFarmacia` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Povoamento da tabela "Cliente"
INSERT INTO cliente
	(idCliente, Nome, NIF, Telemovel, eMail, Pass, Cidade, CodigoPostal, Rua)
	VALUES 
		(1, 'João da Costa e Campos', 	      '123456789',  '911111111',  'jcc@ntbh.pt',  'JonyCosta83',  'Aguada do Queixo',
			'9999-99-99 Queijadas',           'Rua das Adegas Felizes, 12, 1ª Cave'),
		(2, 'Josefina Vivida da Paz', 	      '122133144',  '912222222',  'josefina@ntbh.pt', 'JosfPazz', 'Friso do Eixo',
			'7799-77-77 Friso do Eixo',       'Av dos Castros Reais, 122, 3º'),
		(3, 'Ana Santa do Carmo', 		      '876543298',  '913333333',  'saca@ntbh.pt',  'SantaCarmo123',  'Abre o Tacho',
			'4534-54-21 Vale do Tacho',       'Travessa do Jacob, 21'),
		(4, 'Jesualdo Peza-Mor', 		      '564352786',  '914444444',  'pezamor@ntbh.pt',  'JesusJ88',  'Vale dos Lençóis',
			'1245-64-11 Camadas',             'Estrada do Sossego, Km10'),
		(5, 'Maria da Trindade Pascoal',      '777666555',  '915555555',  'trindade@ntbh.pt',  'Teletubbies2000',  'Aguada do Queixo',
			'9999-99-99 Queijadas',           'Rua das Adegas da Rua, 15, 10 Esq/T'),
		(6, 'Florindo Teixo Figueirinha',     '787676651',  '916666666',  'teixof@ntbh.pt',  'Flores6969',  'Veloandro',
			'5555-59-55 Veloandro',           'Autódromo das Vagas, Garagem 123'),
		(7, 'Carminho Cunha Bastos', 	      '543234111',  '917777777',  'cbastos@ntbh.pt',  'CunhaBoy1976',  'Vitalis do Sousa',
			'6532-A2-43 Vitalis',             'Rua do Mus-Vitalis, 56, r/c '),
		(8, 'Francisco Correia Franco',       '152152152',  '969007408',  'sanic@gmail.com',  'Gottagofast123',  'Povoação',
			'1976-152 Povoação',              'Rua do Povo, 152'),
		(9, 'Maria Quintas Barros',           '044044044',  '967399483',  'mosarte@gmail.com',  'Tamtamtam123',  'Povoação',
			'1976-044 Povoção',               'Rua do Povo, 44'),
		(10,'Maria Beatriz Araújo Lacerda',   '136136136',  '961150609',  'eskilo@gmail.com',  '123Macacochines',  'Povoação',
			'1976-136 Povoação',              'Rua do Povo, 136'),
		(11,'Ana Teresa Gião Gomes',          '158158158',  '916841002',  'babbles@gmail.com',  'MantorrasPrimo2000',  'Povoação',
			'1976-158 Povoação',              'Rua do Povo, 158')
	;
--
-- DELETE FROM Cliente;
-- SELECT * FROM Cliente;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Povoamento da tabela "Funcionario"
INSERT INTO funcionario
	(idFuncionario, Nome, IBAN, NISS, Telemovel, Salario, Pass, eMail, Cidade, CodigoPostal, Rua)
	VALUES 
		(1, 'Álvaro de Campos',      'PT50447190141202842236851',  '82953993927',  '921111111',  1000,  'AlvarIX',
			'alvaro@pessoa.pt',      'Encosta do Sabonete',  '1111-999 Sabonete',  'Rua Limpa, 123, 4º Esq'),
		(2, 'Joaquim Arnaldo',       'PT50066364552108015180912',  '44995242528',  '921111112',  1200,  'Escopetas123',
			'arnalds@gmail.com',     'Porto',  '2222-999 Boavista',  'Travessa da Boavista, 69'),
		(3, 'Tibúrcio Mantorras',    'PT50836833437107073483503',  '54556336057',  '921111113',  1200,  'Tibititi90',
			'tiburcio@gmail.com',    'Porto',  '3333-999 Boavista',  'Rua do Oculista, 456'),
		(4, 'Jaime Oliveira',        'PT50513575430934735563824',  '11533672286',  '963812190',  2000,  '5SherkBoy',
			'jaiminho@gmail.com',    'Braga',  '4710-405 Enguardas',  'Rua Sr. da Paz, 5')
	;
--
-- DELETE FROM Funcionario;
-- SELECT * FROM Funcionario;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Povoamento da tabela "Produto"
INSERT INTO produto
	(idProduto, Designacao, Laboratorio, Administracao, ReceitaMedica, Dosagem, QuantidadeEmbalagem, Preco, Validade, EmbalagensEmStock)
	VALUES 
		(1, 'Zemalex', 'Italfarmaco - Produtos Farmacêuticos, Lda.', 'Uso cutâneo', '1', '100 ml', 1, 5.99, '2021/07/31', 10),
        (2, 'Bepanthene', 'Bayer Portugal, S.A.', 'Uso cutâneo', '0', '100 g', 1, 4.99, '2021/05/01', 10),
        (3, 'Imodium', 'Johnson & Johnson, Lda.', 'Via oral', '1', '2 mg', 20, 14.99, '2021/05/10', 6),
        (4, 'Voltaren', 'Novartis Farma - Produtos Farmacêuticos, S.A.', 'Via oral', '1', '50 mg', 20, 12.99, '2021/08/01', 4),
        (5, 'Voltaren Emulgel', 'Novartis Consumer Health - Produtos Farmacêuticos e Nutrição Lda.', 'Uso cutâneo', '0', '100 g', 1, 11.50, '2021/04/01', 4),
        (6, 'Voltaren Rapid', 'Novartis Farma - Produtos Farmacêuticos, S.A.', 'Via oral', '1', '25 mg', 20, 14.99, '2021/08/01', 5),
        (7, 'Urispas', 'Jaba Recordati, S. A.', 'Via oral', '1', '200 mg', 60, 7.99, '2021/07/01', 3),
        (8, 'Brufen', 'Abbott Laboratórios, Lda.', 'Via oral', '1', '400 mg', 20, 7.35, '2021/09/01', 15),
        (9, 'Brufen', 'Abbott Laboratórios, Lda.', 'Via oral', '1', '600 mg', 20, 10.50, '2021/09/01', 15),
        (10, 'Esomeprazol Alter', 'Alter, S.A.', 'Via oral', '1', '20 mg', 56, 7.99, '2021/04/20', 7),
        (11, 'Esomeprazol Alter', 'Alter, S.A.', 'Via oral', '1', '40 mg', 56, 13.99, '2021/04/20', 4),
        (12, 'Fenistil', 'Novartis Consumer Health - Produtos Farmacêuticos e Nutrição Lda.', 'Via oral', '0', '1 mg', 20, 7.50, '2021/05/31', 5),
        (13, 'Fenistil', 'Novartis Consumer Health - Produtos Farmacêuticos e Nutrição Lda.', 'Via oral', '0', '4 mg', 20, 11.50, '2021/05/31', 5),
        (14, 'Fenistil Gel', 'Novartis Consumer Health - Produtos Farmacêuticos e Nutrição Lda.', 'Uso cutâneo', '0', '50 g', 1, 9.75, '2021/04/01', 7),
        (15, 'Furadantina MC', 'Goldshield Pharmaceuticals, Ltd.', 'Via oral', '1', '50 mg', 20, 8.99, '2021/09/30', 3),
        (16, 'Furadantina MC', 'Mercury Pharmaceuticals Ltd', 'Via oral', '1', '100 mg', 50, 13.99, '2021/08/31', 4),
        (17, 'Unisedil', 'Laquifa - Laboratórios, S.A.', 'Via oral', '1', '5 mg', 40, 5.99, '2021/08/01', 6),
        (18, 'Rosilan', 'Laboratórios Vitória, S.A.', 'Via oral', '1', '6 mg', 20, 6.99, '2021/10/01', 6),
        (19, 'Rosilan', 'Laboratórios Vitória, S.A.', 'Via oral', '1', '30 mg', 10, 9.99, '2021/10/01', 3),
        (20, 'Rinialer', 'Bialfar - Produtos Farmacêuticos, S.A.', 'Via oral', '1', '10 mg', 15, 7.35, '2021/10/31', 5),
        (21, 'Bilaxten', 'Laboratórios Vitória, S.A.', 'Via oral', '1', '20 mg', 10, 8.50, '2021/08/01', 4),
        (22, 'Cetix', 'Medinfar Consumer Health - Produtos Farmacêuticos, Lda.', 'Via oral', '0', '10 mg', 10, 8.99, '2021/07/01', 6),
        (23, 'Bisoltussin', 'Boehringer Ingelheim, Lda.', 'Via bucal', '0', '10.5 mg', 20, 7.95, '2021/06/01', 5),
        (24, 'Arnigel', 'Laboratoires Boiron, S.A.', 'Uso cutâneo', '0', '45 g', 1, 7.50, '2021/05/01', 3),
        (25, 'Halibut', 'Grünenthal, S.A.', 'Uso cutâneo', '0', '100 g', 1, 7.75, '2021/06/01', 7),
        (26, 'Halibut', 'Grünenthal, S.A.', 'Uso cutâneo', '0', '50 g', 1, 4.35, '2021/06/01', 5),
        (27, 'Ben-U-Ron', 'Bene Farmacêutica, Lda.', 'Via oral', '0', '500 mg', 20, 5.35, '2021/08/01', 10),
        (28, 'Ben-U-Ron', 'Bene Farmacêutica, Lda.', 'Via oral', '0', '1000 mg', 20, 8.95, '2021/08/01', 15),
        (29, 'Ben-U-Ron', 'Bene Farmacêutica, Lda.', 'Via oral', '0', '1000 mg', 36, 14.95, '2021/08/01', 8)	
	;
--
-- DELETE FROM Produto;
-- SELECT * FROM Produto;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Povoamento da tabela "Fatura"
INSERT INTO fatura
	(idFatura, Funcionario, Cliente, DataFatura, Desconto, IVA, PrecoTotal)
	VALUES 
		(1, 4, 11, '2020/12/04 10:10:32', 5, 6, 12.34),
        (2, 4, 10, '2020/12/04 10:15:17', 0, 6, 13.98),
        (3, 4, 9,  '2020/12/04 11:47:52', 0, 6, 7.75),
        (4, 4, 8,  '2020/12/04 11:51:05', 0, 6, 17.98),
        (5, 3, 10, '2020/12/04 15:45:27', 0, 6, 7.35),
        (6, 3, 5,  '2020/12/04 15:51:11', 0, 6, 22.98),
        (7, 3, 1,  '2020/12/04 17:35:20', 0, 6, 7.95)
	;
--
-- DELETE FROM Fatura;
-- SELECT * FROM Fatura;


-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-- Povoamento da tabela "LinhaFatura"
INSERT INTO linhafatura
	(Fatura, Produto, PrecoUnitario, PrecoTotal, Quantidade)
	VALUES
		(1, 2, 4.99, 4.99, 1),
        (1, 8, 7.35, 7.35, 1),
        (2, 18, 6.99, 13.98, 2),
        (3, 25, 7.75, 7.75, 1),
        (4, 22, 8.99, 17.98, 2),
        (5, 8, 7.35, 7.35, 1),
        (6, 11, 13.99, 13.99, 1),
        (6, 7, 7.99, 7.99, 1),
        (7, 23, 7.95, 7.95, 1)
	;
--
-- DELETE FROM LinhaFatura;
-- SELECT * FROM LinhaFatura;