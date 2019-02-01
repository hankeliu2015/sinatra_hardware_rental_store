class ToolsController < ApplicationController

  #NEW
  get "/tools/new" do
    erb :"tools/new"
  end

  #POST
  post "/tools" do
    @tool = Tool.create(params[:tool])
    #add session[:customer_id] as @tool.customer_id
    @tool.customer_id = session[:customer_id]
    @tool.save
    redirect "/tools/#{@tool.id}"
  end

  # SHOW
  get "/tools/:id" do
    @tool = Tool.find(params[:id])
    erb :"/tools/show"
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
    @tool = Tool.find(params[:id])
    erb :"/tools/edit"
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
    redirect "/tools"
  end



end #end of class
