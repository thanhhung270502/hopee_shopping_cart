class ShopsController < ApplicationController    
  before_action :set_shop, only: %i[ show edit update editProfile ]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @shops = Shop.all
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

  def editProfile
    if @shop.update(shop_params)
      flash[:success] = "Update sucessfully!!"
      redirect_to @shop 
    else
      flash[:warning] = "Update failed. Try again..."
      redirect_to @shop
    end
  end

  private
      def set_shop
        @shop = Shop.find_by(id: params[:id])
      end

      def shop_params
          params.require(:shop).permit(:name, :user_id, :description, :image)
      end
end