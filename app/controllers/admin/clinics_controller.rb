class Admin::ClinicsController < Admin::BaseController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  # GET /clinics
  # GET /clinics.json
  def index
    @q = Clinic.search(params[:q])
    @clinics = @q.result.page(params[:page]).per(25)
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
  end

  # GET /clinics/new
  def new
    if params[:advise_id].present?
      advise = Advise.find(params[:advise_id])
      @clinic = advise.build_clinic(
          full_name: advise.full_name,
          specialty: advise.specialty,
          description: advise.description,
          pediatric: advise.pediatric
      )
      @clinic.categories << Category.find(advise.category_id)
      @clinic.addresses.build(
          city: advise.city,
          phone_number: advise.phone_number)
    else
      @clinic = Clinic.new
    end
  end

  # GET /clinics/1/edit
  def edit
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(clinic_params)

    respond_to do |format|
      if @clinic.save!
        format.html { redirect_to [:admin, @clinic], notice: 'Clinic was successfully created.' }
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
        format.html { redirect_to [:admin, @clinic], notice: 'Clinic was successfully updated.' }
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
      format.html { redirect_to admin_clinics_url }
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
    params.require(:clinic).permit(:id, :full_name, :description, :user_id, :published,
                                   :starting_work, :awards, :advise_id,
                                   :visit_home, :price, :rating, :specialty, :pediatric,
                                   clinic_category_relations_attributes: [:id, :category_id, :clinic_id, :_destroy],
                                   photos_attributes: [:id, :image, :image_file_name, :_destroy, :filename],
                                   addresses_attributes: [:id, :address_1, :address_2, :city, :state, :zip_code,
                                                          :website_url, :email, :district, :phone_number,
                                                          :mobile_phone_number, :_destroy])
  end
end
