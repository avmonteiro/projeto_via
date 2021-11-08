class DetalhesProduto < SitePrism::Page
  element :produto_nome, '.product_title'
  element :produto_preco_unitario, '#primary .price'
  elements :produto_tamanhos, '[data-attribute_name=attribute_size] [class*=button-variable-item]'
  elements :produto_cores, '[data-attribute_name=attribute_color] [class*=button-variable-item]'
  element :sem_estoque, '.out-of-stock'
  element :btn_comprar, 'button.single_add_to_cart_button'
  element :btn_ver_carrinho, '#primary a.wc-forward'

  def adicionar_produto
    produto = {
      nome: produto_nome.text.strip,
      preco_unitario: produto_preco_unitario.text.strip
    }
    3.times do
      produto[:tamanho] = selecionar_tamanho_aleatorio
      produto[:cor] = selecionar_cor_aleatoria
      next if has_sem_estoque?(wait: 2)
      wait_until_btn_comprar_visible
      btn_comprar.hover
      btn_comprar.click
      break
    end
    produto
  end

  def selecionar_tamanho_aleatorio
    wait_until_produto_tamanhos_visible
    index_tamanho = rand(produto_tamanhos.size - 1)
    produto_tamanhos[index_tamanho].click
    produto_tamanhos[index_tamanho].text.strip
  end

  def selecionar_cor_aleatoria
    wait_until_produto_cores_visible
    index_cor = rand(produto_cores.size - 1)
    produto_cores[index_cor].click
    produto_cores[index_cor].text.strip
  end
end
