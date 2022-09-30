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
end
