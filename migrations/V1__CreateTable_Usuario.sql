-- ---------------------------------------------------------
-- 1. DDL - CRIACAO DA TABELA usuario
-- ---------------------------------------------------------
-- Usuarios com acesso a area restrita do DevPortfolio.
-- A senha nunca e gravada em texto puro: senha_hash guarda o hash PBKDF2
-- (ASP.NET Core Identity, formato V3) gerado pela API.
-- O primeiro administrador e criado pela API a partir das variaveis
-- UsuarioInicial__Nome, UsuarioInicial__Email e UsuarioInicial__Senha.
CREATE TABLE usuario (
  id                  BIGINT           NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria sequencial.',
  nome                VARCHAR(100)     NOT NULL COMMENT 'Nome de exibicao do usuario.',
  email               VARCHAR(150)     NOT NULL COMMENT 'E-mail de login, sempre em minusculas.',
  senha_hash          VARCHAR(255)     NOT NULL COMMENT 'Hash PBKDF2 da senha (nunca a senha em texto puro).',
  perfil              TINYINT UNSIGNED NOT NULL COMMENT 'Perfil de acesso: 1 = Administrador.',
  ativo               TINYINT(1)       NOT NULL DEFAULT 1 COMMENT 'Indica se o usuario pode acessar (1) ou esta bloqueado (0).',
  data_cadastro       DATETIME(6)      NOT NULL COMMENT 'Data de cadastro (UTC).',
  data_ultimo_acesso  DATETIME(6)      NULL COMMENT 'Data do ultimo login bem-sucedido (UTC).',
  CONSTRAINT pk_usuario PRIMARY KEY (id),
  CONSTRAINT ux_usuario_email UNIQUE (email)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  COMMENT = 'Usuarios com acesso a area restrita do DevPortfolio.';
