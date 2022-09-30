class UserVouchersController < ApplicationController
  before_action :set_user_voucher, only: %i[ show edit update destroy ]

  # GET /user_vouchers or /user_vouchers.json
  def index
    @user_vouchers = UserVoucher.all
  end

  # GET /user_vouchers/1 or /user_vouchers/1.json
  def show
  end

  # GET /user_vouchers/new
  def new
    @user_voucher = UserVoucher.new
  end

  # GET /user_vouchers/1/edit
  def edit
  end

  # POST /user_vouchers or /user_vouchers.json
  def create
    @user_voucher = UserVoucher.new(user_voucher_params)

    respond_to do |format|
      if @user_voucher.save
        format.html { redirect_to user_voucher_url(@user_voucher), notice: "User voucher was successfully created." }
        format.json { render :show, status: :created, location: @user_voucher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_vouchers/1 or /user_vouchers/1.json
  def update
    respond_to do |format|
      if @user_voucher.update(user_voucher_params)
        format.html { redirect_to user_voucher_url(@user_voucher), notice: "User voucher was successfully updated." }
        format.json { render :show, status: :ok, location: @user_voucher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_vouchers/1 or /user_vouchers/1.json
  def destroy
    @user_voucher.destroy

    respond_to do |format|
      format.html { redirect_to user_vouchers_url, notice: "User voucher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_voucher
      @user_voucher = UserVoucher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_voucher_params
      params.fetch(:user_voucher, {})
    end
end
