class ClientsController < ApplicationController
  before_action :authenticate_user!
  def show
    @client = current_user
  end
end
