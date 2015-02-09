module ApplicationHelper
  
  def full_title(page_title)
    base_title = "S&S"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def parents_list_id(obj, id)
    list_id = [id]
    loop do
      next_level_id = obj.where(id: id).first.group_id
      break if next_level_id.nil?
      list_id << next_level_id
      id = next_level_id
    end
    return list_id
  end

end
