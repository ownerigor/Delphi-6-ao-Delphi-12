# Arquitetura do LegacyERP

## Visão geral

O projeto é uma aplicação VCL MDI. O formulário principal cria formulários filhos conforme os itens de menu. Um DataModule global, `DM`, mantém a conexão `TDatabase` usada por toda a aplicação.

```text
Formulários VCL
      |
TTable / TQuery / componentes DB-aware
      |
TDatabase global (DM)
      |
BDE - driver STANDARD
      |
Tabelas Paradox em .\DADOS
```

## Persistência

Na inicialização, `TDM.InicializarBanco` cria a pasta `DADOS`, configura a conexão BDE e usa `TTable.FieldDefs`, `IndexDefs` e `CreateTable` para criar:

- USUARIOS
- CLIENTES
- FORNECEDORES
- PRODUTOS
- VENDAS e VENDAS_ITENS
- COMPRAS e COMPRAS_ITENS
- CONTAS_RECEBER e CONTAS_PAGAR

As chaves são inteiras. `ProximoCodigo` executa `SELECT MAX(campo)` e soma um. A mesma rotina é chamada diretamente por formulários e classes-base.

## Interface e regras

Os cadastros concretos herdam a lógica de uma classe-base DB-aware. Cada tela concreta possui em seu próprio DFM os componentes `TTable`, `TDataSource`, `TDBEdit`, `TDBGrid`, `TDBNavigator`, painéis e botões. Ao abrir, a classe configura nomes de tabela, campos e rótulos, e a tela opera diretamente sobre as tabelas.

As telas de venda e compra compartilham uma classe-base, mas cada uma possui seus controles persistidos no próprio DFM e coleta os itens em `TStringGrid`. Ao finalizar, a própria classe de formulário valida os dados, inicia a transação, grava cabeçalho e itens, altera `PRODUTOS.ESTOQUE_ATUAL` e cria o título financeiro quando a forma de pagamento não é dinheiro.

As telas financeiras abrem diretamente as tabelas e gravam pagamento, valor pago e situação. A consulta de estoque lê produtos e calcula a indicação de reposição na interface. As listagens executam SQL diretamente em `TQuery`.

## Estado compartilhado

`DM` é uma variável global criada antes do login e usada por todas as telas. A autenticação consulta `USUARIOS` diretamente e compara a senha armazenada em texto simples. O usuário ativo é exibido pela tela principal como `ADMIN`.
