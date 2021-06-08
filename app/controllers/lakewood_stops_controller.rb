class LakewoodStopsController < ApplicationController

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops/new' do
        @route = Route.find_by(params[:route])
        @stop = Stop.create(params[:stop])
        @route.stops << @stop
        @stop.user = current_user
        erb :'users/show', :layout => false
    end

    get '/stop/:index' do
       erb :'users/show/', :layout => false
    end
end

# {"route"=>{"route_number"=>"15"}, 
# "stop"=>{"name"=>"Merrick Deli", "addresse"=>"asdsdfd", "phone_number"=>"N.A"}}