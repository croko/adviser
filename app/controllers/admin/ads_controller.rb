class Admin::AdsController < Admin::BaseController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /admin/ads
  # GET /admin/ads.json
  def index
    @ads = Ad.all
  end

  # GET /admin/ads/1
  # GET /admin/ads/1.json
  def show
  end

  # GET /admin/ads/new
  def new
    @ad = Ad.new(page_id: params[:page_id])
  end

  # GET /admin/ads/1/edit
  def edit
  end

  # POST /admin/ads
  # POST /admin/ads.json
  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to [:admin, @ad], notice: 'Ad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ad }
      else
        format.html { render action: 'new' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ads/1
  # PATCH/PUT /admin/ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to [:admin, @ad], notice: 'Ad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ads/1
  # DELETE /admin/ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to admin_ads_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ad
    @ad = Ad.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ad_params
    params.require(:ad).permit(:name, :announce, :body, :page_id, :image, :image_file_name,
                                    :category_id, :doctor_id, :clinic_id, :filename, :published,
                                    :sort_order, :date_start, :date_end, :baseurl)
  end
end
