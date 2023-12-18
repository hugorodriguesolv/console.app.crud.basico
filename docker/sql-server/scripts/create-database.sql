USE master

GO

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Dojo')
BEGIN
	CREATE DATABASE Dojo
END

GO

USE Dojo

GO

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Estado')
BEGIN

	CREATE TABLE Estado
	(
		Id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY NOT NULL,
		Nome VARCHAR(100) NOT NULL,
		DataCriacao DATETIME DEFAULT GETDATE() NOT NULL
	)


	CREATE TABLE Cidade
	(
		Id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY NOT NULL,
		Nome VARCHAR(100) NOT NULL,
		IdEstado UNIQUEIDENTIFIER NOT NULL,
		DataCriacao DATETIME DEFAULT GETDATE() NOT NULL
		FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
	)


	CREATE TABLE Ambiente
	(
		Id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY NOT NULL,
		Nome VARCHAR(100) NOT NULL,
		IdCidade UNIQUEIDENTIFIER NOT NULL,
		DataCriacao DATETIME DEFAULT GETDATE() NOT NULL
		FOREIGN KEY (IdCidade) REFERENCES Cidade(Id)
	)


	CREATE TABLE Funcionario
	(
		Id UNIQUEIDENTIFIER DEFAULT NEWID() PRIMARY KEY NOT NULL,
		Nome VARCHAR(100) NOT NULL,
		Endereco VARCHAR(100) NOT NULL,
		IdAmbiente UNIQUEIDENTIFIER NOT NULL,
		DataCriacao DATETIME DEFAULT GETDATE() NOT NULL
		FOREIGN KEY (IdAmbiente) REFERENCES Ambiente(Id)
	)



	USE Dojo

	DELETE FROM Funcionario
	DELETE FROM Ambiente
	DELETE FROM Cidade
	DELETE FROM Estado


	DECLARE @IdCidade AS UNIQUEIDENTIFIER
	DECLARE @IdEstado AS UNIQUEIDENTIFIER
	DECLARE @IdAmbiente AS UNIQUEIDENTIFIER

	/*******************************
	-- Adiciona o estado
	*******************************/

	INSERT INTO Estado (Nome) VALUES ('Ceará')
	INSERT INTO Estado (Nome) VALUES ('Piauí')
	INSERT INTO Estado (Nome) VALUES ('São Paulo')


	/*******************************
	-- Adiciona a cidade
	*******************************/
	SET @IdEstado = (SELECT TOP 1 Id FROM Estado WHERE Nome = 'Ceará')
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Fortaleza', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Sobral', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Pedra Branca', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Juazeiro do Norte', @IdEstado)

	SET @IdEstado = (SELECT TOP 1 Id FROM Estado WHERE Nome = 'Piauí')
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Teresina', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Parnaíba', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Campo Maior', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Bom Jesus', @IdEstado)

	SET @IdEstado = (SELECT TOP 1 Id FROM Estado WHERE Nome = 'São Paulo')
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('São Paulo', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Campinas', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Piracicaba', @IdEstado)
	INSERT INTO Cidade (Nome, IdEstado) VALUES ('Jundiaí', @IdEstado)


	/*******************************
	-- Adiciona os ambientes
	*******************************/
	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Fortaleza')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Ambiente de Sistemas de Informação', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Ambiente de Arquitetura e Inovação de TI', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Ambiente de Governança de TI', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Ambiente de Operação de TI', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Sobral')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Sobral Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Sobral Gelado', @IdCidade)


	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Pedra Branca')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Pedra Branca Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Pedra Branca Gelado', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Juazeiro do Norte')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Juazeiro do Norte Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Juazeiro do Norte Gelado', @IdCidade)




	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Teresina')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Teresina Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Teresina Gelado', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Parnaíba')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Parnaíba Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Parnaíba Gelado', @IdCidade)


	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Campo Maior')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Campo Maior Branca Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Campo Maior Branca Gelado', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Bom Jesus')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Bom Jesus Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Bom Jesus Gelado', @IdCidade)




	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'São Paulo')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência São Paulo Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência São Paulo Sem Poluição', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Campinas')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Campinas Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Campinas Engenharia', @IdCidade)


	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Piracicaba')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Piracicaba Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Piracicaba', @IdCidade)

	SET @IdCidade = (SELECT TOP 1 Id FROM Cidade WHERE Nome = 'Jundiaí')
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Jundiaí Centro', @IdCidade)
	INSERT INTO Ambiente (Nome, IdCidade) VALUES ('Agência Jundiaí', @IdCidade)



	/*******************************
		Adiciona os funcionários
	*******************************/

	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Ambiente de Sistemas de Informação')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Hugo', 'Rua Silicon Valey', @IdAmbiente)
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Sérgio', 'Rua Bem Pertim do Banco', @IdAmbiente)
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Leandro', 'Rua Lá Longe', @IdAmbiente)
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Kaike', 'Rua Noveleiro', @IdAmbiente)
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Jhonatan', 'Rua Silêncio', @IdAmbiente)


	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Agência Sobral Centro')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Caba Enjoado', 'Rua Do Melhor Ensino', @IdAmbiente)


	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Agência Teresina Centro')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Serjão Plágio', 'Rua Bem Friinha', @IdAmbiente)


	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Agência São Paulo Centro')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Leandro Paulista', 'Av Gigante', @IdAmbiente)


	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Agência Parnaíba Centro')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('José da Pesca', 'Rua Praiana', @IdAmbiente)


	SET @IdAmbiente = (SELECT TOP 1 Id FROM Ambiente WHERE Nome = 'Agência Bom Jesus Centro')
	INSERT INTO Funcionario (Nome, Endereco, IdAmbiente) VALUES ('Carlos da Silva', 'Rua Mavilhas', @IdAmbiente)


	/*
		SELECT * FROM Funcionario
		SELECT * FROM Ambiente
		SELECT * FROM Cidade
		SELECT * FROM Estado
	*/

END