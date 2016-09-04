class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all.order("created_at DESC").page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
    if Date.today - @project.finaldate > 0
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

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name, :finaldate)
  end
end
