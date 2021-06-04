class RoutesControllers < ApplicationController
  
  
  get '/routes' do
    if current_user
      @routes = bakery.routes
      erb :'users/index', :layout => false
    else
      redirect_if_not_logged_in
    end
  end
end