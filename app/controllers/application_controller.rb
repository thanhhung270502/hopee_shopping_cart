class ApplicationController < ActionController::Base
    before_action :set_query

    include SessionsHelper
    include ShopsHelper
    include ProductsHelper
    include CartSessionsHelper
    include CartItemsHelper
    include OrderInformationsHelper

    
    @cart_items = CartItem.all

    def set_query
        @query = Product.ransack(params[:q])
        @products = @query.result(distinct: true)
    end
end
