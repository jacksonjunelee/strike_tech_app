class EnginesController < ApplicationController

  def index
    @engines = Engine.includes(:users, :connections)
  end

  def show
    engine = Engine.find(params[:id])
    @connections = engine.connections
  end

  def edit
    @engine = Engine.find(params[:id])
  end

  def update
    engine = Engine.find(params[:id])
    engine.update(engine_params)
    redirect_to engines_path
  end

private

  def engine_params
    params.require(:engine).permit(:lastRun)
  end
end
