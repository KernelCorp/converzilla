class InquiresController < ApplicationController
  include Host

  before_action :authenticate_user!, except: :create
  protect_from_forgery except: :create
  load_and_authorize_resource through: :current_host, except: [:create, :new]
  respond_to :json

  def new
    @client = Client.find params[:client_id]
    render layout: false
  end

  def index
    respond_with @inquires
  end


  def show
  end

  def create
    return head(status: :unprocessable_entity) if params[:client_id].blank?
    @client = Client.find params[:client_id]
    @inquire = @client.inquires.build outside_inquire_params
    @inquire.set_timestamp
    if @client.save
      flash[:notice] = 'Inquire was successfully created.'
      WebsocketRails[@client.id.to_s].trigger :new_inquire, render_to_string('inquires/show', formats: [:json])
      respond_with @inquire, status: :created, location: @inquire
    else
      respond_with @inquire, status: :unprocessable_entity
    end
  end


  def update
    if @inquire.update(inquire_params)
      flash[:notice] = 'Inquire was successfully updated.'
      WebsocketRails[@client.id.to_s].trigger :new_inquire, render_to_string('inquires/show', formats: [:json])
      respond_with @inquire, status: :updated, location: @inquire
    else
      respond_with @inquire.errors, status: :unprocessable_entity
    end
  end


  def destroy
    current_host.inquires.delete @inquire
    head :no_content
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquire_params
      params.require(:inquire).permit :status
    end

    def outside_inquire_params
      params.require(:inquire).permit(:email, :name, :phone).tap do |whitelisted|
        whitelisted[:vk_user_info] = params.require(:inquire).slice(:vk_user_info).permit![:vk_user_info]
      end
     #params.require(:inquire).permit(:email, :name, :phone, vk_user_info: [:last_name])
    end
end
