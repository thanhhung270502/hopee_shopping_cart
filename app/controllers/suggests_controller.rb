class SuggestsController < ApplicationController
  before_action :set_suggest, only: %i[ show edit update destroy ]

  # GET /suggests or /suggests.json
  def index
    @suggests = Suggest.all
  end

  # GET /suggests/1 or /suggests/1.json
  def show
  end

  # GET /suggests/new
  def new
    @suggest = Suggest.new
  end

  # GET /suggests/1/edit
  def edit
  end

  # POST /suggests or /suggests.json
  def create
    @suggest = Suggest.new(suggest_params)

    respond_to do |format|
      if @suggest.save
        format.html { redirect_to suggest_url(@suggest), notice: "Suggest was successfully created." }
        format.json { render :show, status: :created, location: @suggest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggests/1 or /suggests/1.json
  def update
    respond_to do |format|
      if @suggest.update(suggest_params)
        format.html { redirect_to suggest_url(@suggest), notice: "Suggest was successfully updated." }
        format.json { render :show, status: :ok, location: @suggest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggests/1 or /suggests/1.json
  def destroy
    @suggest.destroy

    respond_to do |format|
      format.html { redirect_to suggests_url, notice: "Suggest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggest
      @suggest = Suggest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suggest_params
      params.fetch(:suggest, {})
    end
end
