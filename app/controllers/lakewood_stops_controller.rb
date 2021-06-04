class LakewoodStopsController < ApplicationController
    
    get '/lakewood/:route/stops' do
        @route = Route.find(params[:route])
        @stops = @route.stops
        erb :'users/pages/stops', :layout => false
    end
end