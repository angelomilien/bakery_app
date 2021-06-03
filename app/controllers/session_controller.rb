class SessionController < ApplicationController
    
  get '/' do
    erb :home
  end
  
  get '/signup' do
    erb :'registrations/signup'
  end

  get '/login' do
    erb :'sessions/login'
  end

  get '/error' do
    erb :'error'
  end

  get '/existed/:user' do
    erb :existed_user
  end

  get '/account/lakewood' do
    if current_user
      @routes = bakery.routes
      erb :'users/account', :layout => false
    else
      redirect_if_not_logged_in
    end
  end

  get "/logout" do
    session.clear
    redirect_if_not_logged_in
  end

  post "/signup" do
    user = User.find_by(user_name: params[:username])
    if params[:username] == "" || params[:password] == ""
      redirect '/error'
    elsif user && user.authenticate(params[:password])
      puts params
      redirect "/existed/#{user.user_name}"
    else
      User.create(user_name: params[:username], password: params[:password])
      redirect '/'
    end
  end

  
  post '/login' do
    user = User.find_by(user_name: params['username'])
    if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/account/lakewood"
    else
      flash[:danger] = 'Invalid username/password'
      redirect '/login'
    end
  end
end