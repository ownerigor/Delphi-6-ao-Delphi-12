# Projeto

Este repositório é utilizado em uma palestra sobre modernização de sistemas
legados utilizando Inteligência Artificial.

O projeto original foi desenvolvido em Delphi 6 e representa um ERP comercial
criado utilizando tecnologias e padrões comuns da época.

# Objetivo

Modernizar gradualmente o sistema Delphi 6 para Delphi 12 utilizando Codex
como ferramenta de apoio.

# Regra principal

Nunca altere regras de negócio sem justificar claramente a alteração.

Antes de implementar qualquer mudança relevante:

1. analise o código existente;
2. identifique dependências;
3. procure implementações semelhantes no projeto;
4. explique o que será alterado;
5. somente depois implemente.

# Projeto legado

Local:

`C:\Users\igorq\OneDrive\Documentos\ChatGPT\Delphi-6-ao-Delphi-12\legado`

Tecnologias principais:

- Delphi 6
- VCL
- BDE
- Paradox
- TDatabase
- TTable
- TQuery
- TDataSource
- componentes DB-Aware

O código legado deve ser tratado como fonte do comportamento esperado.

# Projeto moderno

Destino:

`C:\Users\igorq\OneDrive\Documentos\ChatGPT\Delphi-6-ao-Delphi-12\moderno`

Tecnologia alvo:

- Delphi 12
- VCL
- FireDAC

A modernização deve preservar o comportamento funcional do sistema original.

# Arquitetura desejada

Durante a modernização, buscar gradualmente separar:

View
↓
Service
↓
Acesso a dados
↓
Banco

Sempre evitar regras de negócio diretamente nos Forms.

Sempre evitar SQL diretamente na View.

# Importante

Não tente migrar todo o sistema de uma só vez.

A migração deve ocorrer módulo por módulo.

Sempre priorize:

Entender
→ Planejar
→ Implementar
→ Validar

# Documentação

Antes de trabalhar no projeto, leia quando relevante:

`docs/PROJECT_CONTEXT.md`

`docs/MIGRATION_GUIDE.md`

Considere os documentos dentro de `docs/` como fonte de contexto do projeto.

# Compatibilidade

Código existente dentro de `Delphi-6-ao-Delphi-12\legado` deve continuar compatível com
Delphi 6 enquanto estivermos analisando o legado.

Não introduza sintaxe moderna dentro do projeto legado.

# Validação

Sempre compare o comportamento da implementação moderna com o sistema legado.

Ao finalizar uma alteração, informe:

- arquivos modificados;
- comportamento preservado;
- melhorias realizadas;
- riscos encontrados;
- pontos que precisam de validação manual.