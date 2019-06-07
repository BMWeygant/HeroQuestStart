class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    @experience.user_id = current_user.id
      if @experience.save
        redirect_to user_experiences_path(current_user)
      else
        render 'new'
      end
  end

  def show
    @experience = Experience.find(params[:id])
    @heros = Hero.all.order("created_at ASC")
    @experience.adventures.build
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :xp, :hp_rating, :treasure_rating, :user_id)
  end
end
