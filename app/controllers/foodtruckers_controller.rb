class FoodtruckersController < ApplicationController

  before_action :ensure_right_foodtrucker_logged, only: [:edit, :update, :addphoto, :addaddress]


  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
    if    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).exists?
      @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
      @street = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).first.streetadresses.where(actual: true)
        @hash = Gmaps4rails.build_markers @street do |street, marker|
          user_path = view_context.link_to street.foodtrucker.username.capitalize, showfoodtrucker_path(street.foodtrucker)
          marker.lat street.latitude
          marker.lng street.longitude
          marker.infowindow "<b>#{user_path}</b>"
          marker.picture({
                    :url => "https://png.icons8.com/color/50/000000/food-truck.png",
                    :width   => 50,
                    :height  => 50
                   })
            if street.foodtrucker.menu
              marker.title street.foodtrucker.menu.name
            else
              marker.title "Ce Foodtruck n'a pas renseigné encore de menu"
            end
        end
      else
        flash[:notice] = "Aucun Foodtrucker de ce nom trouvé"
        redirect_to root_path
    end
  end

  def generalsearch
    @street = Street.where(actual: true).all
    @hash = Gmaps4rails.build_markers @street do |street, marker|
      user_path = view_context.link_to street.foodtrucker.username.capitalize, showfoodtrucker_path(street.foodtrucker)
      menu_name = street.foodtrucker.menu.name
      marker.lat street.latitude
      marker.lng street.longitude
      marker.infowindow street.foodtrucker.username.capitalize
      marker.picture({
                :url => "https://png.icons8.com/color/50/000000/food-truck.png",
                :width   => 50,
                :height  => 50
               })
          marker.title "#{menu_name}<br/><b>Accedez a la page de #{user_path}</b>"
    end
  end



  def edit
    @foodtrucker = get_foodtrucker("id")
    if !@foodtrucker.menu
      @foodtrucker.menu = Menu.create
    end
    @photos = @foodtrucker.photos
    @addresses = @foodtrucker.streetadresses
    @photo = Photo.new
    @dish = @foodtrucker.menu.dishes
  end

  def update
  end


  def addphoto
    @photo = Photo.new(photo_params)
    Foodtrucker.find(params[:id]).photos << @photo
    if @photo.save
      flash[:success] = "Votre photo a bien été envoyée!"
      redirect_to edit_foodtrucker_path(params[:id])
    else
      redirect_to edit_foodtrucker_path(params[:id])
    end
  end

  def removephoto
    findphoto.delete
    redirect_to edit_foodtrucker_path(params[:foodtrucker_id])
  end

  def addaddress
    @address = Street.new
    @address.address = params[:address]
    @address.foodtrucker = get_foodtrucker("id")
    @address.save
    redirect_to edit_foodtrucker_path
  end

  def beactual
    if actual?
      flash[:notice] = "Vous êtes déjà disponible à une autre adresse"
      redirect_to edit_foodtrucker_path(get_foodtrucker("foodtrucker_id"))
    else
      @street = Street.find(params[:id])
      @street.actual = true
      @street.save
      @foodtrucker = @street.foodtrucker
      @street.foodtrucker.users.each do |follower|
        UserMailer.actual_email(follower, @foodtrucker).deliver_now if !follower.nil?
      end
      redirect_to edit_foodtrucker_path(get_foodtrucker("foodtrucker_id"))
    end
  end

  def beunactual
    @foodtruckers = get_foodtrucker("id")
    @streets = @foodtruckers.streetadresses
    @streets.each do |street|
      street.actual = false
      street.save
    end
  redirect_to edit_foodtrucker_path
  end

  def updatemenu
    @menu = get_foodtrucker("id").menu
    @menu.update(params.permit(:name, :image))
    redirect_to edit_foodtrucker_path
  end

  def newdish
    @dish = Dish.new(dishes_params)
    current_menu.dishes << @dish
    @dish.save
    redirect_to edit_foodtrucker_path
  end

  def removedish
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to edit_foodtrucker_path(current_foodtrucker)
  end

  def newsidedish
    @sidedish = Sidedish.new(dishes_params)
    current_menu.sidedishes << @sidedish
    @sidedish.save
    redirect_to edit_foodtrucker_path
  end

  def removesidedish
    @sidedish = Sidedish.find(params[:id])
    @sidedish.destroy
    redirect_to edit_foodtrucker_path(current_foodtrucker)
  end

  def newdesert
    @desert = Desert.new(dishes_params)
    current_menu.deserts << @desert
    @desert.save
    redirect_to edit_foodtrucker_path
  end

  def removedesert
    @desert = Desert.find(params[:id])
    @desert.destroy
    redirect_to edit_foodtrucker_path(current_foodtrucker)
  end

  def newdrink
    @drink = Drink.new(dishes_params)
    current_menu.drinks << @drink
    @drink.save
    redirect_to edit_foodtrucker_path
  end

  def removedrink
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to edit_foodtrucker_path(current_foodtrucker)
  end


  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

  def photo_params
    params.require(:photo).permit(:image)
  end


  def actual?
    Foodtrucker.find(params[:foodtrucker_id]).streetadresses.each do |street|
      if street.actual
        return true
      end
    end
    return false
  end

  def findphoto
    @photo = Photo.find(params[:id])
  end

  def dishes_params
    params.permit(:name, :composition, :price, :description)
  end



end
