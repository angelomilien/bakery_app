class LakewoodStopsController < ApplicationController
    
    # get "/route/:route/stops" do
    #     @route = Route.find(params[:route])
    #     @stops = @route.stops
    #     erb :'routes/show', :layout => false
    # end

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops/new' do
        puts params
        # @route = Route.new(params[:route])
        # @stop = Stop.new{}
        # erb :'stops/index', :layout => false
    end
end

# {"route"=>{"route_number"=>"15"}, "stop_name"=>{"stop_name"=>"Hollies Deli"}, 
# "stop_address"=>{"stop_address"=>"226 Hollies Blvd"}, "phone_number"=>{"phone_number"=>"N.A"}}