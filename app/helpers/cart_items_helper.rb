module CartItemsHelper
    def current_cart_item(cart_sessionId)
        if (current_cart_session && cart_sessionId == current_cart_session.id)
            puts "Hello"
            return true
        else
            return false
        end
    end
end
