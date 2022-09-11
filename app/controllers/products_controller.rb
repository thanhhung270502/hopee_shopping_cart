class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy getProduct toggle_hot ]
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
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.shop_id = current_shop.id
    @product.hot = false
    # @product.image.attach(params[:product][:image])
    # @product.images.attach(params[:product][:images])
    
    if @product.save
        flash[:success] = 'Create shop successfully!'
        redirect_to root_path 
    else
        flash[:warning] = "Cannot create shop!!"
        render :new
    end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end

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
    if (@product.hot) 
      @product.hot = false
    else
      @product.hot = true
    end      
  end

  def getProduct
    getId(@product);

    @cart_item = CartItem.new
    @cart_item.quantity = params[:quantity]
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :color, :price, 
                                      :description, :hot, 
                                      images: [], size_ids:[])
    end
end
