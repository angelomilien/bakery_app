class SessionController < ApplicationController
    
  get '/' do
    erb :welcome
  end
end