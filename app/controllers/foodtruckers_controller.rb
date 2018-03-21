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
      marker.title street.foodtrucker.username
      marker.infowindow street.foodtrucker.username.capitalize
      marker.picture({
                :url => "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAASnSURBVGhD7Zh9TFtVGMZrp50COrwaRIpCnCPLZAVKaUEWWwsMhiwqY8TMVgOauS26FpcM59eWzMEmW3ARTGR/ODYXBbOYaOZHNOMPnBtZJNMo+4hzmmgyBgyQljKg9/Wcy7m3veVAe0rpMLlP8svNuec9532ee89NAypFihQpUqRIEUW8oyAPsY93WD+MIs2o51ZwmOOJjbkJbbYfnAVws+Cd1n6+pjCX2AlP/FarjbZ5tEFvp5ffVhRLbLELPY1O2sY3A76mYAuxxa4bVVkj49V6mE8GSpOhf402OCXaPmKLXa7yVN719IMwn/yhU8PldFVIXCtOqiTW2OQfZOzte2Gsnps7dRy4yqcHadVx0KRLoHJy5R1CzVULd4FYY5MYxG3XAvymAuiJDJ5tCdOCrM7SQZo+l8rGzIeFmr8Mi73EGpvEIDf2clRD4TL+URxTkIysHDi/cqqurzTRRuyFLjHIxJEY6D+pAfcpNcBZFfzbuUi4igx33iobB857fpxaN3ZaDdc6NDD5xWKmIJhjuruFul4Ld4nYC11iEO+h2wA+Q6YIPzXeKRuf2X+XbBw4f6XldtkY2lXMQTaLxytbw368pDfSECOZ8CITrdsTZcZaXk2SjY+geVwnjk/svgdcx9BbImNvi4Y5SJY+By6kT9UOliVXEYuhSfrYN2ihqy4eeppiYUfVQ5BhMkLbGwlw8YMYeN+RDMsNudDs1ArjT9F9PP86qsP13+zmIP+xbKiuWA7nDsbBmYYlMFp1P3MQzCe6eKH2qpX7nVgMTWIQTGWenro5K3qDSQrBGuTlzKVC7Z96DU8shqaFFkSvN8Cl9FuE+oE1D2wiNoNroQXBtIvHy8JdITaDK5pBWPknLxZGK5dd97yU9uVEQ0o5sUzXQg+C13uc9wk/st4OjXeylbsM9SmpxL5P/6cgIhPH41zEvk9ikOGOz2Ggpxv6I8TQ+e55C8KfXQTEvk9ikKFzp2CwrzeiRCrI6Ivox/hXvyDd6ulBJjflj3i3rILxXc/A+DvPRxS8L2b4iSQYLE1kxrVuqbSHtzYHvLsyp3grw03s+wQO6xDtz85I4l6XKr0dFsZsj1D3w56JfZ+CBfm52gKHK1bBwSfzhSse0+pmI1iQrrI0OFScDgeKMoQrHuP7EQnifsUK+9Y+CnaLaRrvrs0X5mnraMwUpO+pFKgryqT2qEf3rz87xyA8YqYQIng+cN1M0IKMIOoK6SFE6osN1P2oQXhHwd+Bhfj4+G9Ya6+A93bUCFf/+7+8YJatmwlakK6yZbK9WHrgf+gR+z6hmwcCC/G34GuwHr5v/1hiu83XqBXVBa6lQQuCv4Vwe/AOaxux7xPs3KnmnYWV6M3sQUV7MW+W5l0UN2pET8m/SWOtU2qC68Q1s+GxrfjBs2HFaX/2lGQPhNMD+dwMG8tiiP3ZZTMbm8WN8NMRG3zXdlT2tOxmUxNZwqxo9EBNckukjRDC+X2tRt4A8dzjxtVkCbOi0UOQzWz61n/D6Ri/JqVhKxo9VOsLs5fYLMavaA3QsTiB50lp2IpGD0l2S04xPs+I4/i84jGZipii0UORIkWKFEVQKtV/5h1tu2aOOyYAAAAASUVORK5CYII=",
                :width   => 50,
                :height  => 50
               })

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
    Foodtrucker.find(params[:id]).photo = @photo
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
    if actual?
      flash[:notice] = "Vous êtes déjà disponible à une autre adresse"
      redirect_to edit_foodtrucker_path(Foodtrucker.find(params[:foodtrucker_id]))
    else
      @street = Street.find(params[:id])
      @street.actual = true
      @street.save
      redirect_to edit_foodtrucker_path(Foodtrucker.find(params[:foodtrucker_id]))
    end
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

  def get_foodtrucker
    Foodtrucker.find(params[:id])
  end

  def actual?
    Foodtrucker.find(params[:foodtrucker_id]).streetadresses.each do |street|
      if street.actual
        return true
      end
    end
    return false
  end

end
