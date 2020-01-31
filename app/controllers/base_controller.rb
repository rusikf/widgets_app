class BaseController < ApplicationController
  helper_method :resource_name, :resource, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
end
