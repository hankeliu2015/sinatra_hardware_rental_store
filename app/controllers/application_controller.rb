require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "project2"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      session[:customer_id]
    end
  end

end
