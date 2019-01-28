class ToolsController < ApplicationController

  #NEW
  get "/tools/new" do
    erb :"tools/new"
  end

  #POST
  post "/tools" do
    @tool = Tool.create(params[:tool])
    redirect "/tools/#{@tool.id}"
  end

  # SHOW
  get "/tools/:id" do
    @tool = Tool.find(params[:id])
    erb :"/tools/show"
  end

  #INDEX
  get "/tools" do
    @tools = Tool.all
    erb :"/tools/index"

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
