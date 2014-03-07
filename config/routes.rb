Kabbie::Application.routes.draw do

root 'rides#search'

#USER URLS
get "/login" => 'sessions#new'
get "/logout" => 'sessions#destroy'
get "/authenticate" => 'sessions#create'

get "/users/new" => 'users#new'
get "/users/create" => 'users#create'
get "/users/:user_id/show" => 'users#show'
# get "/users/:user_id/myrides" => 'users#myrides'
get "/users/myrides" => 'users#myrides'

#RIDE URLS

#CREATE
get 'rides/new' => 'rides#new'
get 'rides/create' => 'rides#create'

# READ
get "/rides" => 'rides#index'
get "/rides/:ride_id/show" => "rides#show"

# UPDATE
get "/rides/:ride_id/edit" => "rides#edit"
get "/rides/:ride_id/update" => "rides#update"

# DELETE
get "/rides/:ride_id/delete" => "rides#destroy"

end
