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

  get '/:user_name/routes' do
    if current_user
      @routes = Route.all
      @user = current_user
      erb :'users/account', :layout => false
    else
      redirect "/"
    end
  end

  post "/logout" do
    session.clear
    redirect "/"
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
			redirect "/#{user.user_name}/routes"
    else
      flash[:danger] = 'Invalid username/password'
      redirect '/login'
    end
  end
end