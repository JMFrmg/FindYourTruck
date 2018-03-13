class MenusController < ApplicationController
  def new
  	@menu = Menu.new
  end

  def create
  	@menu = Menu.new(menu_params)
  	@menu.foodtrucker = Foodtrucker.find(1)
  	@menu.save
  end
  def show
  	@menu = Menu.find(params[:id])
  end

  def edit
  	@menu = Menu.find(params[:id])
  end

  def update
  	@menu = Menu.find(params[:id])
  	if @menu.update(params.require(:menu).permit(:description, :image))
      redirect_to @menu
    end
  end

  private #on ne récupère de la view que les données qui nous intéressent (anonyme_user et content) - placé ici dans le script par convention
    def menu_params
      params.permit(:description, :image)
    end
end
