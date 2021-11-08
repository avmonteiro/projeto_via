class Produtos < SitePrism::Page
  set_url '/produtos'

  element :menu_principal, 'section#tbay-mainmenu'
  element :navbar, '#primary-menu'
  elements :cards_produtos, 'div.products div.product-block'

  expected_elements :menu_principal, :navbar, :cards_produtos
end
