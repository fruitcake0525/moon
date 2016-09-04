class Admin::DreamsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @dreams = Dream.all.order("id ASC").page(params[:page])
  end

  def show
    @dream = Dream.find(params[:id])
  end

end
