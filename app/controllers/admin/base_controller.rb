class Admin::BaseController < ApplicationController

    #before_filter :authenticate_user!
  load_and_authorize_resource
    #before_filter :authenticate_admin_user!

  layout 'admin_layout'

  def current_ability
    @current_ability ||= AdminAbility.new(current_admin_user)
  end


end
