-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 27-Jul-2020 às 17:43
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce_market`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastrante`
--

DROP TABLE IF EXISTS `cadastrante`;
CREATE TABLE IF NOT EXISTS `cadastrante` (
  `idCadastrante` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `DataNasc` date NOT NULL,
  `CPF_CNPJ` varchar(14) NOT NULL,
  `pj_pf` int(1) NOT NULL,
  `DDD_Telefone` varchar(2) NOT NULL,
  `Telefone` varchar(9) NOT NULL,
  `Logradouro` varchar(80) NOT NULL,
  `Bairo` varchar(40) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` varchar(2) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`idCadastrante`) USING BTREE,
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `CPF_CNPJ` (`CPF_CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cadastrante`
--

INSERT INTO `cadastrante` (`idCadastrante`, `Nome`, `Email`, `DataNasc`, `CPF_CNPJ`, `pj_pf`, `DDD_Telefone`, `Telefone`, `Logradouro`, `Bairo`, `Cidade`, `UF`, `CEP`) VALUES
(1, 'Gabriela da Silva', 'gabrielasilva@gmail.com', '1990-10-17', '78945612352', 1, '21', '966521452', 'Rua xx', 'Barra', 'Teresopolis', 'RJ', '5978252'),
(2, 'Build Cel', 'Cel@bmail.com', '2000-01-20', '25412365896325', 0, '21', '985236541', 'Rua xx', 'Bairro São Pedro', 'Teresopolis', 'RJ', '25970025'),
(3, 'Ricardo Simas', 'ricardosimas@gmail', '1980-11-02', '18456325478', 1, '21', '963258745', 'Rua xx', 'Venda Nova', 'Teresopolis', 'RJ', '25985700'),
(4, 'America Imports', 'americaimports@yahoo', '2000-05-09', '36524125632897', 0, '21', '966655887', 'Rua xx', 'Vale Paraiso', 'Teresopolis', 'RJ', '25984736');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`IdCategoria`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`IdCategoria`, `Nome`, `Descricao`) VALUES
(1, 'Eletronicos', 'Eletronicos para o seu lar e para o seu negocio'),
(2, 'Celulares', 'Todos os tipos de celulares '),
(3, 'Informatica', 'Hardwares, perifericos, artigos'),
(4, 'Roupas', 'Roupas de varias marcas');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `j_resumopedido`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `j_resumopedido`;
CREATE TABLE IF NOT EXISTS `j_resumopedido` (
`Codigo de Usuario` int(11)
,`Nome do usuario` varchar(50)
,`Tipo de operacao` varchar(20)
,`Codigo do produto` int(11)
,`Nome do produto` varchar(50)
,`Quantidade de produtos` int(11)
,`Valor do pedido` double
,`Data da entrega` date
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nf`
--

DROP TABLE IF EXISTS `nf`;
CREATE TABLE IF NOT EXISTS `nf` (
  `IdNF` int(11) NOT NULL AUTO_INCREMENT,
  `IdPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `SerieNF` varchar(10) NOT NULL,
  `NumeroNF` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DataEmissao` date NOT NULL,
  PRIMARY KEY (`IdNF`),
  KEY `IdPedido` (`IdPedido`),
  KEY `idUsuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `nf`
--

INSERT INTO `nf` (`IdNF`, `IdPedido`, `idUsuario`, `SerieNF`, `NumeroNF`, `DataEmissao`) VALUES
(1, 1, 1, '0001', '0001', '2020-07-26'),
(2, 2, 2, '0001', '0002', '2020-07-26'),
(3, 3, 3, '0001', '0003', '2020-07-26'),
(4, 4, 4, '0001', '0004', '2020-07-26'),
(5, 5, 2, '0001', '0005', '2020-07-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `operacao`
--

DROP TABLE IF EXISTS `operacao`;
CREATE TABLE IF NOT EXISTS `operacao` (
  `idOperacao` int(11) NOT NULL AUTO_INCREMENT,
  `vendaCompra` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`idOperacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `operacao`
--

INSERT INTO `operacao` (`idOperacao`, `vendaCompra`) VALUES
(1, 'Compra'),
(2, 'Venda');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idOperacao` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPedidoItem` int(11) NOT NULL,
  `valorPedido_valorVenda` double NOT NULL,
  `DataPedido` date NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdPedidoItem` (`IdPedidoItem`),
  KEY `idOperacao` (`idOperacao`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`IdPedido`, `idOperacao`, `IdUsuario`, `IdPedidoItem`, `valorPedido_valorVenda`, `DataPedido`) VALUES
(1, 1, 1, 1, 2000, '2020-07-26'),
(2, 2, 2, 2, 3000, '2020-07-26'),
(3, 1, 3, 3, 2000, '2020-07-26'),
(4, 2, 4, 4, 300, '2020-07-27'),
(5, 1, 2, 5, 4000, '2020-07-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoitem`
--

DROP TABLE IF EXISTS `pedidoitem`;
CREATE TABLE IF NOT EXISTS `pedidoitem` (
  `IdPedidoItem` int(11) NOT NULL AUTO_INCREMENT,
  `IdProduto` int(11) NOT NULL,
  `QtdProduto` int(11) NOT NULL,
  PRIMARY KEY (`IdPedidoItem`),
  KEY `IdProduto` (`IdProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pedidoitem`
--

INSERT INTO `pedidoitem` (`IdPedidoItem`, `IdProduto`, `QtdProduto`) VALUES
(1, 2, 1),
(2, 3, 3),
(3, 1, 1),
(4, 7, 2),
(5, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `IdProduto` int(11) NOT NULL AUTO_INCREMENT,
  `IdCategoria` int(11) NOT NULL,
  `QtdEstoque` int(11) NOT NULL,
  `ValorUnitario` double NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `DataFabricacao` date NOT NULL,
  PRIMARY KEY (`IdProduto`),
  UNIQUE KEY `Nome` (`Nome`),
  KEY `IdCategoria` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`IdProduto`, `IdCategoria`, `QtdEstoque`, `ValorUnitario`, `Nome`, `Descricao`, `DataFabricacao`) VALUES
(1, 1, 20, 2000, 'Home theater', 'Muita potencia', '2020-01-01'),
(2, 1, 400, 50, 'PenDrive', '64gb de espaço', '2020-06-26'),
(3, 2, 25, 1000, 'Xiomii mi', '128gb Camera xy', '2020-07-20'),
(4, 2, 60, 3000, 'Iphone 8 plus', '128gb de armazenamento', '2019-12-02'),
(5, 3, 60, 4000, 'Pc Gamer Ripper', 'Intel i7, Placa de videogtx 1050, 16gb ram ', '2020-01-01'),
(6, 3, 1000, 1000, 'Impressora Epson', 'Tanque de tinta', '2010-10-25'),
(7, 4, 200, 100, 'Camisa Nike esport', 'Exclusiva', '2020-05-25'),
(8, 4, 60, 150, 'Calca jeans', 'Todos os tamanhos', '2020-01-01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `IdCadastrante` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Senha` varchar(100) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Nome` (`Nome`),
  KEY `IdCadastrante` (`IdCadastrante`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `IdCadastrante`, `Nome`, `Senha`) VALUES
(1, 1, 'GabiSil', '6545415'),
(2, 2, 'BuildTere', '2424385'),
(3, 3, 'Ricardinho45', '38543539'),
(4, 4, 'Importsbrasil', '543363868');

-- --------------------------------------------------------

--
-- Estrutura para vista `j_resumopedido`
--
DROP TABLE IF EXISTS `j_resumopedido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `j_resumopedido`  AS  select `usuario`.`IdUsuario` AS `Codigo de Usuario`,`usuario`.`Nome` AS `Nome do usuario`,`operacao`.`vendaCompra` AS `Tipo de operacao`,`pedidoitem`.`IdProduto` AS `Codigo do produto`,`produto`.`Nome` AS `Nome do produto`,`pedidoitem`.`QtdProduto` AS `Quantidade de produtos`,`pedido`.`valorPedido_valorVenda` AS `Valor do pedido`,`pedido`.`DataPedido` AS `Data da entrega` from ((((`pedido` join `usuario`) join `produto`) join `pedidoitem`) join `operacao`) where ((`pedido`.`IdUsuario` = `usuario`.`IdUsuario`) and (`pedidoitem`.`IdProduto` = `produto`.`IdProduto`) and (`pedido`.`IdPedidoItem` = `pedidoitem`.`IdPedidoItem`) and (`pedido`.`idOperacao` = `operacao`.`idOperacao`)) order by `usuario`.`Nome` ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `nf`
--
ALTER TABLE `nf`
  ADD CONSTRAINT `nf_ibfk_1` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idOperacao`) REFERENCES `operacao` (`idOperacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`IdPedidoItem`) REFERENCES `pedidoitem` (`IdPedidoItem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedidoitem`
--
ALTER TABLE `pedidoitem`
  ADD CONSTRAINT `pedidoitem_ibfk_1` FOREIGN KEY (`IdProduto`) REFERENCES `produto` (`IdProduto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdCadastrante`) REFERENCES `cadastrante` (`idCadastrante`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
