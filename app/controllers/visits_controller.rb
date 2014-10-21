class VisitsController < ApplicationController
  def create
    client  = Client.find params[:client_id]
    visitor = client.visitors.find params[:visitor_id]
    visitor.visits << Visit.new
    head :ok
  end
end