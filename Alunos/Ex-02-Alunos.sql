-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/09/2023 às 06:15
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ex-02`
--
CREATE DATABASE IF NOT EXISTS `ex-02` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ex-02`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Telefone` varchar(11) DEFAULT NULL,
  `id_turmas` int(11) NOT NULL,
  `numero_matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `Nome`, `Endereco`, `Telefone`, `id_turmas`, `numero_matricula`) VALUES
(1, 'Gabriel Lucena Conegundes', 'Rua Alfredo Volpi 3413 Umuarama-PR', '44 98441099', 4, 1),
(2, 'Felipe Rodrigues Santos', 'Rua Valentin José 4365 Umuarama-PR', '44 98564385', 5, 2),
(3, 'João Antônio José', 'José Alfredo Felipino 5478 Umuarama-PR', '44 75849567', 6, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunoturmas`
--

CREATE TABLE `alunoturmas` (
  `id` int(11) NOT NULL,
  `id_alunos` int(11) NOT NULL,
  `id_turmas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunoturmas`
--

INSERT INTO `alunoturmas` (`id`, `id_alunos`, `id_turmas`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 3, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nacionalidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id`, `nome`, `nacionalidade`) VALUES
(1, 'Scott Turow', 'Brasileiro '),
(2, 'Cláudio Vieira Oliveira', 'Brasileiro '),
(3, 'Gustavo Ferreira', 'Brasileiro ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `id_alunos` int(11) NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date NOT NULL,
  `data_entrega` date NOT NULL,
  `valor_multa` float NOT NULL,
  `id_livros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `id_alunos`, `data_emprestimo`, `data_devolucao`, `data_entrega`, `valor_multa`, `id_livros`) VALUES
(1, 1, '2023-09-05', '2023-09-27', '2023-09-27', 0, 1),
(2, 2, '2023-09-11', '2023-09-27', '2023-09-29', 10, 2),
(3, 3, '2023-09-13', '2023-09-20', '2023-09-20', 0, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome_livro` varchar(100) NOT NULL,
  `quantidade_pagina` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `lingua` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `nome_livro`, `quantidade_pagina`, `materia`, `lingua`, `editora`) VALUES
(1, 'Visual Studio C. Fundamentos, Programação com Asp.net, Windows Forms e Web Services', 184, 'Sistemas para Internet ', 'Português', 'Ciência Moderna'),
(2, 'O Primeiro Ano', 224, 'Direito ', 'Português', 'Record'),
(3, 'Gatilhos Mentais: O Guia Completo com Estratégias de Negócios e Comunicações', 144, 'Administração ', 'Português', 'DVS EDITORA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livrosautores`
--

CREATE TABLE `livrosautores` (
  `id` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livrosautores`
--

INSERT INTO `livrosautores` (`id`, `id_livros`, `id_autor`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `numero_turma` varchar(100) DEFAULT NULL,
  `nome_curso` varchar(100) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino_previsto` date DEFAULT NULL,
  `sala_aulas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `numero_turma`, `nome_curso`, `data_inicio`, `data_termino_previsto`, `sala_aulas`) VALUES
(4, 'Turma-1', 'Sistemas para Internet', '2023-01-01', '2025-12-31', '1-A'),
(5, 'Turma-2', 'Direito', '2023-01-01', '2025-12-31', '2-B'),
(6, 'Turma-3', 'Administração ', '2023-01-01', '2027-12-31', '3-C');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_turmas`);

--
-- Índices de tabela `alunoturmas`
--
ALTER TABLE `alunoturmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk6` (`id_alunos`),
  ADD KEY `fk7` (`id_turmas`);

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_alunos`),
  ADD KEY `fk5` (`id_livros`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `livrosautores`
--
ALTER TABLE `livrosautores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`id_livros`),
  ADD KEY `fk4` (`id_autor`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `alunoturmas`
--
ALTER TABLE `alunoturmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `livrosautores`
--
ALTER TABLE `livrosautores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_turmas`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `alunoturmas`
--
ALTER TABLE `alunoturmas`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `fk7` FOREIGN KEY (`id_turmas`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `fk5` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`);

--
-- Restrições para tabelas `livrosautores`
--
ALTER TABLE `livrosautores`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
