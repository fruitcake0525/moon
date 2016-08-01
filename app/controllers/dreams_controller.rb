class DreamsController < ApplicationController
  def new
    if session[:dream_id].present?
      @dream = Dream.find_by(id: session[:dream_id])
    else
      @dream = Dream.new
    end
    @project = Project.new
  end

  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      session[:dream_id] = @dream.id
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:mastergoal, :secondgoal, :success, :can, :how, :when, :owner_name)
  end
end
