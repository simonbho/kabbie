class RidesController < ApplicationController

def search
end

def index

if params[:date].present?
  @filter_rides = Ride.all.where(:depart_date => params[:date])
  @filter_date = params[:date]
else
  @filter_rides = Ride.all
  @filter_date = "NO RIDES"
end
end

def new
end

def create
  ride = Ride.new
  ride.origin = params["origin"]
  ride.destination = params["destination"]
  ride.depart_date = params["date"]
  ride.depart_time_2 = params["depart_time_2"]
  ride.save
  redirect_to root_url, notice: "New ride created"
end


def show
end

end
