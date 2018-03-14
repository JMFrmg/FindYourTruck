class DishsController < ApplicationController
  def new
  	@dish = Dish.new
  	@menu = current_menu
  end

  def create
  	@dish = Dish.new(dishes_params)
  	current_menu.dishes << @dish
  	if @dish.save
  		redirect_to current_menu
  	else
  		render 'new'
  	end
  end

  def edit
  	@dish = Dish.find(params[:id])
  end

  def update
  	@dish = Dish.find(params[:id])
  	if @dish.update(dishes_params)
      redirect_to current_menu
    end
  end

  def destroy
  	@dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to current_menu
  end

  private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
    def dishes_params
      params.permit(:name, :composition)
    end
end
