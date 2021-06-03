class LakewoodStopsController < ApplicationController
    
    get '/lakewood/:route/stops' do
        @stops = Route.find(params[:route]).stops
        erb :'users/pages/stops', :layout => false
    end
end