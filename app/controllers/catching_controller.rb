class CatchingController < ApplicationController
  def show
    @client_id = params[:id]
    render layout: false
  end

  def like

  end
end
