# LegacyERP

Projeto de exemplo de um pequeno ERP comercial no estilo de aplicações corporativas desenvolvidas no início dos anos 2000. O alvo é o **Borland Delphi 6**, usando exclusivamente VCL, BDE e tabelas Paradox.

## Requisitos

- Borland Delphi 6 Professional ou Enterprise
- BDE (Borland Database Engine) instalado, incluindo o driver `STANDARD`/Paradox
- permissão de escrita na pasta do executável

Não há servidor, biblioteca de terceiros ou pacote adicional.

## Como abrir e executar

1. Abra `LegacyERP.dpr` no Delphi 6.
2. Confirme que os pacotes padrão VCL e BDE estão disponíveis.
3. Compile com **Project > Build LegacyERP**.
4. Execute o programa. Ele cria automaticamente `DADOS` ao lado do executável, configura uma conexão BDE temporária chamada `LegacyERPDB`, cria as tabelas Paradox ausentes e inclui dados de demonstração.
5. Entre com usuário `ADMIN` e senha `ADMIN`.

Em instalações nas quais o BDE ainda não está configurado, execute o BDE Administrator uma vez e confira se o driver nativo `PARADOX` está habilitado. A aplicação não exige a criação manual de um alias persistente.

## Módulos

- login e usuários;
- clientes, fornecedores e produtos;
- vendas com itens, baixa de estoque e conta a receber;
- compras com itens, entrada de estoque e conta a pagar;
- baixa de contas e consulta de estoque;
- listagens de clientes, produtos e vendas por período.

Os cadastros usam componentes DB-aware persistidos no DFM de cada tela. Vendas, compras, financeiro e consultas também mantêm seus componentes visuais em seus próprios DFMs, permitindo inspecionar cada tela diretamente no Form Designer do Delphi 6. Vendas e compras mantêm itens em memória até a finalização e usam uma transação BDE para gravar movimento, estoque e financeiro. Códigos numéricos são obtidos com `MAX + 1`.

## Estrutura

- `LegacyERP.dpr`: inicialização e ciclo da aplicação.
- `uDM`: conexão BDE, criação das tabelas e carga inicial.
- `uPrincipal`, `uLogin`, `uSobre`: navegação e acesso.
- `uCadastroBase` e units de clientes, fornecedores, produtos e usuários.
- `uMovimentoBase`, `uVendas`, `uCompras`: movimentações.
- `uFinanceiroBase`, contas a receber e contas a pagar.
- `uEstoque` e `uConsultaVendas`: consultas e listagens.
- `uFuncoes`: rotinas globais clássicas.

## Observações

Os arquivos `.pas` e `.dfm` usam apenas classes e sintaxe da geração Delphi 6. A validação definitiva deve ser feita no próprio Delphi 6, pois compiladores atuais não incluem BDE/Paradox e não reproduzem fielmente o designer e o compilador daquela versão.
