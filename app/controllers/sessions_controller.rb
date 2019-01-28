class SessionsController < ApplicationController

  get "/login" do

    erb :"/sessions/login"
  end

  post "/login" do
    @customer = Customer.find_by(username: params[:username])
    if @customer && @customer.authenticate(params[:password])
      session[:customer_id] = @customer.id

            #binding.pry
      redirect :"/tools"

    else
      redirect "/login"
    end
  end



end #end of class
