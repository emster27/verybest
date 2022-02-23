class BestDishesController < ApplicationController
  before_action :set_best_dish, only: %i[show edit update destroy]

  def index
    @q = BestDish.ransack(params[:q])
    @best_dishes = @q.result(distinct: true).includes(:venue, :bookmarks,
                                                      :cuisine).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @best_dish = BestDish.new
  end

  def edit; end

  def create
    @best_dish = BestDish.new(best_dish_params)

    if @best_dish.save
      message = "BestDish was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @best_dish, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @best_dish.update(best_dish_params)
      redirect_to @best_dish, notice: "Best dish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @best_dish.destroy
    message = "BestDish was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to best_dishes_url, notice: message
    end
  end

  private

  def set_best_dish
    @best_dish = BestDish.find(params[:id])
  end

  def best_dish_params
    params.require(:best_dish).permit(:user_id, :venue_id, :bookmark_count)
  end
end
