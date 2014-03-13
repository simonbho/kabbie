class RidesController < ApplicationController

def index
end

def viewrides
@filter_rides = Ride.all.where( :depart_date => params[:date])
                        .where(:origin => params[:origin])
                        .where(:destination => params[:destination])
if !@filter_rides.empty?
    @filter_date = DateTime.parse(params[:date])
    @filter_origin = params[:origin]
    @filter_destination = params[:destination]
    @filter_rides = @filter_rides.order("depart_time_2 asc")
else
  @filter_date = "NO RIDES"
end
end

def new
end

def create
forigin = params["origin"]
fdestination = params["destination"]
fdepart_date = params["date"]

if (forigin != fdestination)
if (fdepart_date.present?)
  ride = Ride.new
  ride.origin = params["origin"]
  ride.destination = params["destination"]
  ride.depart_date = params["date"]
  ride.depart_time_2 = params["depart_time_2"]
  ride.comments = params["comments"]
  ride.save

  match = Match.new
  match.user_id = session[:user_id]
  match.ride_id = Ride.last.id
  match.save

  redirect_to '/users/myrides', notice: "New ride created"
else
  redirect_to '/rides/new', notice: "Date cannot be blank"
end
else
  redirect_to '/rides/new', notice: "Origin & Destination must be different"
end
end

def join
  match = Match.new
  match.user_id = session[:user_id]
  match.ride_id = params["ride_id"]
  match.save
  redirect_to root_url, notice: "You have successfully joined a ride"
end

def unjoin
  match = Match.find_by(:id => params[:match_id])
  match.destroy
  redirect_to '/users/myrides', notice: "You have successfully removed yourself from the ride"
end

def show
@ride_details = Ride.where( :id => params[:ride_id])
@matchedriders = Match.where(:ride_id => params[:ride_id])
end

end
