class SessionsController < ApplicationController

def new
end

def destroy
  reset_session
  redirect_to root_url, notice: "You have logged out."
end

def create
  user = User.find_by(:email => params[:email])
  if user.present?
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect_to root_url, notice: "Welcome #{user.first_name}!"
    else
      redirect_to "/login", notice: "Wrong password, please try again."
    end
  else
    redirect_to "/login", notice: "User email not found."
  end
end

end
