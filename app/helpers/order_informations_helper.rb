module OrderInformationsHelper
  def checkShop(order_information, current_shop) 
    order_information.order.order_items.each do |order_item|
      if order_item.product.shop == current_shop
        return true 
      end
    end
    return false
  end

  def current_order_information?(order_information)
    order_information && order_information.order.user == current_user
  end
end
