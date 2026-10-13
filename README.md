# DevPortfolio.Dados

Migrations do banco de dados do DevPortfolio, versionadas com [Flyway](https://flywaydb.org/).

Banco: **MySQL 8**, banco `devportfolio` (criado pelo Flyway na primeira migração).

## Estrutura

```
flyway.conf      configuração (sem credenciais)
migrations/      scripts SQL (V<versão>__<descricao>.sql)
```

## Uso

```bash
set FLYWAY_USER=...
set FLYWAY_PASSWORD=...
flyway -configFiles=flyway.conf info
flyway -configFiles=flyway.conf migrate
```
