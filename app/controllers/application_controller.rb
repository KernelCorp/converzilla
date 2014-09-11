class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def safe_sending_message(chanel, event, message)
    websocket = const_defined?('WebsocketRails') ? const_get('WebsocketRails') : nil
    websocket[chanel].trigger event, message unless websocket.nil?
  end
end
