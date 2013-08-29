class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :js

  #TODO
  #workaround for CanCan not ready for Rails 4
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  #####
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
    if current_admin_user
      admin_users_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || new_advise_path || root_path
    end
  end

  def main
    page_nick = Page.nick('index')
    @top = page_nick.contents.nick('top').body rescue nil
    @left_column = page_nick.contents.nick('left_column').body rescue nil
    @center_column = page_nick.contents.nick('center_column').body rescue nil
    @right_column = page_nick.contents.nick('right_column').body rescue nil
    @ad_squares = page_nick.ads.active.nick('square').sample(3)
    @ad_square_right = page_nick.ads.active.nick('square_right').sample
    @ad_skyscrapers = page_nick.ads.active.nick('skyscraper').sample(2)

    @doctors = Doctor.rated.page(params[:page]).limit(12)
    @clinics = Clinic.rated.page(params[:page]).limit(12)
    @items = @clinics + @doctors
    @items = Kaminari.paginate_array(@items).page(params[:page]).per(24)
    render stream: true
  end

  def results
    if params[:search].present?
      @query = params[:search][:query]
      @location = params[:search][:location]
      if @location.present?
        _c = Geocoder.coordinates(@location)
        if (location_query = (Geocoder.coordinates(@location) rescue nil)).present?
          params[:search][:location] = location_query
          #geocode_log.debug("search #{@location} - #{location_query}")
        else
          params[:search][:location] = [0, 0]
        end
      end

      options = {}

      if params[:children] == '1'
        options.merge!(:children => 'true')
      end
      if params[:adult] == '1'
        options.merge!(:adult => 'true')
      end

      if params['clinic'] == '1'
        ids = Clinic.elasticsearch(params[:search], options).collect(&:id)
        @items = Kaminari.paginate_array(Clinic.rated.where(id: ids)).page(params[:page]).per(12)
      elsif params['doctor'] == '1'
        ids = Doctor.elasticsearch(params[:search], options).collect(&:id)
        @items = Kaminari.paginate_array(Doctor.rated.where(id: ids)).page(params[:page]).per(12)
      else
        ids_cli = Clinic.elasticsearch(params[:search], options).collect(&:id)
        @clinics = Clinic.rated.where(id: ids_cli)
        ids_doc = Doctor.elasticsearch(params[:search], options).collect(&:id)
        @doctors = Doctor.rated.where(id: ids_doc)
        @items = Kaminari.paginate_array(@clinics + @doctors).page(params[:page]).per(16)
      end

    else
      @items = Clinic.rated.page(params[:page]).per(16)
    end
  end
end
