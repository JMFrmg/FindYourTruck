class FoodtruckersController < ApplicationController

  def index
    @foodtrucker = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"])
    @address = Foodtrucker.where(["username LIKE ?","%#{params[:search]}%"]).first.streetadresses.where(actual: true).last.address
  end

  def generalsearch
    #@user_location = Userlocation.new(ip:request.location.ip)
    #@user_location = Userlocation.new(ip:" 130.79.220.86")
    #@user_location.save
    #@nearfoodtrucks = Street.near([@user_location.latitude, @user_location.longitude], 10)
    @street = Street.where(actual: true).all
    @hash = Gmaps4rails.build_markers(@street) do |street, marker|
      marker.lat street.latitude
      marker.lng street.longitude
      marker.title street.city
    end
  end

  def gmaps4rails_marker_picture
    { picture: "", width: "28", height: "33" }
  end

  def edit
    @foodtrucker = Foodtrucker.find(params[:id])
    @addresses = @foodtrucker.streetadresses
    @photo = Photo.new
  end

  def update
  end

  def addphoto
    @photo = Photo.new(photo_params)
    Foodtrucker.find(params[:id]).photos << @photo
    if @photo.save
      flash[:success] = "Votre photo a bien été envoyée!"
      redirect_to edit_foodtrucker_path
    else
      redirect_to edit_foodtrucker_path
    end
  end

  def removephoto
    findphoto.delete
    redirect_to edit_foodtrucker_path
  end

  def addaddress
    @address = Street.new
    @address.address = params[:address]
    @address.foodtrucker = Foodtrucker.find(params[:id])
    @address.save
    redirect_to edit_foodtrucker_path
  end

  def beactual
    @street = Street.find(params[:id])
    @street.actual = true
    @street.save
    redirect_to edit_foodtrucker_path(current_foodtrucker)
  end

  def beunactual
    @foodtruckers = Foodtrucker.find(params[:id])
    @streets = @foodtruckers.streetadresses
    @streets.each do |street|
      street.actual = false
      street.save
    end
  redirect_to edit_foodtrucker_path
  end

  private

  def foodtrucker_params
    params.require(:foodtrucker).permit(:username, :email, :postalcode)
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
 
  def findphoto
    @photo = Photo.find(params[:id])
  end

end
