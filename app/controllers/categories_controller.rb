class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:show]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @ad_square_right = @category.ads.active.nick('square_right').sample
    @ad_skyscrapers = @category.ads.active.nick('skyscraper').sample(2)

    @ad_square_right = @ad_square_right.nil? ? Ad.active.nick('square_right').sample : @ad_square_right
    @ad_skyscrapers = @ad_skyscrapers.empty? ? Ad.active.nick('skyscraper').sample(2) : @category.ads.active.nick('skyscraper').sample(2)

    @clinics = @category.clinics.rated #.page(params[:page]).per(12)
    @doctors = @category.doctors.rated #.page(params[:page]).per(12)
    @items = @clinics + @doctors

    @items = Kaminari.paginate_array(@items).page(params[:page]).per(12)
    render stream: true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params[:category]
  end
end
