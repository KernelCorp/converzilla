class VisitorsController < ApplicationController
  include Host

  before_action :authenticate_user!, except: [:create]

  protect_from_forgery except: :create
  load_and_authorize_resource through: :current_host, except: [:create]
  respond_to :json

  def index
    respond_with @visitors
  end


  def show
  end

  def create
    return head(status: :unprocessable_entity) if params[:client_id].blank?
    @client = Client.find params[:client_id]
    @visitor = @client.visitors.build outside_visitor_params
    if @visitor.save
      flash[:notice] = 'Inquire was successfully created.'
      #WebsocketRails[@client.id.to_s].trigger :new_visitor, render_to_string('visitors/show', formats: [:json])
      respond_with @visitor, status: :created, location: @visitor
    else
      respond_with @visitor, status: :unprocessable_entity
    end
  end

  def destroy
    current_host.visitors.delete @visitor
    head :no_content
  end

  private

    def outside_visitor_params
      params.require(:visitor).permit(:email, :name, :phone).tap do |whitelisted|
        whitelisted[:vk_user_info] = params.require(:visitor).slice(:vk_user_info).permit![:vk_user_info]
      end
     #params.require(:visitor).permit(:email, :name, :phone, vk_user_info: [:last_name])
    end

end
