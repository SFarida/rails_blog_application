class ApplicationController < ActionController::Base
  def current_user
    @default_user = User.first
  end
end
