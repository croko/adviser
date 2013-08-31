class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :set_banners, only: [:show, :edit]
  load_and_authorize_resource

  def show
    @doctors = current_user.doctors
    @clinics = current_user.clinics
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: t('users.messages.updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params[:user].permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
