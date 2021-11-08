class Home < SitePrism::Page
  set_url '/'

  element :header, 'header#tbay-header'
  element :produtos_destaque, 'div.widget-categoriestabs'
  elements :cards_produtos_destaque, 'div.product-block'

  expected_elements :header, :div_produtos_destaque
end
