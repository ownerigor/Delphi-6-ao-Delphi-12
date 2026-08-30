# Guia de Migração

Objetivo:

Migrar gradualmente o LegacyERP de Delphi 6 para Delphi 12.

## Princípios

- Preservar regras de negócio.
- Preservar o comportamento das telas.
- Evitar reescrever o sistema inteiro.
- Migrar módulo por módulo.
- Analisar antes de implementar.
- Utilizar implementações existentes como referência.

## Modernizações desejadas

### Banco de dados

Legado:

BDE + Paradox

Alvo:

FireDAC.

### Interface

Continuar utilizando VCL inicialmente.

Não é objetivo trocar a tecnologia de interface durante a primeira etapa.

### Arquitetura

Reduzir gradualmente o acoplamento entre:

Form
Banco
Regra de negócio

Preferir:

View
→ Service
→ Data Access

## Processo

Para cada módulo:

1. entender implementação atual;
2. identificar regras de negócio;
3. identificar dependências;
4. definir estratégia;
5. implementar;
6. validar contra o legado.