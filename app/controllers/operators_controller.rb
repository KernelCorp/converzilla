class OperatorsController < ApplicationController
  before_filter :authenticate_user!, except: :create
  load_and_authorize_resource through: :current_user
  respond_to :json


  def index
    respond_with @operators
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
    respond_with @operator
  end

  # POST /operators
  # POST /operators.json
  def create
    @operator.password = Devise.friendly_token.first(8)
    if @operator.save
      flash[:notice] = 'Operator was successfully created.'
      respond_with @operator, status: :created, location: @operator
    else
      respond_with @operator, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    if @operator.update operator_params
      flash[:notice] = 'Operator was successfully updated.'
      respond_with @operator, status: :updated
    else
      respond_with @operator, status: :unprocessable_entity
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    @operator.destroy
    head :no_content
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit :email
    end
end
