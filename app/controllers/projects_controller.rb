class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    if session[:dream_id].present?
      @dream = Dream.find_by(id: session[:dream_id])
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      @dream = Dream.find_by(id: session[:dream_id])
      @dream.destroy
      session[:dream_id] = nil
      redirect_to project_path(@project)
    else
      render :new
    end
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
    params.require(:project).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name)
  end
end
