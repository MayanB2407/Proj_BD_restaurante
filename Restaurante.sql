CREATE SCHEMA restaurante;
USE restaurante;

CREATE TABLE funcao (
	idFuncao int NOT NULL auto_increment primary key,
    nomeFuncao varchar(45) NOT NULL,
    descricao varchar(200)
);
CREATE INDEX idx_idFuncao_id ON funcao(idFuncao);

CREATE TABLE funcionario (
	idFuncionario int NOT NULL auto_increment primary key,
    nomeFuncionario varchar(45) NOT NULL,
    cpfFuncionario varchar(45) NOT NULL,
    idFuncao int NOT NULL,
    idTelefone varchar(45) NOT NULL,
    constraint fk_idFuncao foreign key(idFuncao)
    references funcao(idFuncao)
);

CREATE INDEX idx_idFuncionario_id ON funcionario(idFuncionario);

CREATE TABLE endereco (
	idEndereco int NOT NULL auto_increment primary key,
	pais varchar(45) NOT NULL,
	estado varchar(45) NOT NULL,
	cidade varchar(45) NOT NULL,
	bairro varchar(45) NOT NULL,
	rua varchar(45) NOT NULL,
	complemento varchar(45),
	idFuncionario int NOT NULL,
    idFuncao int NOT NULL,
    constraint fk_idFuncao_funcionario foreign key(idFuncao)
    references funcao(idFuncao),
	constraint fk_idFuncionario_endereco foreign key(idFuncionario)
	references funcionario(idFuncionario)
  );
  
create index idx_idEndereco_id ON endereco(idEndereco);

CREATE TABLE mesa (
	idMesa int NOT NULL auto_increment primary key,
    idFuncionario int NOT NULL,
    ocupacao tinyint NOT NULL,
    constraint fk_idFuncionario_mesa foreign key(idfuncionario)
    references funcionario(idFuncionario)
);
create index idx_idMesa_id ON mesa(idMesa);

CREATE TABLE conta (
	idConta int NOT NULL auto_increment primary key,
    valorTotal double NOT NULL,
    dataPagamento date NOT NULL,
    ocupacao tinyint NOT NULL,
    idMesa int NOT NULL,
    constraint fk_idMesa_Conta foreign key(idMesa)
    references mesa(idMesa)
);

create index idx_idConta_id ON conta(idConta);

CREATE TABLE pedido (
	idPedido int NOT NULL auto_increment primary key,
    quantidade int NOT NULL,
    valorPedido double NOT NULL,
    observacao varchar(45),
    idMesa int NOT NULL,
    idConta int NOT NULL,
    constraint fk_idMesa_pedido foreign key(idMesa)
    references mesa(idMesa),
    constraint fk_idConta_pedido foreign key(idConta)
    references conta(idConta)
);

create index idx_idPedido_id ON pedido(idPedido);

CREATE TABLE prato (
	idPrato int NOT NULL auto_increment primary key,
    nomePrato varchar(45) NOT NULL,
    valorPrato double NOT NULL,
    ingredientes varchar(200) NOT NULL,
    idPedido int NOT NULL,
    idMesa int NOT NULL,
    constraint fk_idPedido_prato foreign key pedido(idPedido)
    references pedido(idPedido),
    constraint fk_idMesa_prato foreign key mesa(idMesa)
    references mesa(idMesa)
);

create index idx_idPrato_id ON prato(idPrato);

CREATE TABLE cliente (
 idCliente int NOT NULL auto_increment primary key,
 cpfCliente varchar(45),
 idMesa int NOT NULL,
 constraint fk_idMesa_cliente foreign key mesa(idMesa)
 references mesa(idMesa)
);

create index idx_idCliente_id ON cliente(idCliente);

CREATE TABLE pedido_cliente(
	idPedido int NOT NULL,
    idCliente int NOT NULL,
    idMesa int NOT NULL,
    constraint fk_idPedido_pc foreign key pedido(idPedido)
    references pedido(idPedido),
    constraint fk_idCliente_pc foreign key Cliente(idCliente)
    references cliente(idCliente),
    constraint fk_idMesa_pc foreign key mesa(idMesa)
    references mesa(idMesa),
    primary key(idPedido, idCliente, idMesa)
    );
 
  
  select * from funcionario;
INSERT INTO `cliente` (`idCliente`,`cpfCliente`,`idMesa`)
VALUES
  (1,"4724387332",9),
  (2,"7781340344",9),
  (3,"7817822511",1),
  (4,"8862912621",5),
  (5,"5268457327",1);

INSERT INTO `funcao` (`idFuncao`,`nomeFuncao`,`descricao`)
VALUES
  (1,"Blevins","sodales at,"),
  (2,"Griffith","lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,"),
  (3,"Summers","lorem eu metus. In lorem. Donec"),
  (4,"Marshall","imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem"),
  (5,"Banks","est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,");
  
INSERT INTO `funcionario` (`idFuncionario`,`nomeFuncionario`,`cpfFuncionario`,`nascimentoFuncionario`,`salario`,`idFuncao`)
VALUES
  (1,"Elijah H. Nguyen","78744913108","09/11/1990",2134,3),
  (2,"Ingrid P. Bennett","16157114153","08/07/1991",1309,3),
  (3,"Jin A. Hull","54430124982","04/21/2001",1410,4),
  (4,"Slade H. Bartlett","91701658662","05/20/1999",1384,3),
  (5,"Lucian J. Berger","13861154964","08/29/1991",2492,2),
  (6,"Anne J. Clark","47822362306","07/03/1998",2027,2),
  (7,"Fulton S. Cannon","55582766123","10/13/1997",1785,5),
  (8,"Vera V. Pearson","86342385830","11/11/1988",1974,5),
  (9,"Kuame D. Weaver","34299786968","03/25/2000",1700,1),
  (10,"Kevin V. Vega","37557511522","11/25/1985",1667,2);
UPDATE `funcionario` SET `idFuncionario` = 1, `nomeFuncionario` = "Elijah H. Nguyen", `cpfFuncionario` = "78744913108", `nascimentoFuncionario` = "1991-04-06", `salario` = 2134, `idFuncao` = 3 WHERE `idFuncionario` = 1;
UPDATE `funcionario` SET `idFuncionario` = 2, `nomeFuncionario` = "Ingrid P. Bennett", `cpfFuncionario` = "16157114153", `nascimentoFuncionario` = "1987-11-05", `salario` = 1309, `idFuncao` = 3 WHERE `idFuncionario` = 2;
UPDATE `funcionario` SET `idFuncionario` = 3, `nomeFuncionario` = "Jin A. Hull", `cpfFuncionario` = "54430124982", `nascimentoFuncionario` = "1987-12-19", `salario` = 1410, `idFuncao` = 4 WHERE `idFuncionario` = 3;
UPDATE `funcionario` SET `idFuncionario` = 4, `nomeFuncionario` = "Slade H. Bartlett", `cpfFuncionario` = "91701658662", `nascimentoFuncionario` = "1991-11-04", `salario` = 1384, `idFuncao` = 3 WHERE `idFuncionario` = 4;
UPDATE `funcionario` SET `idFuncionario` = 5, `nomeFuncionario` = "Lucian J. Berger", `cpfFuncionario` = "13861154964", `nascimentoFuncionario` = "1995-08-05", `salario` = 2492, `idFuncao` = 2 WHERE `idFuncionario` = 5;
UPDATE `funcionario` SET `idFuncionario` = 6, `nomeFuncionario` = "Anne J. Clark", `cpfFuncionario` = "47822362306", `nascimentoFuncionario` = "2001-10-06", `salario` = 2027, `idFuncao` = 2 WHERE `idFuncionario` = 6;
UPDATE `funcionario` SET `idFuncionario` = 7, `nomeFuncionario` = "Fulton S. Cannon", `cpfFuncionario` = "55582766123", `nascimentoFuncionario` = "1995-09-01", `salario` = 1785, `idFuncao` = 5 WHERE `idFuncionario` = 7;
UPDATE `funcionario` SET `idFuncionario` = 8, `nomeFuncionario` = "Vera V. Pearson", `cpfFuncionario` = "86342385830", `nascimentoFuncionario` = "1986-12-05", `salario` = 1974, `idFuncao` = 5 WHERE `idFuncionario` = 8;
UPDATE `funcionario` SET `idFuncionario` = 9, `nomeFuncionario` = "Kuame D. Weaver", `cpfFuncionario` = "34299786968", `nascimentoFuncionario` = "1997-04-13", `salario` = 1700, `idFuncao` = 1 WHERE `idFuncionario` = 9;
UPDATE `funcionario` SET `idFuncionario` = 10, `nomeFuncionario` = "Kevin V. Vega", `cpfFuncionario` = "37557511522", `nascimentoFuncionario` = "1987-11-14", `salario` = 1667, `idFuncao` = 2 WHERE `idFuncionario` = 10;

INSERT INTO `endereco` (`idEndereco`,`pais`,`estado`,`cidade`,`bairro`,`rua`,`numero`,`complemento`,`idFuncionario`,`idFuncao`)
VALUES
  (1,"Netherlands","Mpumalanga","Vaz",2134,"465-2647 Odio St.",2,"Cras pellentesque.",1,3),
  (2,"Indonesia","New Brunswick","Candido",1309,"690-881 Donec Av.",155,"augue, eu tempor",2,3),
  (3,"Costa Rica","Cartago","Paulino",1410,"791-9959 Arcu. Avenue",107,"gravida sit amet, dapibus",3,4),
  (4,"Canada","KwaZulu-Natal","Bueno",1384,"Ap #596-658 Nibh Avenue",68,"eget",4,3),
  (5,"Vietnam","Tamaulipas","Bispo",2492,"773-1383 Luctus. Rd.",108,"at pretium aliquet,",5,2),
  (6,"China","Đắk Nông","de Azevedo",2027,"P.O. Box 790, 9232 Suspendisse Avenue",105,"Integer",6,2),
  (7,"Germany","West Bengal","Monteiro",1785,"266-2515 Arcu. Street",66,"a, scelerisque sed, sapien. Nunc",7,5),
  (8,"Russian Federation","West Kalimantan","Cavalcante",1974,"P.O. Box 796, 2843 Blandit Ave",30,"ridiculus mus. Donec dignissim",8,5),
  (9,"Germany","Małopolskie","de Sousa",1700,"3089 Morbi Rd.",215,"purus",9,1),
  (10,"Norway","Xīběi","Mariano",1667,"Ap #283-4024 Nulla. Street",152,"id sapien. Cras dolor dolor,",10,2);
  
INSERT INTO `prato` (`idPrato`,`nomePrato`,`valorPrato` ,`igredientes`)
VALUES
  (1,"Moses Hopper","R$22,46","Curae Phasellus ornare. Fusce mollis. Duis"),
  (2,"Nomlanga Underwood","R$3,78","amet lorem semper auctor."),
  (3,"Hermione Allen","R$66,04","quam. Curabitur"),
  (4,"Demetria Leon","R$73,88","metus vitae velit egestas lacinia. Sed congue,"),
  (5,"Aspen Pittman","R$2,37","leo. Cras vehicula aliquet libero."),
  (6,"Lionel Browning","R$0,30","ultrices posuere cubilia Curae"),
  (7,"Priscilla Dorsey","R$36,19","sem elit, pharetra ut, pharetra sed, hendrerit a,"),
  (8,"Petra Conway","R$75,88","sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet"),
  (9,"Serina Hernandez","R$40,02","massa non ante bibendum ullamcorper. Duis"),
  (10,"Drew Figueroa","R$35,18","Nunc ac sem ut dolor dapibus gravida."),
  (11,"Cadman Frederick","R$74,56","turpis nec mauris blandit mattis. Cras"),
  (12,"Clark Garrison","R$72,13","vulputate, nisi sem semper erat, in consectetuer ipsum"),
  (13,"Quin Hodges","R$26,12","augue porttitor interdum. Sed auctor");
INSERT INTO prato (idPrato,nomePrato,valorPrato ,igredientes,idPedido,idMesa)
VALUES
  (11,"Cadman Frederick","R$74,56","turpis nec mauris blandit mattis. Cras",21,15),
  (12,"Clark Garrison","R$72,13","vulputate, nisi sem semper erat, in consectetuer ipsum",23,16),
  (13,"Quin Hodges","R$26,12","augue porttitor interdum. Sed auctor",25,17);
  
INSERT INTO `conta` (`idConta`,`valorTotal`,`dataPagamento`)
VALUES
  (1,"R$513,54","22/10/2022"),
  (2,"R$225,22","09/11/2021"),
  (3,"R$436,97","18/07/2022"),
  (4,"R$83,33","03/06/2023"),
  (5,"R$229,59","11/12/2022"),
  (6,"R$314,80","25/11/2022"),
  (7,"R$620,40","15/10/2022"),
  (8,"R$878,16","11/06/2022"),
  (9,"R$564,20","21/11/2021"),
  (10,"R$377,05","11/11/2021");
INSERT INTO `mesa` (`idMesa`,`idFuncionario`,`ocupacao`)
VALUES
  (1,1,"1"),
  (2,2,"0"),
  (3,9,"0"),
  (4,7,"0"),
  (5,8,"1");

SELECT * FROM funcionario;

#Consulta com JOIN:
SELECT f.idFuncionario, f.nomeFuncionario, e.pais, fc.nomeFuncao FROM
funcao fc
INNER JOIN funcionario f
ON fc.idFuncao = f.idFuncao
INNER JOIN endereco e
ON f.idFuncionario = e.idFuncionario
ORDER BY f.idFuncionario;

#Subquery tabela:
SELECT fc.idFuncao, fc.nomeFuncao, (SELECT COUNT(f.idFuncao)
FROM funcionario f WHERE f.idFuncao = fc.idFuncao) AS Quantidade_Funcionarios FROM funcao fc;

#Subquery filtro:
SELECT f.idFuncionario, f.nomeFuncionario
FROM funcionario f WHERE f.idFuncao IN (SELECT fc.idfuncao FROM funcao fc WHERE fc.idFuncao = 3);

#Subquery fonte de dados:
SELECT hs.idFuncionario, hs.nomeFuncionario, hs.idfuncao
FROM (SELECT * FROM funcionario f WHERE f.salario > 2000) hs WHERE hs.idFuncao > 2;

#Início da procedure sem parâmetros {
DELIMITER $$

CREATE PROCEDURE cardapio ()
BEGIN
SELECT idPrato, nomePrato, valorPrato, igredientes
FROM prato;
END $$

DELIMITER ;
#Fim da Procedure }

#Início da procedure com parâmetros {
DELIMITER $$
CREATE PROCEDURE buscarFuncionarioAlto(IN id INT)
BEGIN
SELECT * FROM
(SELECT f.idFuncionario, f.nomeFuncionario, f.idFuncao, f.salario FROM funcionario f WHERE salario > 2000) hs
WHERE hs.idFuncionario = id;
END $$

DELIMITER ;
#Fim da Procedure }

#Drop de procedures
DROP PROCEDURE cardapio;
DROP PROCEDURE buscarFuncionarioAlto;

#Chamados das Procedures:
CALL cardapio;

CALL buscarFuncionarioAlto(1);
