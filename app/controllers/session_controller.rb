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

  get '/existed' do
    erb :existed_user
  end

  get '/account' do
    erb :'users/account', :layout => false
  end

  post "/signup" do
    user = User.find_by(user_name: params[:username])
    if params[:username] == "" || params[:password] == ""
      redirect '/error'
    elsif user && user.authenticate(params[:password])
      puts params
      redirect '/existed'
    else
      User.create(user_name: params[:username], password: params[:password])
      redirect '/'
    end
  end

  
  post '/login' do
    user = User.find_by(user_name: params['username'])
    if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/account"
    else
      flash[:danger] = 'Invalid username/password'
      redirect '/login'
    end
  end
end