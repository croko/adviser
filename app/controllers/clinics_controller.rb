class ClinicsController < ApplicationController
  load_and_authorize_resource
  before_action :set_clinic, only: [:show, :edit, :update]
  before_action :set_banners, only: [:show, :edit]

  # GET /clinics/1
  # GET /clinics/1.json
  def show
    @comments = @clinic.comments.page(params[:page]).per(5)
    @comment = @clinic.comments.build if current_user
    @items = @clinic.doctors.published
  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new
  end

  # GET /clinics/1/edit
  def edit
  end

  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to @clinic, notice: t('clinics.messages.updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clinic
    @clinic = Clinic.published.find(params[:id])
  end

  def set_banners
    @ad_square_right = @clinic.ads.active.nick('square_right').sample
    @ad_skyscrapers = @clinic.ads.active.nick('skyscraper').sample(2)

    @ad_square_right = @ad_square_right.nil? ? Ad.active.nick('square_right').sample : @ad_square_right
    @ad_skyscrapers = @ad_skyscrapers.empty? ? Ad.active.nick('skyscraper').sample(2) : @ad_skyscrapers
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clinic_params
    params.require(:clinic).permit(:full_name, :description, :user_id, :starting_work, :awards,
                                   :visit_home, :price, :specialty, :pediatric,
                                   clinic_category_relations_attributes: [:id, :category_id, :clinic_id, :_destroy],
                                   photos_attributes: [:id, :image, :image_file_name, :_destroy, :filename],
                                   addresses_attributes: [:id, :address_1, :address_2, :city, :state, :zip_code,
                                                          :website_url, :email, :district, :phone_number, :mobile_phone_number])
  end
end
