class UsersController < ApplicationController
  include Host

  before_action :authenticate_user!
  def show
    @host = current_host
    @user = current_user
  end
end
