class DreamsController < ApplicationController
  def new
    if session[:dream_id].present?
      @dream = Dream.find_by(id: session[:dream_id])
    else
      @dream = Dream.new
    end
  end

  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      if !current_user
        session[:dream_id] = @dream.id
        redirect_to new_user_session_path
      else
        @project = current_user.projects.new
        @project.mastergoal = @dream.mastergoal
        @project.secondgoal = @dream.secondgoal
        @project.success = @dream.success
        @project.can = @dream.can
        @project.how = @dream.how
        @project.when = @dream.when
        @project.owner_name = @dream.owner_name
        @project.save
        @dream.destroy
        session[:dream_id] = nil
        redirect_to project_path(@project)
      end
    else
      render :new
    end
  end

  def update
    @dream = Dream.find(params[:id])

    if @dream.update
      if !current_user
        session[:dream_id] = @dream.id
        redirect_to new_user_session_path
      else
        @project = current_user.projects.new
        @project.mastergoal = @dream.mastergoal
        @project.secondgoal = @dream.secondgoal
        @project.success = @dream.success
        @project.can = @dream.can
        @project.how = @dream.how
        @project.when = @dream.when
        @project.owner_name = @dream.owner_name
        @project.save
        @dream.destroy
        session[:dream_id] = nil
        redirect_to project_path(@project)
      end
    else
      render :new
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name)
  end

end
