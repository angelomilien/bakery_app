class LakewoodStopsController < ApplicationController

    get "/stops/new" do
      erb :'stops/new', layout: false
    end

    get '/stops' do
        
      if !logged_in?
        redirect "/"
      end
      @user = current_user
      erb :'stops/index', :layout => false
    end

    get '/edit/error' do
      erb :'stops/error', :layout => false
    end

    post '/stops' do
        if !logged_in?
            redirect "/"
        elsif params[:route][:route_number] == "" || params[:stop][:name] == "" || params[:stop][:adresse] == "" || params[:stop][:phone_number] == ""
          redirect 'edit/error'
        end
        @route = Route.find_or_create_by(params[:route])
        @stop = Stop.create(params[:stop])
        @route.stops << @stop
        current_user.stops << @stop
        erb :'stops/show', :layout => false
    end

    get '/stops/:stop_id' do
        if !logged_in?
           redirect "/"
        end
        @user = current_user
        @stop = Stop.find(params[:stop_id])
        erb :'stops/show', :layout => false
    end

    get '/stops/:stop_id/edit' do
        @user = current_user
        @stop = Stop.find(params[:stop_id])
        erb :'stops/edit', :layout => false
    end


  patch "/stops/:id" do
    @user = current_user
    @stop = Stop.find(params[:id])
    @stop.update(params[:stop])
    redirect to "/stops/#{ @stop.id }"
  end

  delete "/stops/:id" do
    Stop.destroy(params[:id])
    redirect to "/stops"
  end
end


# <label for="content">Route: </label>
# <input id="content" type="text" name="stop[route]"  value="<%= @stop.route.route_number %>"/><br><br><br>