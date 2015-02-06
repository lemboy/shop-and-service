module ProductsHelper

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
