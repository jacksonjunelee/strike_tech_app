class EnginesController < ApplicationController

  def index
    @engines = Engine.includes(:users, :connections)
  end

  def show
    engine = Engine.find(params[:id])
    @connections = engine.connections
  end
end
