class ApplicationController < ActionController::Base
  include Pundit

  add_flash_types :success, :info, :warning, :danger
end
