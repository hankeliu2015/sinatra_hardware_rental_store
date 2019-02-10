class ToolsController < ApplicationController

  #NEW
  get "/tools/new" do
    erb :"tools/new"
  end

  #POST
  post "/tools" do

    @customer = Customer.find(session[:customer_id]) # AR association Macro
    @tool = @customer.tools.create(params[:tool])

    # @tool = Tool.create(params[:tool])
    # @tool.customer_id = session[:customer_id]   #add session[:customer_id] as @tool.customer_id
    # @tool.save

    redirect "/tools/#{@tool.id}"
  end

  # SHOW
  get "/tools/:id" do

    @tool = Tool.find(params[:id])

    if @tool.customer_id == logged_in? #session customer_id the same as tool customer id
      #binding.pry
      erb :"/tools/show"
    else
    redirect "/customers/#{current_user.id}" #redirect back to customer's own home page
    end

  end

  #INDEX (only display where session[:customer_id] match tools foreign key)
  get "/tools" do
    if logged_in?               # use helper methos instead of session[:customer_id]
      @tools = Tool.all
      erb :"/tools/index"
    else
      redirect "/login"
    end
  end

  #EDIT
  get "/tools/:id/edit" do
    # validate user login.
    # Try AR associate Macro here.
    if logged_in?
      @tool = Tool.find(params[:id])
      erb :"/tools/edit"
    else
      redirect "/login"
    end
  end

  #PATCH
  patch "/tools/:id" do
    @tool = Tool.find(params[:id])
    @tool.update(params[:tool])
    redirect "/tools/#{@tool.id}"
  end

  #DELETE

  delete "/tools/:id" do
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect "/customers/#{current_user.id}"  # change from redirect "/tools" to show customer's home page.
  end



end #end of class
