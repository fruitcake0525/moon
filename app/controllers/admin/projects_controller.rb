class Admin::ProjectsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @projects = Project.all.order("id ASC").page(params[:page])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to admin_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path
  end

  private

  def project_params
    params.require(:project).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name)
  end
end
