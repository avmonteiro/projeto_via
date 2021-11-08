Dado('que estou na página de Produtos') do
  @produtos_page = Produtos.new
  @produtos_page.load
  @produtos_page.loaded?
  expect(@produtos_page).to be_all_there
end

Quando('adiciono {int} produto(s) ao Carrinho de Compras') do |qtd_produtos|
  detalhes_produto_page = DetalhesProduto.new

  @dados_produtos = []

  x = 1
  while x <= qtd_produtos
    @produtos_page.wait_until_cards_produtos_visible
    @produtos_page.cards_produtos.sample.click
    @dados_produtos.push(detalhes_produto_page.adicionar_produto)
    @produtos_page.load if x < qtd_produtos
    x += 1
  end

  detalhes_produto_page.wait_until_btn_ver_carrinho_visible
  detalhes_produto_page.btn_ver_carrinho.click
end

Entao('visualizo no Carrinho de Compras os produto(s) adicionado(s)') do
  carrinho_page = Carrinho.new
  carrinho_page.wait_until_itens_visible

  expect(@dados_produtos.size).to eql(carrinho_page.itens.size)

  carrinho_page.itens.each_with_index do |_, index|
    expect(@dados_produtos[index].fetch(:nome)).to eql(carrinho_page.retornar_nome(index))
    expect(@dados_produtos[index].fetch(:tamanho)).to eql(carrinho_page.retornar_tamanho(index))
    expect(@dados_produtos[index].fetch(:cor)).to eql(carrinho_page.retornar_cor(index))
    expect(@dados_produtos[index].fetch(:preco_unitario)).to eql(carrinho_page.produto_preco_unitario[index].text)
  end
end
