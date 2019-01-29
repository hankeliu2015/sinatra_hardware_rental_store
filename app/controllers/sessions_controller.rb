
class SessionsController < ApplicationController

  get "/login" do

    erb :"/sessions/login"
  end

  post "/login" do
    @customer = Customer.find_by_username_or_email(params[:username_email])
    if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id

            #binding.pry
      redirect :"/tools"

    else
      # flash.now[:error] = "Your user name or password is incorrect, please try again."
      redirect "/login" #add falsh message
    end
  end



end #end of class
