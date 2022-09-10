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
            puts "Hello"
            return true
        else
            return false
        end
    end
end
