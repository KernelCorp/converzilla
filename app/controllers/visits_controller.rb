class VisitsController < ApplicationController
  protect_from_forgery except: :create
  def create
    client  = Client.find params[:client_id]
    visitor = client.visitors.find params[:visitor_id]
    ip_address = request.try(:remote_ip)
    visitor.visits << Visit.new(ip_address: ip_address)
    head :ok
  end
end