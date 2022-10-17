module ProductsHelper
    $current_product_id

    def getId(product)
      $current_product_id = product.id
    end

    def current_product
      @current_product = Product.find($current_product_id);
    end

    def current_product?(product)
      product && product.shop = current_shop
    end

    def order_itemm
      order_items = "	SELECT * 
        FROM Order_Items"
      # order_informations = order_items.group(:shop_id)
      return order_items
    end

    def check(product, quantity, size)
      product.product_sizes.each do |product_size|
        if (product_size.size.name == size)
          if (product_size.number < quantity.to_i)
            return false;
          elsif (quantity.to_i <= 0)
            return false;
          end
        end
      end
      return true;
    end

    def count_product(shop)
      @products = shop.products
      count = 0
      @products.each do |product|
        if !product.destroy_product
          count += 1
        end
      end
      return count
    end

    def updatePrice()
      @cart_sessions = CartSession.all
      @cart_sessions.each do |cart_session|
        total = 0
        @cart_items = CartItem.all 
        @cart_items.each do |cart_item|
          if cart_item.cart_session_id == cart_session.id 
            total += cart_item.product.current_price * cart_item.quantity
          end 
        end
        cart_session.update_attribute(:sum_money, total)
        if cart_session.discount > 0
          total -= total * cart_session.discount / 100
        end
        cart_session.update_attribute(:total_final, total)
      end
    end

    def checkProductExist(cart_session, product)
      cart_session.cart_items.each do |cart_item|
        if cart_item.product == product 
          return cart_item 
        end
      end
      return nil
    end
end
