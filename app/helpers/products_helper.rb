module ProductsHelper

  def product_glyph(product)
    if product.is_leaf
      '<span class="glyphicon-empty"></span>'
    else
      '<span class="glyphicon glyphicon-folder-close"></span>'
    end
  end

  def formatted_price (number, is_leaf = false)
    number_to_currency(number, separator: ",", delimiter: "", format: '%n') if is_leaf
  end
end
