class ConnectionsController < ApplicationController

  def edit
    @connection = Connection.find(params[:id])
    @engines = Engine.all
  end

  def update
    connection = Connection.find(params[:id])
    connection.update(connection_params)
    redirect_to engine_path(connection.engineName)
  end

  private

    def connection_params
      params.require(:connection).permit(:engineName, :exchange, :ip, :port)
    end
  end
