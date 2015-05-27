class MoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :update, :destroy]

  def index
    @moods = current_user.moods.all.order("created_at DESC")
  end

  def show
    @mood = Mood.find(params[:id])
  end

  def new
    @mood = current_user.moods.build
  end

  def create
    @mood = current_user.moods.build(mood_params)
    if @mood.save
      redirect_to @mood
    else
      render 'new'
    end
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def update
    @mood = Mood.find(params[:id])
    if @mood.update(mood_params)
      redirect_to @mood
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    
  def mood_params
    params.require(:mood).permit(:energy, :happiness, :motivation, :love, :smoke, :drink, :awake, :notes, :special)
  end

  def correct_user
    @mood = Mood.find(params[:id])
    @user = User.find(@mood.user_id)
    redirect_to root_url unless current_user == @user
  end

end
