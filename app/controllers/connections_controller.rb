class ConnectionsController < ApplicationController

  def edit
    @connection = Connection.find(params[:id])
  end

  def update
    connection = Connection.find(params[:id])
    connection.update(connection_params)
    redirect_to engine_path(connection.engineName)
  end

  private

    def connection_params
      params.require(:connection).permit(:exchange, :ip, :port)
    end
  end
