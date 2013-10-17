class AdvisesController < ApplicationController

  load_and_authorize_resource only: [:new, :create]

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'Для того,чтобы оставить рекомендацию, необходимо авторизоваться'
    redirect_to new_user_session_path
  end

  def new
    @advise = Advise.new
  end

  def create
    @advise = Advise.new(advise_params)
    @advise.user = current_user
    respond_to do |format|
      if @advise.save
        format.html { redirect_to root_url, notice: 'Рекомендация принята к рассмотрению.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def advise_params
    params.require(:advise).permit(:category_id, :last_name, :name, :full_name, :specialty, :city, :phone_number,
                                   :description, :idoctor, :iclinic, :pediatric, :choice)
  end
end
