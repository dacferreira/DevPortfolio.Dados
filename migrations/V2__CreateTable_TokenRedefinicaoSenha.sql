-- ---------------------------------------------------------
-- 1. DDL - CRIACAO DA TABELA token_redefinicao_senha
-- ---------------------------------------------------------
-- Links de "Esqueci minha senha". O token enviado por e-mail nunca e gravado:
-- token_hash guarda apenas o SHA-256 (hexadecimal) do token.
-- Cada token vale ate data_expiracao e pode ser usado uma unica vez (data_utilizacao).
CREATE TABLE token_redefinicao_senha (
  id                BIGINT       NOT NULL AUTO_INCREMENT COMMENT 'Chave primaria sequencial.',
  usuario_id        BIGINT       NOT NULL COMMENT 'Usuario dono do token (usuario.id).',
  token_hash        CHAR(64)     NOT NULL COMMENT 'SHA-256 do token enviado por e-mail.',
  data_expiracao    DATETIME(6)  NOT NULL COMMENT 'Data limite de uso do token (UTC).',
  data_utilizacao   DATETIME(6)  NULL COMMENT 'Data em que o token foi usado ou invalidado (UTC).',
  data_cadastro     DATETIME(6)  NOT NULL COMMENT 'Data de criacao do token (UTC).',
  CONSTRAINT pk_token_redefinicao_senha PRIMARY KEY (id),
  CONSTRAINT ux_token_redefinicao_senha_token_hash UNIQUE (token_hash),
  CONSTRAINT fk_token_redefinicao_senha_usuario FOREIGN KEY (usuario_id)
    REFERENCES usuario (id) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  COMMENT = 'Tokens de uso unico para redefinicao de senha.';
