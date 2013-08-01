class Admin::BaseController < ApplicationController
  #TODO
  #workaround for CanCan not ready for Rails 4
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  #####
  layout 'admin_layout'
  load_and_authorize_resource

end
