class UsersController < ApplicationController
    
    get '/user' do
        erb :'registrations/signup'
    end
end