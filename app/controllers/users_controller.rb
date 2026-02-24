class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :ensure_owner

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_owner
    redirect_to root_path, alert: "Accès non autorisé" unless @user == current_user
  end
end
