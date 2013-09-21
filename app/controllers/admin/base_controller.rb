class Admin::BaseController < ApplicationController

  before_action :authenticate_admin_user!
  load_and_authorize_resource

  layout 'admin_layout'

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin_user)
  end

end
