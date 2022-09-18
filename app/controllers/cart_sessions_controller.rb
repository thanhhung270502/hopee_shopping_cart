class CartSessionsController < ApplicationController
  before_action :set_cart_session, only: %i[ show edit update destroy checkout ]

  # GET /cart_sessions or /cart_sessions.json
  def index
    @cart_sessions = CartSession.all
  end

  # GET /cart_sessions/1 or /cart_sessions/1.json
  def show
  end

  # GET /cart_sessions/new
  def new
    @cart_session = CartSession.new
  end

  # GET /cart_sessions/1/edit
  def edit
  end

  # POST /cart_sessions or /cart_sessions.json
  def create
    @cart_session = CartSession.new
    @cart_session.user_id = session[:user_id]

    if @cart_session.save 
      flash[:success] = "Success"
    else 
      render 'new'
    end

    # respond_to do |format|
    #   if @cart_session.save
    #     format.html { redirect_to cart_session_url(@cart_session), notice: "Cart session was successfully created." }
    #     format.json { render :show, status: :created, location: @cart_session }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @cart_session.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /cart_sessions/1 or /cart_sessions/1.json
  def update
    respond_to do |format|
      if @cart_session.update(cart_session_params)
        format.html { redirect_to cart_session_url(@cart_session), notice: "Cart session was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_sessions/1 or /cart_sessions/1.json
  def destroy
    @cart_session.destroy

    respond_to do |format|
      format.html { redirect_to cart_sessions_url, notice: "Cart session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def checkout
    @order = Order.new(@cart_session.attributes)
    if  @order.save 
      @cart_session.cart_items.each do |cart_item|
        # Copy CartItem to OrderItem
        OrderItem.create(newAtrs(@order, cart_item))

        # Decrease quantity product
        total = 0
        cart_item.product.product_sizes.each do |product_size|
          if (product_size.size.name == cart_item.size)
            number = product_size.number 
            number -= cart_item.quantity
            product_size.update_attribute(:number, number)
          end
          total += product_size.number
        end
        cart_item.product.update_attribute(:total_quantity, total)
      end
      @cart_session.d estroy
      flash[:success] = "Order successfully"
      redirect_to root_path
    else 
      flash[:danger] = "Order fail"  
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_session
      @cart_session = CartSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_session_params
      params.require(:cart_session).permit(:sum_money, :user_id)
    end

    def newAtrs(order, cart_item)
      {
        order_id: order.id,
        product_id: cart_item.product_id,
        quantity: cart_item.quantity,
        size: cart_item.size
      }
    end
end
