class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all.order("created_at DESC").page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @progress1 = Date.today
    @progress2 = @project.created_at.to_date
    @progress3 = @project.finaldate
    @progress4 = (@progress1-@progress2).to_i
    @progress5 = (@progress3-@progress2).to_i
    @progress6 = (@progress4*200)/@progress5
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
