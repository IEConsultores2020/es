class ModelosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /modelos
  # GET /modelos.json
  def index
    @modelos = Modelo.where(user_id: current_user.id).order("nombre ASC")
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
  end

  # GET /modelos/new
  def new
  end

  # GET /modelos/1/edit
  def edit
  end

  # POST /modelos
  # POST /modelos.json
  def create    
    @modelo.user_id = current_user.id
    respond_to do |format|
      if @modelo.save
        format.html { redirect_to @modelo, notice: 'Modelo was successfully created.' }
        format.json { render :show, status: :created, location: @modelo }
      else
        format.html { render :new }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    respond_to do |format|
      if @modelo.update(modelo_params)
        format.html { redirect_to @modelo, notice: 'Modelo was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelo }
      else
        format.html { render :edit }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    @modelo.destroy
    respond_to do |format|
      format.html { redirect_to modelos_url, notice: 'Modelo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:codigo, :nombre, :descripcion, :user_id)
    end
end

