-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para loja_eletronicos_math
DROP DATABASE IF EXISTS `loja_eletronicos_math`;
CREATE DATABASE IF NOT EXISTS `loja_eletronicos_math` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `loja_eletronicos_math`;

-- Copiando estrutura para tabela loja_eletronicos_math.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sobrenome` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `senha` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `cpf` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pix` varchar(50) NOT NULL,
  `cep` varchar(300) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.cliente: ~4 rows (aproximadamente)
INSERT INTO `cliente` (`codCliente`, `nome`, `sobrenome`, `email`, `senha`, `cpf`, `pix`, `cep`, `num`) VALUES
	(1, 'Isabella', 'Fagundes', 'isabellamome@gmail.com', 'Isis14032006.', '93846523454', 'isabellamome@gmail.com', '20130066', 121),
	(4, 'Leopoldina', 'Sacconi', 'leopoldinasacconi@gmail.com', 'leopoldina1234', '82345683598', '82345683598', '37136066', 111),
	(7, 'Johann', 'Sacconi', 'johannsacconi@gmail.com', 'johann', '13642344674', '13642344674', '37136066', 111),
	(8, 'Tulio', 'Dias', 'tuliodias@gmail.com', 'tulio', '38465349234', 'tuliodias@gmail.com', '10176099', 134);

-- Copiando estrutura para tabela loja_eletronicos_math.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `codFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `senha` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cpf` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `cargo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nascimento` date DEFAULT NULL,
  `salario` double NOT NULL,
  `codCidade` int(11) DEFAULT NULL,
  `cep` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`codFuncionario`),
  KEY `FK_funcionario_cidade` (`codCidade`),
  CONSTRAINT `FK_funcionario_cidade` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.funcionario: ~9 rows (aproximadamente)
INSERT INTO `funcionario` (`codFuncionario`, `nome`, `email`, `senha`, `cpf`, `cargo`, `nascimento`, `salario`, `codCidade`, `cep`, `num`) VALUES
	(1, 'Johann', 'johannsacconi@gmail.com', '12345678', '13642344674', 'Fundador', '2006-03-14', 10000, 9, '37136066', 111),
	(2, 'Luis', 'luisricardo@gmail.com', '12345678', '39258923854', 'Gerente', '2006-03-14', 5000, 8, '37136066', 111),
	(3, 'Gustavo', 'gustavodias@gmail.com', '12345678', '29835629563', 'Motorista', '2006-03-14', 3000, 10, '37136066', 111),
	(4, 'Pedro', 'pedromatos@gmail.com', '12345678', '78345845780', 'Programador', '2003-09-10', 7000, 9, '37136066', 111),
	(5, 'Patrick', 'patrickboco@gmail.com', '12345678', '34853874554', 'Gerente', '2004-10-19', 5000, 8, '37136066', 111),
	(6, 'Rafael', 'rafaelcandido@gmail.com', '12345678', '28375683756', 'Vendedor', '2004-10-19', 2000, 4, '37136066', 111),
	(8, 'Bianca', 'biancacardoso@gmail.com', '12345678', '18436534958', 'Designer', '2004-10-19', 3000, 9, '37136066', 111),
	(9, 'Juliana', 'julianacassia@gmail.com', '12345678', '38763459384', 'Co-Fundadora', '2004-10-19', 10000, 9, '37136066', 111),
	(10, 'Jhenifer', 'jheniferbruschi@gmail.com', '12345678', '13982743435', 'Designer', '2004-10-19', 3000, 12, '37136066', 111);

-- Copiando estrutura para tabela loja_eletronicos_math.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `codItemVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codProduto` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL DEFAULT 0,
  `quantVenda` int(11) NOT NULL DEFAULT 0,
  `codVenda` int(11) NOT NULL,
  PRIMARY KEY (`codItemVenda`),
  KEY `codProduto` (`codProduto`),
  KEY `codVenda` (`codVenda`),
  CONSTRAINT `FK_itemvenda_produtos` FOREIGN KEY (`codProduto`) REFERENCES `produtos` (`codProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_itemvenda_venda` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.itemvenda: ~13 rows (aproximadamente)
INSERT INTO `itemvenda` (`codItemVenda`, `codProduto`, `valor`, `quantVenda`, `codVenda`) VALUES
	(31, 1, 25, 1, 32),
	(37, 1, 25, 1, 34),
	(38, 3, 10, 1, 34),
	(39, 1, 25, 1, 35),
	(40, 3, 10, 1, 35),
	(44, 42, 75, 5, 36),
	(45, 1, 25, 1, 36),
	(46, 33, 24, 1, 36),
	(51, 3, 10, 1, 38),
	(52, 5, 10, 1, 38),
	(61, 2, 10, 1, 49),
	(62, 3, 50, 5, 49),
	(64, 2, 10, 1, 50);

-- Copiando estrutura para procedure loja_eletronicos_math.login
DROP PROCEDURE IF EXISTS `login`;
DELIMITER //
CREATE PROCEDURE `login`()
BEGIN
SELECT email, senha FROM funcionario;
END//
DELIMITER ;

-- Copiando estrutura para tabela loja_eletronicos_math.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.marca: ~6 rows (aproximadamente)
INSERT INTO `marca` (`codMarca`, `marca`) VALUES
	(2, 'Arduino'),
	(3, 'Servo'),
	(4, 'Sensor'),
	(5, 'WIFI'),
	(6, 'Motores'),
	(8, 'Módulo');

-- Copiando estrutura para tabela loja_eletronicos_math.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 0,
  `estoque` int(11) NOT NULL DEFAULT 0,
  `preco` decimal(10,0) NOT NULL,
  `preco_venda` decimal(10,0) NOT NULL DEFAULT 0,
  `codMarca` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`) USING BTREE,
  KEY `codMarca` (`codMarca`),
  CONSTRAINT `FK_produtos_marca` FOREIGN KEY (`codMarca`) REFERENCES `marca` (`codMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.produtos: ~37 rows (aproximadamente)
INSERT INTO `produtos` (`codProduto`, `nome`, `quantidade`, `estoque`, `preco`, `preco_venda`, `codMarca`) VALUES
	(1, 'Arduino Uno', 94, 100, 25, 25, 2),
	(2, 'Arduino Yún', 20, 20, 10, 25, 2),
	(3, 'Arduino Duemilanove or Diecimila', 45, 100, 10, 25, 2),
	(4, 'Arduino Nano', 90, 100, 10, 25, 2),
	(5, 'Arduino Mega or Mega 2560', 90, 100, 10, 25, 2),
	(6, 'Arduino Mega ADK', 100, 100, 10, 25, 2),
	(7, 'Arduino Leonardo ', 100, 100, 10, 25, 2),
	(8, 'Arduino Micro', 100, 100, 10, 25, 2),
	(9, 'Arduino Leonardo ETH', 100, 100, 10, 25, 2),
	(10, 'Arduino Esplora', 100, 100, 10, 25, 2),
	(11, 'Arduino Ethernet ', 50, 100, 10, 25, 2),
	(12, 'Arduino Mini', 90, 100, 10, 25, 2),
	(13, 'Arduino BT', 100, 100, 10, 25, 2),
	(14, 'Arduino Fio', 100, 100, 10, 25, 2),
	(15, 'LilyPad Arduino ', 100, 100, 10, 25, 2),
	(16, 'Arduino NG ir older', 100, 100, 10, 25, 2),
	(17, 'LilyPad Arduino USB', 100, 100, 10, 25, 2),
	(18, 'Arduino Robot Motor', 70, 50, 10, 25, 2),
	(19, 'Arduino Pro or Pro mini', 100, 100, 10, 25, 2),
	(20, 'Arduino Circuito Playground', 100, 100, 10, 25, 2),
	(21, 'Arduino Robot Control ', 80, 100, 10, 25, 2),
	(22, 'Arduino Industrial 101', 100, 100, 10, 25, 2),
	(23, 'Arduino Uno Wifi', 20, 100, 10, 25, 2),
	(24, 'Arduino gemma', 90, 100, 10, 25, 2),
	(25, 'Arduino Yún Mini ', 100, 100, 10, 25, 2),
	(26, 'Linino One', 100, 100, 10, 25, 2),
	(27, 'HC-SR04', 100, 100, 15, 25, 4),
	(28, 'TTP223B', 100, 100, 7, 25, 4),
	(29, 'HC-SR501', 100, 100, 14, 25, 4),
	(30, 'DS18B20', 100, 100, 19, 25, 4),
	(31, 'Rs232 HC-06', 100, 150, 46, 25, 8),
	(32, 'DHT11', 100, 150, 17, 25, 4),
	(33, 'Kit RFID Mfrc522 13.56 Mhz', 100, 75, 24, 25, 8),
	(34, 'SPP BT-06 2.1', 100, 150, 37, 25, 8),
	(35, 'ESP8266 ESP-01', 10, 150, 28, 25, 5),
	(41, 'Motor Dc', 100, 100, 12, 25, 6),
	(42, 'ESP8266 Nodemcu 0.9', 100, 80, 15, 70, 5);

-- Copiando estrutura para procedure loja_eletronicos_math.selecionarClientes
DROP PROCEDURE IF EXISTS `selecionarClientes`;
DELIMITER //
CREATE PROCEDURE `selecionarClientes`()
BEGIN
SELECT * FROM cliente;
END//
DELIMITER ;

-- Procedure para selecionar todos os clientes
DROP PROCEDURE IF EXISTS `selecionarClientes`;
DELIMITER //
CREATE PROCEDURE `selecionarClientes`()
BEGIN
    SELECT * FROM cliente;
END//
DELIMITER ;

-- Procedure para inserir um novo cliente
DROP PROCEDURE IF EXISTS `inserirCliente`;
DELIMITER //
CREATE PROCEDURE `inserirCliente`(
    IN p_nome VARCHAR(50),
    IN p_sobrenome VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_senha VARCHAR(50),
    IN p_cpf VARCHAR(11),
    IN p_pix VARCHAR(50),
    IN p_cep VARCHAR(300),
    IN p_num INT
)
BEGIN
    INSERT INTO cliente (nome, sobrenome, email, senha, cpf, pix, cep, num)
    VALUES (p_nome, p_sobrenome, p_email, p_senha, p_cpf, p_pix, p_cep, p_num);
END//
DELIMITER ;

-- Procedure para atualizar um cliente
DROP PROCEDURE IF EXISTS `atualizarCliente`;
DELIMITER //
CREATE PROCEDURE `atualizarCliente`(
    IN p_codCliente INT,
    IN p_nome VARCHAR(50),
    IN p_sobrenome VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_senha VARCHAR(50),
    IN p_cpf VARCHAR(11),
    IN p_pix VARCHAR(50),
    IN p_cep VARCHAR(300),
    IN p_num INT
)
BEGIN
    UPDATE cliente
    SET nome = p_nome, sobrenome = p_sobrenome, email = p_email, senha = p_senha, 
        cpf = p_cpf, pix = p_pix, cep = p_cep, num = p_num
    WHERE codCliente = p_codCliente;
END//
DELIMITER ;

-- Procedure para deletar um cliente
DROP PROCEDURE IF EXISTS `deletarCliente`;
DELIMITER //
CREATE PROCEDURE `deletarCliente`(IN p_codCliente INT)
BEGIN
    DELETE FROM cliente WHERE codCliente = p_codCliente;
END//
DELIMITER ;

-- Copiando estrutura para procedure loja_eletronicos_math.selecionarFuncionarios
-- Procedure para selecionar todos os funcionários
DROP PROCEDURE IF EXISTS `selecionarFuncionarios`;
DELIMITER //
CREATE PROCEDURE `selecionarFuncionarios`()
BEGIN
    SELECT * FROM funcionario;
END//
DELIMITER ;

-- Procedure para inserir um novo funcionário
DROP PROCEDURE IF EXISTS `inserirFuncionario`;
DELIMITER //
CREATE PROCEDURE `inserirFuncionario`(
    IN p_nome VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_senha VARCHAR(50),
    IN p_cpf VARCHAR(50),
    IN p_cargo VARCHAR(50),
    IN p_nascimento DATE,
    IN p_salario DOUBLE,
    IN p_codCidade INT,
    IN p_cep VARCHAR(50),
    IN p_num INT
)
BEGIN
    INSERT INTO funcionario (nome, email, senha, cpf, cargo, nascimento, salario, codCidade, cep, num)
    VALUES (p_nome, p_email, p_senha, p_cpf, p_cargo, p_nascimento, p_salario, p_codCidade, p_cep, p_num);
END//
DELIMITER ;

-- Procedure para atualizar um funcionário
DROP PROCEDURE IF EXISTS `atualizarFuncionario`;
DELIMITER //
CREATE PROCEDURE `atualizarFuncionario`(
    IN p_codFuncionario INT,
    IN p_nome VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_senha VARCHAR(50),
    IN p_cpf VARCHAR(50),
    IN p_cargo VARCHAR(50),
    IN p_nascimento DATE,
    IN p_salario DOUBLE,
    IN p_codCidade INT,
    IN p_cep VARCHAR(50),
    IN p_num INT
)
BEGIN
    UPDATE funcionario
    SET nome = p_nome, email = p_email, senha = p_senha, cpf = p_cpf, 
        cargo = p_cargo, nascimento = p_nascimento, salario = p_salario, 
        codCidade = p_codCidade, cep = p_cep, num = p_num
    WHERE codFuncionario = p_codFuncionario;
END//
DELIMITER ;

-- Procedure para deletar um funcionário
DROP PROCEDURE IF EXISTS `deletarFuncionario`;
DELIMITER //
CREATE PROCEDURE `deletarFuncionario`(IN p_codFuncionario INT)
BEGIN
    DELETE FROM funcionario WHERE codFuncionario = p_codFuncionario;
END//
DELIMITER ;

-- Copiando estrutura para procedure loja_eletronicos_math.selecionarProdutos
-- Procedure para selecionar todos os produtos
DROP PROCEDURE IF EXISTS `selecionarProdutos`;
DELIMITER //
CREATE PROCEDURE `selecionarProdutos`()
BEGIN
    SELECT * FROM produtos;
END//
DELIMITER ;

-- Procedure para inserir um novo produto
DROP PROCEDURE IF EXISTS `inserirProduto`;
DELIMITER //
CREATE PROCEDURE `inserirProduto`(
    IN p_nome VARCHAR(50),
    IN p_quantidade INT,
    IN p_estoque INT,
    IN p_preco DECIMAL(10,0),
    IN p_preco_venda DECIMAL(10,0),
    IN p_codMarca INT
)
BEGIN
    INSERT INTO produtos (nome, quantidade, estoque, preco, preco_venda, codMarca)
    VALUES (p_nome, p_quantidade, p_estoque, p_preco, p_preco_venda, p_codMarca);
END//
DELIMITER ;

-- Procedure para atualizar um produto
DROP PROCEDURE IF EXISTS `atualizarProduto`;
DELIMITER //
CREATE PROCEDURE `atualizarProduto`(
    IN p_codProduto INT,
    IN p_nome VARCHAR(50),
    IN p_quantidade INT,
    IN p_estoque INT,
    IN p_preco DECIMAL(10,0),
    IN p_preco_venda DECIMAL(10,0),
    IN p_codMarca INT
)
BEGIN
    UPDATE produtos
    SET nome = p_nome, quantidade = p_quantidade, estoque = p_estoque, 
        preco = p_preco, preco_venda = p_preco_venda, codMarca = p_codMarca
    WHERE codProduto = p_codProduto;
END//
DELIMITER ;

-- Procedure para deletar um produto
DROP PROCEDURE IF EXISTS `deletarProduto`;
DELIMITER //
CREATE PROCEDURE `deletarProduto`(IN p_codProduto INT)
BEGIN
    DELETE FROM produtos WHERE codProduto = p_codProduto;
END//
DELIMITER ;

-- Procedure para selecionar todas as marcas
DROP PROCEDURE IF EXISTS `selecionarMarcas`;
DELIMITER //
CREATE PROCEDURE `selecionarMarcas`()
BEGIN
    SELECT * FROM marca;
END//
DELIMITER ;

-- Procedure para inserir uma nova marca
DROP PROCEDURE IF EXISTS `inserirMarca`;
DELIMITER //
CREATE PROCEDURE `inserirMarca`(
    IN p_marca VARCHAR(50)
)
BEGIN
    INSERT INTO marca (marca)
    VALUES (p_marca);
END//
DELIMITER ;

-- Procedure para atualizar uma marca
DROP PROCEDURE IF EXISTS `atualizarMarca`;
DELIMITER //
CREATE PROCEDURE `atualizarMarca`(
    IN p_codMarca INT,
    IN p_marca VARCHAR(50)
)
BEGIN
    UPDATE marca
    SET marca = p_marca
    WHERE codMarca = p_codMarca;
END//
DELIMITER ;

-- Procedure para deletar uma marca
DROP PROCEDURE IF EXISTS `deletarMarca`;
DELIMITER //
CREATE PROCEDURE `deletarMarca`(IN p_codMarca INT)
BEGIN
    DELETE FROM marca WHERE codMarca = p_codMarca;
END//
DELIMITER ;

-- Procedure para selecionar todos os itens de venda
DROP PROCEDURE IF EXISTS `selecion arItensVenda`;
DELIMITER //
CREATE PROCEDURE `selecionarItensVenda`()
BEGIN
    SELECT * FROM itemvenda;
END//
DELIMITER ;

-- Procedure para inserir um novo item de venda
DROP PROCEDURE IF EXISTS `inserirItemVenda`;
DELIMITER //
CREATE PROCEDURE `inserirItemVenda`(
    IN p_codVenda INT,
    IN p_produto VARCHAR(50),
    IN p_quantidade INT,
    IN p_preco DECIMAL(10, 2)
)
BEGIN
    INSERT INTO itemvenda (codVenda, produto, quantidade, preco)
    VALUES (p_codVenda, p_produto, p_quantidade, p_preco);
END//
DELIMITER ;

-- Procedure para atualizar um item de venda
DROP PROCEDURE IF EXISTS `atualizarItemVenda`;
DELIMITER //
CREATE PROCEDURE `atualizarItemVenda`(
    IN p_codItem INT,
    IN p_quantidade INT,
    IN p_preco DECIMAL(10, 2)
)
BEGIN
    UPDATE itemvenda
    SET quantidade = p_quantidade, preco = p_preco
    WHERE codItem = p_codItem;
END//
DELIMITER ;

-- Procedure para deletar um item de venda
DROP PROCEDURE IF EXISTS `deletarItemVenda`;
DELIMITER //
CREATE PROCEDURE `deletarItemVenda`(IN p_codItem INT)
BEGIN
    DELETE FROM itemvenda WHERE codItem = p_codItem;
END//
DELIMITER ;

-- Copiando estrutura para tabela loja_eletronicos_math.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `codCliente` int(11) NOT NULL,
  `statusDaVenda` varchar(50) DEFAULT 'Em andamento',
  `dataVenda` datetime NOT NULL,
  PRIMARY KEY (`codVenda`),
  KEY `codCliente` (`codCliente`),
  CONSTRAINT `FK_venda_cliente` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela loja_eletronicos_math.venda: ~7 rows (aproximadamente)
INSERT INTO `venda` (`codVenda`, `codCliente`, `statusDaVenda`, `dataVenda`) VALUES
	(32, 7, 'Concluída', '2023-06-06 08:54:07'),
	(34, 7, 'Concluída', '2023-06-06 09:01:35'),
	(35, 7, 'Concluída', '2023-06-06 09:01:45'),
	(36, 7, 'Concluída', '2023-06-06 09:02:36'),
	(38, 7, 'Concluída', '2023-06-06 17:28:15'),
	(49, 8, 'Concluída', '2023-09-04 20:42:24'),
	(50, 8, 'Concluída', '2023-09-04 21:00:34');
	
-- Procedure para selecionar todas as vendas
DROP PROCEDURE IF EXISTS `selecionarVendas`;
DELIMITER //
CREATE PROCEDURE `selecionarVendas`()
BEGIN
    SELECT * FROM venda;
END//
DELIMITER ;

-- Procedure para inserir uma nova venda
DROP PROCEDURE IF EXISTS `inserirVenda`;
DELIMITER //
CREATE PROCEDURE `inserirVenda`(
    IN p_codCliente INT,
    IN p_statusDaVenda VARCHAR(50),
    IN p_dataVenda DATETIME
)
BEGIN
    INSERT INTO venda (codCliente, statusDaVenda, dataVenda)
    VALUES (p_codCliente, p_statusDaVenda, p_dataVenda);
END//
DELIMITER ;

-- Procedure para atualizar uma venda
DROP PROCEDURE IF EXISTS `atualizarVenda`;
DELIMITER //
CREATE PROCEDURE `atualizarVenda`(
    IN p_codVenda INT,
    IN p_codCliente INT,
    IN p_statusDaVenda VARCHAR(50),
    IN p_dataVenda DATETIME
)
BEGIN
    UPDATE venda
    SET codCliente = p_codCliente, statusDaVenda = p_statusDaVenda, dataVenda = p_dataVenda
    WHERE codVenda = p_codVenda;
END//
DELIMITER ;

-- Procedure para deletar uma venda
DROP PROCEDURE IF EXISTS `deletarVenda`;
DELIMITER //
CREATE PROCEDURE `deletarVenda`(IN p_codVenda INT)
BEGIN
    DELETE FROM venda WHERE codVenda = p_codVenda;
END//
DELIMITER ;


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
