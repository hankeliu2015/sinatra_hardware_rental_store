class ToolsController < ApplicationController

#NEW
get "/tools/new" do
  erb :"tools/new"
end

#POST
post "/tools" do
  @tool = Tool.new(params[:tool])
  redirect "/tools/:id"
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





end #end of class
