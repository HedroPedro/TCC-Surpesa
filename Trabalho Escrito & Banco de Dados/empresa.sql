-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2022 às 22:10
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa`
--
CREATE DATABASE IF NOT EXISTS `empresa` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `empresa`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_agendamento`
--

CREATE TABLE `tb_agendamento` (
  `COD` int(11) NOT NULL,
  `DATAHORA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `NOME_CLIENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `TIPO_CONSULTA` int(11) NOT NULL,
  `PRECO` float(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_agendamento`
--

INSERT INTO `tb_agendamento` (`COD`, `DATAHORA`, `NOME_CLIENTE`, `COD_CLIENTE`, `TIPO_CONSULTA`, `PRECO`) VALUES
(1, '2022-08-30 15:00:00', 'Carlos', 2, 0, 50.00),
(2, '2022-09-30 15:00:00', 'Carlos', 2, 0, 50.00),
(4, '2022-12-20 23:00:00', 'Pedro', 3, 0, 90.00),
(5, '2022-12-31 12:00:00', 'Carlos', 2, 0, 12.00),
(6, '2022-12-31 15:00:00', 'Yuri da Silva', 4, 0, 12.00),
(7, '2023-05-12 13:00:00', 'Pedro', 3, 1, 150.00),
(8, '2023-05-13 13:00:00', 'Antônio Aladin', 1, 3, 75.00),
(9, '2023-05-14 13:00:00', 'Yuri da Silva', 4, 1, 75.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `COD_CLIENTE` int(11) NOT NULL,
  `NOME_CLIENTE` varchar(50) COLLATE utf8_bin NOT NULL,
  `END_CLIENTE` varchar(70) COLLATE utf8_bin NOT NULL,
  `TEL_CLIENTE` varchar(17) COLLATE utf8_bin NOT NULL,
  `CPF_CLIENTE` char(14) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`COD_CLIENTE`, `NOME_CLIENTE`, `END_CLIENTE`, `TEL_CLIENTE`, `CPF_CLIENTE`) VALUES
(1, 'Antônio Aladin', 'Rua Dom Carlos, n°80', '(12) 33443-1199', '426.894.837-69'),
(2, 'Carlos', 'Rua Almeida', '(14) 99788-5401', '355.725.290-60'),
(3, 'Pedro', 'Rua 4, n° 66', '(14) 55789-8774', '389.748.611-35'),
(4, 'Yuri da Silva', 'Rua André de Lima, n°84', '(14) 78784-4740', '425.975.760-19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tiposdeconsulta`
--

CREATE TABLE `tb_tiposdeconsulta` (
  `COD` int(11) NOT NULL,
  `NOMECONSULTA` varchar(100) COLLATE utf8_bin NOT NULL,
  `PRECO` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_tiposdeconsulta`
--

INSERT INTO `tb_tiposdeconsulta` (`COD`, `NOMECONSULTA`, `PRECO`) VALUES
(0, 'Genérica', '10.00'),
(1, 'Plano único', '75.00'),
(3, 'Plano Família', '100.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `COD_USUARIO` int(11) NOT NULL,
  `NIVELDEACESSO` int(11) NOT NULL DEFAULT 0,
  `NOME` varchar(50) COLLATE utf8_bin NOT NULL,
  `SENHA` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`COD_USUARIO`, `NIVELDEACESSO`, `NOME`, `SENHA`) VALUES
(1, 1, 'Carlos', 'AaaAa'),
(2, 0, 'Pedro', 'JalILjzU'),
(3, 1, 'Cavalo', 'kx5EXV'),
(4, 1, 'Antônio Baptista', 'kXZx5EXV');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_agendamento`
--
ALTER TABLE `tb_agendamento`
  ADD PRIMARY KEY (`COD`),
  ADD KEY `COD_CLIENTE` (`COD_CLIENTE`),
  ADD KEY `TIPO_CONSULTA` (`TIPO_CONSULTA`);

--
-- Índices para tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`COD_CLIENTE`);

--
-- Índices para tabela `tb_tiposdeconsulta`
--
ALTER TABLE `tb_tiposdeconsulta`
  ADD PRIMARY KEY (`COD`);

--
-- Índices para tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`COD_USUARIO`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_agendamento`
--
ALTER TABLE `tb_agendamento`
  MODIFY `COD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `COD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_tiposdeconsulta`
--
ALTER TABLE `tb_tiposdeconsulta`
  MODIFY `COD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `COD_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_agendamento`
--
ALTER TABLE `tb_agendamento`
  ADD CONSTRAINT `tb_agendamento_ibfk_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tb_cliente` (`COD_CLIENTE`),
  ADD CONSTRAINT `tb_agendamento_ibfk_2` FOREIGN KEY (`TIPO_CONSULTA`) REFERENCES `tb_tiposdeconsulta` (`COD`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
