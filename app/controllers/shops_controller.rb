class ShopsController < ApplicationController    
    def index
        
    end

    def show 
        @shop = Shop.find_by(id: params[:id])
        @products = Product.all
    end

    def new
        @shop = Shop.new
    end

    def create
        @shop = Shop.new(shop_params)
        @user = User.find_by(id: session[:user_id])

        @shop.user_id = session[:user_id]
        
        if @shop.save
            @user.update_attribute(:role, 1)
            
            flash[:success] = 'Create shop successfully!'
            redirect_to root_path 
        else
            flash[:warning] = "Cannot create shop!!"
            render :new
        end
    end

    def edit

    end

    def update

    end
    
    def destroy
        
    end

    private
        def shop_params
            params.require(:shop).permit(:name, :user_id, :description, :avatar)
        end
end