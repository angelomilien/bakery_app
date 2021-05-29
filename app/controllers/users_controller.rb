class UsersController < ApplicationController
    
    get '/user' do
        erb :'registrations/signup'
    end
end

# :layout => false