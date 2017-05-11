-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 10-Maio-2017 às 22:38
-- Versão do servidor: 5.5.49-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `leiloes`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `LANCES`
--

CREATE TABLE IF NOT EXISTS `LANCES` (
  `LANCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LEILAO_ID` int(11) NOT NULL,
  `USUARIO_ID` int(11) NOT NULL,
  `VALOR` double NOT NULL,
  PRIMARY KEY (`LANCE_ID`),
  KEY `fk_lance_leilao` (`LEILAO_ID`),
  KEY `fk_lance_usuario` (`USUARIO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `LEILAO`
--

CREATE TABLE IF NOT EXISTS `LEILAO` (
  `LEILAO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(200) NOT NULL,
  `DATA` date NOT NULL,
  `ENCERRADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`LEILAO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `USUARIO`
--

CREATE TABLE IF NOT EXISTS `USUARIO` (
  `USUARIO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(200) NOT NULL,
  PRIMARY KEY (`USUARIO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `LANCES`
--
ALTER TABLE `LANCES`
  ADD CONSTRAINT `fk_lance_leilao` FOREIGN KEY (`LEILAO_ID`) REFERENCES `LEILAO` (`LEILAO_ID`),
  ADD CONSTRAINT `fk_lance_usuario` FOREIGN KEY (`USUARIO_ID`) REFERENCES `USUARIO` (`USUARIO_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
