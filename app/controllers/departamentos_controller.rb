class DepartamentosController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def import
    Departamento.import(params[:file])
    redirect_to departamentos_url, notice: "Departamentos importados."
  end

  # GET /departamentos
  # GET /departamentos.json
  def index
    @departamentos = Departamento.all
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
  end

  # GET /departamentos/new
  def new

  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos
  # POST /departamentos.json
  def create

    @departamento.user_id = current_user.id
    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'Departamento was successfully created.' }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to @departamento, notice: 'Departamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'Departamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def departamento_params
      params.require(:departamento).permit(:name, :pais_id, :user_id)
    end
end
