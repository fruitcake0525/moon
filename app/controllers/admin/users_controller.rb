class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all.order("id ASC").page(params[:page])
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @user = User.find(params[:id])
    @user.to_normal

    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

end
