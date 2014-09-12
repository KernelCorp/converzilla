class UsersController < ApplicationController
  include Host
  before_action :authenticate_user!, expect: :form
  def show
    @host = current_host
    @user = current_user
  end

end
