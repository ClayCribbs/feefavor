class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :_ensure_current_user_is_admin

  private

  def _ensure_current_user_is_admin
    unless current_user.is_admin
      redirect_to root_url, notice: 'You do not have permission to access the requested page.'
    end
  end
end
