class AdminUsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin_users
  # GET /admin_users.json
  def index
    @admin_users = AdminUser.all
  end

  # GET /admin_users/1
  # GET /admin_users/1.json
  def show
  end

  # GET /admin_users/new
  def new
    @admin_user = AdminUser.new
  end

  # GET /admin_users/1/edit
  def edit
  end

  # POST /admin_users
  # POST /admin_users.json
  def create
    @admin_user = AdminUser.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to [:admin, @admin_user], notice: 'Admin user was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /admin_users/1
  # PATCH/PUT /admin_users/1.json
  def update
    if params[:admin_user][:password].blank?
      params[:admin_user].delete("password")
      params[:admin_user].delete("password_confirmation")
    end

    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to [:admin, @admin_user], notice: 'Admin user was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_admin_users_url }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_user
    @admin_user = AdminUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_user_params
    params[:admin_user].permit(:name, :last_name, :email, :password, :password_confirmation, :role_id)
  end
end
