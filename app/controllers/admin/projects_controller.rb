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
    if id Date.today > @project.finaldate
      d1 = @project.finaldate
    else
      d1 = Date.today
    end
    d2 = @project.created_at.to_date
    d3 = @project.finaldate
    d4 = (d1-d2).to_i
    d5 = (d3-d2).to_i
    @d6 = (d4*100)/d5
    @d7 = (d3-d1).to_i
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
    params.require(:project).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name, :finaldate)
  end
end
