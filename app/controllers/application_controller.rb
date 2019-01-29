require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "project2"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      session[:customer_id]
    end

    def current_user
      @customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
    end
  end

end
