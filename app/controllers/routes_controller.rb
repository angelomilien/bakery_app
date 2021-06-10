class RoutesController < ApplicationController
  
  
  get "/" do
    @route = Route.find(params[:route])
    @stops = @route.stops
    erb :'routes/show', :layout => false
  end
end