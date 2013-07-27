class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_commentable, only: [:create]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.rating = 0 if @comment.rating.nil?
    @comment.user_id = current_user.id
    @comment.save

    redirect_to @commentable
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_commentable
    if params[:doctor_id]
      @commentable = Doctor.find(params[:doctor_id])
    elsif params[:clinic_id]
      @commentable = Clinic.find(params[:clinic_id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params[:comment].permit(:message, :rating)
  end
end
