class UsersController < ApplicationController


def myrides
@matches = Match.where(:user_id => session[:user_id])
end

def deleteride
  ride = Ride.find_by(:id => params[:ride_id])
  ride.destroy

  #need to delete matches
end

def show
  @user = User.find_by(:id => params[:user_id])
  if @user.id != session[:user_id]
    redirect_to root_url, notice: "Stop trying to hack"
  end
end

def edit
  @user = User.find_by(:id => params[:user_id])
end

def update
  user = User.find_by(:id => params[:user_id])
  user.first_name = params["first_name"]
  user.last_name = params["last_name"]
  user.email = params["email"]
  user.password = params["password"]
  user.phone = params["phone"]
  user.save
  redirect_to root_url, notice: "Profile Updated Sucessfully"
end

def new
end

def create
  user = User.new
  user.first_name = params["first_name"]
  user.last_name = params["last_name"]
  user.email = params["email"]
  user.password = params["password"]
  user.phone = params["phone"]
  user.save
  redirect_to root_url, notice: "Welcome to kabbie #{user.first_name}, please log in."
end

def destroy
  user = User.find_by(:id => params[:user_id])
  user.destroy
  redirect_to root_url, notice: "Profile has been deleted"
end


end
