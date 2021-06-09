class LakewoodStopsController < ApplicationController

    get "/stops/new" do
        erb :'stops/new', layout: false
    end

    post '/stops/new' do
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
        erb :'users/show', :layout => false
    end

    get '/edit/:user_id/:stop_id' do
        "hello"
    end


#   patch "/articles/:id" do
#     @article = Article.find(params[:id])
#     params[:article]
#     @article.update(params[:article])
#     redirect to "/articles/#{ @article.id }"
#   end

#   delete "/articles/:id" do
#     Article.destroy(params[:id])
#     redirect to "/articles"
#   end
end