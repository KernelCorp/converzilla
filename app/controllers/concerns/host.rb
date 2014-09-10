module Host
  include ActiveSupport::Concern

  def current_host
    current_user.is_a?(Client) ? current_user : current_user.client
  end

end