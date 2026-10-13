-- ---------------------------------------------------------
-- 1. DDL - PERFIL VISITANTE NA TABELA usuario
-- ---------------------------------------------------------
-- O cadastro publico cria contas com perfil 2 (Visitante); somente o
-- administrador inicial tem perfil 1. Apenas a descricao da coluna muda.
ALTER TABLE usuario
  MODIFY perfil TINYINT UNSIGNED NOT NULL COMMENT 'Perfil de acesso: 1 = Administrador, 2 = Visitante.';
