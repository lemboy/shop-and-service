module ApplicationFrontHelper
  
# def product_glyph(product)
#   if product.is_leaf
#     '<span class="glyphicon-empty"></span>'
#   else
#     '<span class="glyphicon glyphicon-folder-close"></span>'
#   end
# end

  def formatted_money (number, is_leaf = false)
    number_to_currency(number, separator: ",", delimiter: "", format: '%n') if is_leaf
  end

  def header_column(column, params = nil)
    retval = ''
    case column
      when :none
        retval = "<th width='37px'></th>"
      when :product_glyph
        retval = "<th width='37px'><span class='badge' id='product_count'>#{cart_count?}</span></th>"
      when :name
        retval = '<th class="text-left">Name</th>'
      when :purchase_price
        retval = '<th class="text-right" width="10%" >Purchase</th>'
      when :cash_price
        retval = '<th class="text-right" width="10%" >Cash</th>'
      when :noncash_price
        retval = '<th class="text-right" width="10%" >Non-cash</th>'
      when :count
        retval = '<th class="text-center">Count</th>'
      when :buttons
        retval = "<th class='text-right' width='15%'>
                    #{link_to "<span class='glyphicon glyphicon-plus'></span>".html_safe, 
                        url_for(controller: params[0], action: 'new', only_path: true, 
                        :is_leaf => 'true', :grp_id => params[1]),
                        class: 'btn btn-sm btn-primary', title: 'Add item' }
                    #{ link_to "<span class='glyphicon glyphicon-folder-open'></span>".html_safe, 
                        url_for(controller: params[0], action: 'new', only_path: true, 
                        :is_leaf => 'false', :grp_id => params[1]),
                        class: 'btn btn-sm btn-primary', title: 'Add group' }
                    </th>"
    end
    return retval.html_safe
  end
  
end