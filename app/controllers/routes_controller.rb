class RoutesController < ApplicationController
  
  
  get "/route/:route/stops" do
    @route = Route.find(params[:route])
    @stops = @route.stops
    erb :'routes/show', :layout => false
  end
end