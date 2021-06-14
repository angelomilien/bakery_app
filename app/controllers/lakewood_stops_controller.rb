class LakewoodStopsController < ApplicationController

    get "/stops/new" do
      redirect_if_not_logged_in
      erb :'stops/new', layout: false
    end

    get '/stops' do
        
      redirect_if_not_logged_in
      erb :'stops/index', :layout => false
    end

    get '/edit/error' do
      erb :'stops/error', :layout => false
    end

    post '/stops' do
        redirect_if_not_logged_in

        if params[:route][:route_number] == "" || params[:stop][:name] == "" || params[:stop][:adresse] == "" || params[:stop][:phone_number] == ""
          redirect 'edit/error'
        end

        @route = Route.find_or_create_by(params[:route])
        @stop = Stop.new(params[:stop])
        @route.stops << @stop
        @stop.user_id = session[:user_id]
        @stop.save
        redirect  "stops/#{@stop.id}"
    end

    get '/stops/:stop_id' do
        if !logged_in?
           redirect "/"
        end
        @stop = Stop.find(params[:stop_id])
        erb :'stops/show', :layout => false
    end

    get '/stops/:stop_id/edit' do
      if !logged_in?
        redirect "/"
      end 
      @stop = Stop.find(params[:stop_id])
      redirect_if_not_authorized
      erb :'stops/edit', :layout => false
    end


  patch "/stops/:id" do
    if !logged_in?
      redirect "/"
    end
    @stop = Stop.find(params[:id])
    redirect_if_not_authorized
    @stop.update(params[:stop])
    redirect "/stops/#{ @stop.id }"
  end

  delete "/stops/:id" do
    if !logged_in?
      redirect "/"
    end
    @stop = Stop.find(params[:id])
    redirect_if_not_authorized
    @stop.destroy
    redirect "/stops"
  end

  private

  def redirect_if_not_authorized
    if @stop.user != current_user
      redirect "/stops"
    end 
  end
  
end


# <label for="content">Route: </label>
# <input id="content" type="text" name="stop[route]"  value="<%= @stop.route.route_number %>"/><br><br><br>