class LandingpageController < ApplicationController
  def index
    @projects = Project.all
    @users = User.all
  end
end
