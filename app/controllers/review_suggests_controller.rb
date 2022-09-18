class ReviewSuggestsController < ApplicationController
  before_action :set_review_suggest, only: %i[ show edit update destroy ]

  # GET /review_suggests or /review_suggests.json
  def index
    @review_suggests = ReviewSuggest.all
  end

  # GET /review_suggests/1 or /review_suggests/1.json
  def show
  end

  # GET /review_suggests/new
  def new
    @review_suggest = ReviewSuggest.new
  end

  # GET /review_suggests/1/edit
  def edit
  end

  # POST /review_suggests or /review_suggests.json
  def create
    @review_suggest = ReviewSuggest.new(review_suggest_params)

    respond_to do |format|
      if @review_suggest.save
        format.html { redirect_to review_suggest_url(@review_suggest), notice: "Review suggest was successfully created." }
        format.json { render :show, status: :created, location: @review_suggest }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review_suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /review_suggests/1 or /review_suggests/1.json
  def update
    respond_to do |format|
      if @review_suggest.update(review_suggest_params)
        format.html { redirect_to review_suggest_url(@review_suggest), notice: "Review suggest was successfully updated." }
        format.json { render :show, status: :ok, location: @review_suggest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review_suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_suggests/1 or /review_suggests/1.json
  def destroy
    @review_suggest.destroy

    respond_to do |format|
      format.html { redirect_to review_suggests_url, notice: "Review suggest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review_suggest
      @review_suggest = ReviewSuggest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_suggest_params
      params.fetch(:review_suggest, {})
    end
end
