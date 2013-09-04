class Admin::DoctorsController < Admin::BaseController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @q = Doctor.search(params[:q])
    @doctors = @q.result.page(params[:page]).per(25)
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    if params[:advise_id].present?
      advise = Advise.find(params[:advise_id])
      @doctor = advise.build_doctor(
          last_name: advise.last_name,
          first_name: advise.name,
          specialty: advise.specialty,
          description: advise.description,
          pediatric: advise.pediatric
      )
      @doctor.categories << Category.find(advise.category_id)
      @doctor.addresses.build(
          city: advise.city,
          phone_number: advise.phone_number)
    else
      @doctor = Doctor.new
    end
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to [:admin, @doctor], notice: 'Doctor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doctor }
      else
        format.html { render action: 'new' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to [:admin, @doctor], notice: 'Doctor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to admin_doctors_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def doctor_params
    params[:doctor].permit(:id, :first_name, :description, :user_id, :published, :last_name,
                           :education, :starting_work, :high_school_name, :high_school_finished, :awards,
                           :visit_home, :price, :rating, :specialty, :pediatric, :gender, :advise_id,
                           doctor_category_relations_attributes: [:id, :category_id, :clinic_id, :_destroy],
                           photos_attributes: [:id, :image, :image_file_name, :_destroy, :filename],
                           addresses_attributes: [:id, :address_1, :address_2, :city, :state, :zip_code,
                                                  :website_url, :email, :district, :phone_number, :mobile_phone_number])
  end
end
