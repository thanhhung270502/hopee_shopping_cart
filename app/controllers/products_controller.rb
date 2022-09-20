class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy getProduct toggle_hot editQuantity updateQuantity   publicProduct ]
  before_action :createCartSession, only: %i[ getProduct ]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  def showAll
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @cart_item = CartItem.new
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
    if @product.save
      paramImages = params[:product_images]['image']
      paramImages.each do |a|
        if (!a.blank?)
          @product_images = @product.product_images.create!(:image => a, :product_id => @product.id)
        end
      end
      flash[:success] = 'Create shop successfully!'
      redirect_to products_path 
    else
        flash[:warning] = "Cannot create shop!!"
        render :new
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find_by(id: params[:id])
    puts params
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

    # Product.create!(shop_id: 1, name: "Hello", color: "White", price: 12, description: "abc", product_information: "edf", hot_product: false)
    # respond_to do |format|
    #   if @product.update_attribute(product_params)
    #     format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
    #     format.json { render :show, status: :ok, location: @product }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
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
    
    @cart_item = CartItem.new
    @cart_item.quantity = params[:quantity]
    @cart_item.size = Size.find(params[:size_ids]).name
    @cart_item.cart_session_id = current_cart_session.id
    @cart_item.product_id = current_product.id
    if (count_cart_sessions == 2)
      first_cart_session.destroy
    end
    total = @cart_item.cart_session.sum_money
    total += @cart_item.product.price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)

    puts "hello"

    if @cart_item.save
      flash[:success] = "Success roi em oi"
    else 
      render 'new'
    end

    redirect_to @product
    # redirect_to new_cart_item_path
  end

  def createCartSession
    if (!first_cart_session) 
      @cart_session = CartSession.new
      @cart_session.user_id = session[:user_id]
      @cart_session.save
    end
  end

  def editQuantity
    
  end

  def updateQuantity
    puts params
    numbers = params[:product_size][:number]
    puts @product

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :color, :price, :total_quantity, :status,
                                      :description, :product_information, :hot, size_ids:[],
                                      product_images_attributes: [:id, :product_id, :image], numbers: [])
    end
end
