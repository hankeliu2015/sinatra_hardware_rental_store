class CustomerController < ApplicationController
  #NEW
  get "/customers/new" do
    erb :"customers/new"
  end

  #POST -- customer registrations
  post "/customers" do
    @customer = Customer.create(params[:customer])

    if @customer.valid?
      session[:id] = @customer.id
      redirect "/customers/#{@customer.id}"
    else
      @error_message = @customer.errors.full_messages.join(" and ")
                #binding.pry
      erb :"/customers/new"
    end
  end

  # SHOW
  get "/customers/:id" do
    #need a condition here: id == session[customer_id] to secure the customer access.
    @customer = Customer.find(params[:id])
    if session[:customer_id] == @customer.id
      @tools = @customer.tools
      erb :"/customers/show"
    else
      redirect "/login"
    end
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
