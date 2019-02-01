
class SessionsController < ApplicationController

  get "/login" do

    erb :"/sessions/login"
  end

  #flash[:notice] = "Your user name or password is incorrect, please try again."

  post "/login" do
    @customer = Customer.find_by_username_or_email(params[:username_email])
    if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id


      redirect :"/tools"

    else
      #binding.pry
      redirect "/login" #add falsh message
    end
  end

  get '/sessions/logout' do
    session.clear
    redirect "/"
  end

end #end of class
