# Contexto do Projeto

O LegacyERP é um ERP comercial demonstrativo criado originalmente em Delphi 6.

O sistema possui os módulos:

- Clientes
- Fornecedores
- Produtos
- Vendas
- Compras
- Estoque
- Contas a Receber
- Contas a Pagar
- Usuários

## Tecnologias

- Delphi 6
- VCL
- BDE
- Paradox

## Características arquiteturais

O projeto representa uma aplicação corporativa típica desenvolvida no início
dos anos 2000.

Possui características como:

- DataModule global;
- componentes DB-Aware;
- SQL dentro dos Forms;
- regras de negócio dentro dos eventos;
- acesso direto aos datasets;
- forte acoplamento entre interface e banco;
- geração de identificadores utilizando MAX + 1.

Essas características fazem parte do sistema legado e devem inicialmente ser
compreendidas antes de serem alteradas.