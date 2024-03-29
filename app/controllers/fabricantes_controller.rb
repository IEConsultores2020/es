class FabricantesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource


  # GET /fabricantes
  # GET /fabricantes.json
  def index
    @fabricantes = Fabricante.all
  end

  # GET /fabricantes/1
  # GET /fabricantes/1.json
  def show
  end

  # GET /fabricantes/new
  def new

  end

  # GET /fabricantes/1/edit
  def edit
  end

  # POST /fabricantes
  # POST /fabricantes.json
  def create

    @fabricante.user_id = current_user.id
    respond_to do |format|
      if @fabricante.save
        format.html { redirect_to @fabricante, notice: 'Fabricante was successfully created.' }
        format.json { render :show, status: :created, location: @fabricante }
      else
        format.html { render :new }
        format.json { render json: @fabricante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fabricantes/1
  # PATCH/PUT /fabricantes/1.json
  def update
    respond_to do |format|
      if @fabricante.update(fabricante_params)
        format.html { redirect_to @fabricante, notice: 'Fabricante was successfully updated.' }
        format.json { render :show, status: :ok, location: @fabricante }
      else
        format.html { render :edit }
        format.json { render json: @fabricante.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # DELETE /fabricantes/1
  # DELETE /fabricantes/1.json
  def destroy
    @fabricante.destroy
    respond_to do |format|
      format.html { redirect_to fabricantes_url, notice: 'Fabricante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fabricante_params
      params.require(:fabricante).permit(:nombre, :user_id)
    end
end
