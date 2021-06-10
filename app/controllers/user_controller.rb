class UserController < ApplicationController
    
    get '/account/:user_name' do
        if logged_in?
          @user = current_user
          erb :'users/account', :layout => false
        else
          redirect "/"
        end
    end
end