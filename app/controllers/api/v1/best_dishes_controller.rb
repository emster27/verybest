class Api::V1::BestDishesController < Api::V1::GraphitiController
  def index
    best_dishes = BestDishResource.all(params)
    respond_with(best_dishes)
  end

  def show
    best_dish = BestDishResource.find(params)
    respond_with(best_dish)
  end

  def create
    best_dish = BestDishResource.build(params)

    if best_dish.save
      render jsonapi: best_dish, status: 201
    else
      render jsonapi_errors: best_dish
    end
  end

  def update
    best_dish = BestDishResource.find(params)

    if best_dish.update_attributes
      render jsonapi: best_dish
    else
      render jsonapi_errors: best_dish
    end
  end

  def destroy
    best_dish = BestDishResource.find(params)

    if best_dish.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: best_dish
    end
  end
end
