class LakewoodStopsController < ApplicationController
    
    get '/:route/stops' do
        @route = Route.find(params[:route])
        @stops = @route.stops
        erb :'routes/show', :layout => false
    end
end