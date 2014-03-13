Kabbie::Application.routes.draw do

root 'rides#index'

get "/login" => 'sessions#new'
get "/logout" => 'sessions#destroy'
get "/authenticate" => 'sessions#create'

#USER URLS
#USER - CREATE
get "/users/new" => 'users#new'
get "/users/create" => 'users#create'

#USER - READ
get "/users/:user_id/show" => 'users#show'

#USER - UPDATE
get "/users/:user_id/edit" => 'users#edit'
get "/users/:user_id/update" => 'users#update'

#USER - DELETE
get "/users/:user_id/destroy" => 'users#destroy'

# get "/users/:user_id/myrides" => 'users#myrides'
get "/users/myrides" => 'users#myrides'

#RIDE URLS

#CREATE
get 'rides/new' => 'rides#new'
get 'rides/create' => 'rides#create'
get 'rides/join' => 'rides#join'
get 'rides/unjoin' => 'rides#unjoin'

# READ
get "/rides" => 'rides#viewrides'
get "/rides/show" => "rides#show"

# UPDATE
get "/rides/:ride_id/edit" => "rides#edit"
get "/rides/:ride_id/update" => "rides#update"

# DELETE
get "/rides/:ride_id/delete" => "rides#destroy"

end
