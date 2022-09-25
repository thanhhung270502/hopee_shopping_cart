module CartItemsHelper
    $current_cart_item_id
    def setCartItemId(id)
      $current_cart_item_id = id
    end

    def getCartItemId
      return $current_cart_item_id
    end
    
    def current_cart_item(cart_sessionId)
      if (current_cart_session && cart_sessionId == current_cart_session.id)
        return true
      else
        return false
      end
    end

    def count
      cart_items = CartItem.all
      num = 0
      cart_items.each do |cart_item|
        if current_cart_item(cart_item.cart_session_id)
          num += 1
        end
      end
      return num
    end
end
