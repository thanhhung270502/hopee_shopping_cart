class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.cart_session_id = current_cart_session.id
    @cart_item.product_id = current_product.id
    if (count_cart_sessions == 2)
      first_cart_session.destroy
    end
    total = @cart_item.cart_session.sum_money
    total += @cart_item.product.current_price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)

    if @cart_item.save
      flash[:success] = "Success roi em oi"
    else 
      render 'new'
    end
    # respond_to do |format|
    #   if @cart_item.save
    #     format.html { redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully created." }
    #     format.json { render :show, status: :created, location: @cart_item }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @cart_item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    total = @cart_item.cart_session.sum_money
    total -= @cart_item.product.current_price * @cart_item.quantity
    @cart_item.cart_session.update_attribute(:sum_money, total)
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: "Cart item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update_quantity
    @cart_item = CartItem.find(params[:cart_item][:current_id]);
    prevQuantity = @cart_item.quantity.to_i;
    newQuantity = params[:cart_item][:quantity].to_i;
    
    total = @cart_item.cart_session.sum_money;
    if (newQuantity > prevQuantity) 
      npQuantity = newQuantity - prevQuantity;
      total += @cart_item.product.current_price * npQuantity;
    else 
      npQuantity = prevQuantity - newQuantity;
      total -= @cart_item.product.current_price * npQuantity;
    end
    @cart_item.cart_session.update_attribute(:sum_money, total)
    @cart_item.update_attribute(:quantity, newQuantity);
    redirect_to cart_items_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :product_id, :cart_session_id)
    end
end
