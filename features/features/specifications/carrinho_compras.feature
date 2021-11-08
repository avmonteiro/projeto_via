#language: pt
@carrinho_compras
Funcionalidade: Carrinho de Compras
  Eu como cliente
  Quero adicionar produtos ao carrinho de compras
  Para que possa visualizar um resumo da compra antes do pagamento

  @regressivo
  @adicionar_produtos
  Cenário: Visualizar produtos no carrinho de compras
    Dado que estou na página de Produtos
    Quando adiciono 2 produtos ao Carrinho de Compras
    Então visualizo no Carrinho de Compras os produtos adicionados
