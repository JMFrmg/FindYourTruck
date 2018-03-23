class MenusController < ApplicationController
  
  def show
  	@menu = current_menu
  	@dishes = @menu.dishes
  end

  def edit
  	@menu = current_menu
  	@dishes = @menu.dishes
  end

  def update
  	@menu = current_menu
  	if @menu.update(params.require(:menu).permit(:description, :image))
      redirect_to @menu
    end
  end

  
  private
    def menu_params
      params.permit(:description, :image)
    end

    
end
