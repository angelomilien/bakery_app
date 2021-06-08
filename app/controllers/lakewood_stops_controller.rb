class LakewoodStopsController < ApplicationController
    
    get "/route/:route/stops" do
        @route = Route.find(params[:route])
        @stops = @route.stops
        erb :'routes/show', :layout => false
    end

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    get "account"

    post 'stops/new' do
        
    end
end