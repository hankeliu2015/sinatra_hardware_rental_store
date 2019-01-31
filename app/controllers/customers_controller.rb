class CustomerController < ApplicationController
  #NEW
  get "/customers/new" do
    erb :"customers/new"
  end

  #POST
  post "/customers" do
    @customer = Tool.create(params[:customer])
    redirect "/customers/#{@customer.id}"
  end

  # SHOW
  get "/customers/:id" do
    @customer = Customer.find(params[:id])
    erb :"/customers/show"
  end

  #INDEX
  get "/customers" do
    if logged_in?               # use helper methos instead of session[:customer_id]
      @customers = Customer.all
      erb :"/customers/index"
    else
      redirect "/login"
    end
  end

  #EDIT
  get "/customers/:id/edit" do
    @customer = Customer.find(params[:id])
    erb :"/customers/edit"
  end

  #PATCH
  patch "/customers/:id" do
    @customer = Customer.find(params[:id])
    @customer.update(params[:customer])
    redirect "/customers/#{@customer.id}"
  end

  #DELETE

  delete "/customers/:id" do
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect "/customers"
  end
end