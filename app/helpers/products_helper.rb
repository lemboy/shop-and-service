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
  
  def parents_list_id(id)
    list_id = [id]
    loop do
      next_level_id = Product.where(id: id).first.group_id
      break if next_level_id.nil?
      list_id << next_level_id
      id = next_level_id
    end
    return list_id
  end

end
