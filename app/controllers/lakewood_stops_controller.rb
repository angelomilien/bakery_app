class LakewoodStopsController < ApplicationController

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops/new' do
        @route = Route.find_or_create_by(params[:route])
        @stop = Stop.create(params[:stop])
        @route.stops << @stop
        current_user.stops << @stop
        erb :'users/show', :layout => false
    end

    get '/index/:stop' do
        if !logged_in?
           redirect "/"
        end
        @user = current_user
        @stop = Stop.find(params[:stop])
        erb :'users/show', :layout => false

    end

    get '/edit/:user_id/:stop_id' do
        "hello"
    end
end

# {"route"=>{"route_number"=>"15"}, 
# "stop"=>{"name"=>"Merrick Deli", "addresse"=>"asdsdfd", "phone_number"=>"N.A"}}
# <% @routes.each do |route| %>
#   <button class="button_5">
#      <a href="/route/<%= route.id %>/stops">
#         <%= route.route_number %>
#      </a>
#   </button>
#  <% end %>