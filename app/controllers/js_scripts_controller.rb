class JsScriptsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json

  def show
    if current_user.is_a? Client
      @script = current_user.script
      render json: {js_script: {data: raw(@script)}}
    else
      head status: :unprocessable_entity
    end
  end
end