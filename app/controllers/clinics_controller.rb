class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  # GET /clinics
  # GET /clinics.json
  def index
    @clinics = Clinic.all
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: 'Clinic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @clinic }
      else
        format.html { render action: 'new' }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to @clinic, notice: 'Clinic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to clinics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:name, :description, :status, :user_id, :published, :rating, :likes_count)
    end
end
