class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy getProduct toggle_hot editQuantity updateQuantity publicProduct discount ]
  before_action :createCartSession, only: %i[ getProduct ]
  before_action :correct_product, only: %i[ edit update toggle_hot editQuantity updateQuantity publicProduct discount ]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  def showAll
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    if @product.destroy_product
      if current_user.role != 2
        flash[:info] = "Don't find this product..."
        redirect_to products_path
      else
        @cart_item = CartItem.new
      end
    else 
      @cart_item = CartItem.new
    end
  end

  def show_hot
  end

  # GET /products/new
  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.shop_id = current_shop.id
    @product.hot_product = false
    @product.status = false
    @product.current_price = @product.price
    if @product.save
      paramImages = params[:product_images]['image']
      paramImages.each do |a|
        if (!a.blank?)
          @product_images = @product.product_images.create!(:image => a, :product_id => @product.id)
        end
      end
      flash[:success] = 'Create shop successfully!'
      redirect_to @product 
    else
        flash[:warning] = "Cannot create shop!!"
        render :new
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find_by(id: params[:id])
    @product.update_attribute(:discount, 0)
    @product.update_attribute(:current_price, params[:product][:price])
    images = params[:product_images][:image]
    for i in 0...images.length
      if images[i].blank?
        images.delete_at(i)
      end
    end
    # binding.pry
    if @product.update(product_params)
      for i in 0...images.length
        if !images[i].blank?
          @product.product_images[i].update_attribute(:image, images[i])
        end
      end
      redirect_to @product
    else
      render 'edit'
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.update_attribute(:destroy_product, false)
  end

  def toggle_hot
    if (@product.hot_product == true) 
      @product.update_attribute(:hot_product, false)
    else
      @product.update_attribute(:hot_product, true)
    end      
    redirect_to @product
  end

  def getProduct
    getId(@product);
    
    if params[:size_ids].blank? 
      flash[:warning] = "You don't choose size. Please try again..."
    elsif check(@product, params[:quantity], Size.find(params[:size_ids]).name)
      @cart_item = CartItem.new
      @cart_item.quantity = params[:quantity]
      @cart_item.size = Size.find(params[:size_ids]).name
      @cart_item.cart_session_id = current_cart_session.id
      @cart_item.product_id = current_product.id
      if (count_cart_sessions == 2)
        first_cart_session.destroy
      end
      total = @cart_item.cart_session.sum_money
      total += @cart_item.product.current_price * @cart_item.quantity
      @cart_item.cart_session.update_attribute(:sum_money, total)
      @cart_item.cart_session.update_attribute(:total_final, total)

      if @cart_item.save
        flash[:success] = "Add to cart successfully!!!"
      else 
        flash[:danger] = "Add to cart failed!!!"
      end
    else 
      flash[:danger] = "Add to cart failed!!!"
    end
    redirect_to @product
    # redirect_to new_cart_item_path
  end

  def createCartSession
    if (first_cart_session.nil?) 
      @cart_session = CartSession.new
      @cart_session.user_id = session[:user_id]
      @cart_session.save
    end
  end

  def editQuantity
  end

  def updateQuantity
    numbers = params[:product_size][:number]

    for i in 0...@product.product_sizes.length
      @product.product_sizes[i].update_attribute(:number, numbers[i])
    end

    total = 0
    @product.product_sizes.each do |product_size|
      total += product_size.number
    end
    @product.update_attribute(:total_quantity, total)

    redirect_to @product
  end

  def publicProduct
    if (@product.status == true) 
      @product.update_attribute(:status, false)
    else
      @product.update_attribute(:status, true)
    end      
    redirect_to @product
  end

  def discount 
    discount_ = params[:discount].to_i
    @product.update_attribute(:discount, discount_)
    newPrice = @product.price * (100 - discount_) / 100
    @product.update_attribute(:current_price, newPrice)
    redirect_to @product
  end

  def arrivals_HS
    all_products = Product.all
    @products = all_products.select { |value|
      value.type_product >= 3 and
      value.type_product <= 5
    }
  end

  def arrivals_TP
    all_products = Product.all
    @products = all_products.select { |value|
      value.type_product <= 2
    }
  end

  def arrivals_TJ
    all_products = Product.all
    @products = all_products.select { |value|
      value.type_product >= 6
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :color, :price, :total_quantity, :status,
                                      :discount, :current_price, :type_product,
                                      :description, :product_information, :hot, size_ids:[], category_ids: [],
                                      product_images_attributes: [:id, :product_id, :image], numbers: [])
    end

    def correct_product 
      @product = Product.find_by(id: params[:id])
      if !current_product?(@product)
        flash[:warning] = "You don't entry this page."
        redirect_to(root_url)
      end
    end
end
