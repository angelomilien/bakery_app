class LakewoodStopsController < ApplicationController

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops/new' do
        @route = Route.create(params[:route])
        @stop = Stop.create(params[:stop])
        erb :'stops/index', :layout => false
    end
end

# {"route"=>{"route_number"=>"15"}, 
# "stop"=>{"name"=>"Merrick Deli", "addresse"=>"asdsdfd", "phone_number"=>"N.A"}}