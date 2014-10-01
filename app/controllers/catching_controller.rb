class CatchingController < ApplicationController
  def show
    @client_id = params[:client_id]
    render layout: false
  end

  def like

  end
end
