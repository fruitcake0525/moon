class ProjectsController < ApplicationController
  def index
    render 'projects/index'
  end

  def new
    render 'projects/new'
  end
end
