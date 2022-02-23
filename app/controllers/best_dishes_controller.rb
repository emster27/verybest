class BestDishesController < ApplicationController
  before_action :set_best_dish, only: [:show, :edit, :update, :destroy]

  # GET /best_dishes
  def index
    @best_dishes = BestDish.all
  end

  # GET /best_dishes/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /best_dishes/new
  def new
    @best_dish = BestDish.new
  end

  # GET /best_dishes/1/edit
  def edit
  end

  # POST /best_dishes
  def create
    @best_dish = BestDish.new(best_dish_params)

    if @best_dish.save
      message = 'BestDish was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @best_dish, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /best_dishes/1
  def update
    if @best_dish.update(best_dish_params)
      redirect_to @best_dish, notice: 'Best dish was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /best_dishes/1
  def destroy
    @best_dish.destroy
    message = "BestDish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to best_dishes_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_best_dish
      @best_dish = BestDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def best_dish_params
      params.require(:best_dish).permit(:user_id, :venue_id, :bookmark_count)
    end
end
