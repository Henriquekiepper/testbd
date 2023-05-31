/* Script SQL do pset referente ao bando de dados 'lojas uvv' 
 Henrique miranda kiepper cc1md_202305425_postgresql.sql */
/* comando drop user e database se já houver algum usuario e banco de dados com mesmo nome dos que serão criados a seguir */
drop database if exists uvv;
drop user if exists henrique;
/* Criando usuário com senha e com as permissôes necessarias para criar banco de dados e ter uma senha */
CREATE USER henrique WITH createdb createrole encrypted password '123';
/* Criando o banco de dados com os devidos parâmetros */
CREATE DATABASE uvv WITH owner henrique encoding "UTF8" lc_collate 'pt_BR.UTF-8' lc_ctype 'pt_BR.UTF-8' allow_connections = TRUE;
/* comentário do bando de dados */
COMMENT ON DATABASE uvv
IS 'Banco de dados da uvv com foco de inserir dados das lojas uvv';
/* conectando ao usuário e ao banco de dados  */
\ setenv PGPASSWORD 123 \ c uvv henrique;
/* Criando um esquema dentro do banco de dados. */
CREATE SCHEMA IF NOT EXISTS lojas
AUTHORIZATION henrique;
/* Inserindo comentário do schema */
COMMENT ON SCHEMA lojas
IS 'Esquema referente as Lojas UVV';
/* definindo como caminho principal */
ALTER USER henrique
SET
  SEARCH_PATH TO lojas,
  "$user",
  public;
  /* criação das tabelas*/
  /* criação da tabela produtos com primary key e comentários */
  CREATE TABLE lojas.produtos (
    produto_id NUMERIC(38) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    preco_unitario NUMERIC(10, 2),
    detalhes BYTEA,
    imagem BYTEA,
    imagem_mime_type VARCHAR(512),
    imagem_arquivo VARCHAR(512),
    imagem_charset VARCHAR(512),
    imagem_ultima_atualizacao DATE,
    CONSTRAINT produtos_pk PRIMARY KEY (produto_id)
  );
