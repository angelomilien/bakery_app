require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      redirect '/' unless logged_in?
    end

    def bakery
      Bakery.find_or_create_by(name:"Lakewood Bakery", addresse: "107 Marine St, Farmingdale, NY 11735")
    end
  end
end
