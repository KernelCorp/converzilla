class VisitorsController < ApplicationController
  def create
    client  = Client.find params[:client_id]
    visitor = client.visitors.find params[:visitor]
    visitor.visits << Visit.new
    head :ok
  end
end