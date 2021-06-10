class LakewoodStopsController < ApplicationController

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops' do
        if !logged_in?
            redirect "/"
        end
        @route = Route.find_or_create_by(params[:route])
        @stop = Stop.create(params[:stop])
        @route.stops << @stop
        current_user.stops << @stop
        erb :'users/show', :layout => false
    end

    get '/index/:stop' do
        if !logged_in?
           redirect "/"
        end
        @user = current_user
        @stop = Stop.find(params[:stop])
        erb :'stops/show', :layout => false
    end

    get '/edit/stop/:stop_id' do
        erb :'stops/edit'
    end


  patch "/edit/:id" do
    # @article = Article.find(params[:id])
    # params[:article]
    # @article.update(params[:article])
    # redirect to "/articles/#{ @article.id }"
    "hello"
  end

#   delete "/articles/:id" do
#     Article.destroy(params[:id])
#     redirect to "/articles"
#   end
end