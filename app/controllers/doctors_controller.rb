class DoctorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_doctor, only: [:show, :edit, :update]
  before_action :set_banners, only: [:show, :edit]

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    @comments = @doctor.comments.page(params[:page]).per(5)
    @comment = @doctor.comments.build if current_user
  end

  # GET /doctors/1/edit
  def edit
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: t('clinics.messages.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def set_banners
    @ad_square_right = @doctor.ads.active.nick('square_right').sample
    @ad_skyscrapers = @doctor.ads.active.nick('skyscraper').sample(2)

    @ad_square_right = @ad_square_right.nil? ? Ad.active.nick('square_right').sample : @ad_square_right
    @ad_skyscrapers = @ad_skyscrapers.empty? ? Ad.active.nick('skyscraper').sample(2) : @ad_skyscrapers
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def doctor_params
    params[:doctor].permit(:first_name, :description, :last_name,
                           :education, :starting_work, :high_school_name, :high_school_finished, :awards,
                           :visit_home, :price, :rating, :specialty, :pediatric, :gender,
                           doctor_category_relations_attributes: [:id, :category_id, :clinic_id, :_destroy],
                           photos_attributes: [:id, :image, :image_file_name, :_destroy, :filename],
                           addresses_attributes: [:id, :address_1, :address_2, :city, :state, :zip_code,
                                                  :website_url, :email, :district])
  end
end
