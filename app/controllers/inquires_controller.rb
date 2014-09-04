class InquiresController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource through: :current_host

  respond_to :json

  def index
    respond_with @inquires
  end


  def show
  end


  def new
    respond_with @inquire
  end


  def edit
    respond_with @inquire
  end

  def create
    if @inquire.save
      flash[:notice] = 'Inquire was successfully created.'
      respond_with @inquire, status: :created, location: @inquire
    else
      respond_with @inquire.errors, status: :unprocessable_entity
    end
  end


  def update
    if @inquire.update(inquire_params)
      flash[:notice] = 'Inquire was successfully updated.'
      respond_with @inquire, status: :updated, location: @inquire
    else
      respond_with @inquire.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @inquire.destroy
    head :no_content
  end

  private
    def current_host
      current_user.is_a?(User::Client) ? current_user : current_user.client
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquire_params
      params[:inquire]
    end
end
