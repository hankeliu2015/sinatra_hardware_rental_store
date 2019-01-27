class ToolsController < ApplicationController

# SHOW

get "/tools/:id" do
  @tool = Tool.find(params[:id])
  erb :"/tools/show"
end



end #end of class
