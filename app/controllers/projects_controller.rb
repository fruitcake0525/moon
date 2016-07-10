class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    if current_user.is_admin?
      @project = Project.find(params[:id])

      if @project.update(project_params)
        redirect_to admin_project_path(@project)
      else
        render :edit
      end
    else
      @project = current_user.projects.find(params[:id])

      if @project.update(project_params)
        redirect_to project_path(@project)
      else
        render :edit
      end
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name)
  end
end
