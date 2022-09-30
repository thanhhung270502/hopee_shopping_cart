class VouchersController < ApplicationController
  before_action :set_voucher, only: %i[ show edit update destroy ]
  before_action :admin_user, only: %i[ new create edit update destroy ]

  # GET /vouchers or /vouchers.json
  def index
    @vouchers = Voucher.all
  end

  # GET /vouchers/1 or /vouchers/1.json
  def show
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers or /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)
    random_number = rand(1.1..9.9)*1000000
    @voucher.update_attribute(:code, random_number.to_i)

    if @voucher.save 
      flash[:success] = "Create new voucher successfully!"
      redirect_to vouchers_path
    else 
      flash[:danger] = "Create new voucher failed! Please try again..."
      render :new
    end
  end

  # PATCH/PUT /vouchers/1 or /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to voucher_url(@voucher), notice: "Voucher was successfully updated." }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1 or /vouchers/1.json
  def destroy
    @voucher.destroy

    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: "Voucher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def all_vouchers
    @vouchers = Voucher.all
  end

  def get_voucher
    @voucher = Voucher.find_by(id: params[:voucher][:voucher_id])
    if (@voucher.quantity > 0)
      current_user.user_vouchers.create!(:user_id => current_user.id, :voucher_id => @voucher.id)

      quantity = @voucher.quantity - 1
      @voucher.update_attribute(:quantity, quantity)

      flash[:success] = "Get successfully!"
    else 
      flash[:warning] = "Voucher is full quantity"
    end
    redirect_to all_vouchers_path
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voucher_params
      params.require(:voucher).permit(:name, :code, :quantity, :type_voucher, :discount, :discount_max, :condition)
    end
end
