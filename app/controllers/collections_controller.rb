class CollectionsController < ApplicationController

  def index
    @collections = Collection.all
  end 

  def show
    @collection = Collection.find(params[:id])
  end

  def new 
    @collection = Collection.new 
  end 

  def create 
  end 
end
