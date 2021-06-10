class UserController < ApplicationController
    
    get '/stops' do
       @user = current_user
       erb :'stops/index', :layout => false
    end
end