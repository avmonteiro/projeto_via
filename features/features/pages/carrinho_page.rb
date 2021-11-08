class Carrinho < SitePrism::Page
  set_url '/carrinho'

  elements :itens, '.cart_item'
  elements :produto_nome, 'tr.cart_item .product-name'
  elements :produto_preco_unitario, 'tr.cart_item .product-price'

  def retornar_nome(index = 0)
    nome = produto_nome[index].text.split(' - ').first
    nome.strip
  end

  def retornar_tamanho(index = 0)
    tamanho = produto_nome[index].text.split(' - ')[1]
    tamanho.split(',').first.strip
  end

  def retornar_cor(index = 0)
    cor = produto_nome[index].text.split(' - ')[1]
    cor.split(',')[1].strip
  end
  
end
