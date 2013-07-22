class LikesController < ApplicationController
  before_action :set_likeable

  def create
    like = @likeable.likes.build
    like.user = current_user
    like.save
    @likes = @likeable.likes_count
    respond_to :js
  end

  private
  def set_likeable
    if params[:doctor_id]
      @likeable = Doctor.find(params[:doctor_id])
    elsif params[:clinic_id]
      @likeable = Clinic.find(params[:clinic_id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to(:back, alert: 'Ничего не найдено')
  end

end
