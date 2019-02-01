require 'rack-flash'
class SessionsController < ApplicationController
  use Rack::Flash

  get "/login" do

    erb :"/sessions/login"
  end


  post "/login" do
    @customer = Customer.find_by_username_or_email(params[:username_or_email]) #method in Customer class
    if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id

      redirect :"/customers/#{@customer.id}"

    else
      flash[:message] = "Your user name or password is incorrect, please try again."
      redirect "/login" #add falsh message
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect "/"
  end

end #end of class
