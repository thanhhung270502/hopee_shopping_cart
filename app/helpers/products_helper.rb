module ProductsHelper
    $current_product_id

    def getId(product)
        $current_product_id = product.id
    end

    def current_product
        @current_product = Product.find($current_product_id);
    end

    def order_itemm
        order_items = "	SELECT * 
												FROM Order_Items"
				# order_informations = order_items.group(:shop_id)
				return order_items
    end
end
