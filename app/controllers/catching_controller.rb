class CatchingController < ApplicationController
  def show
    @client_id = params[:id]
    response.headers.delete('X-Frame-Options')
    render layout: false
  end
end
