class MoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :update, :destroy]

  def index
    
    @moods = current_user.moods.all.order("created_at DESC")
    # array of mood data. dry this up. logic should probably not be here
    @moods.each do |mood|
      time        = mood.created_at.to_i*1000
      happiness   = mood.happiness
      energy      = mood.energy
      motivation  = mood.motivation
      love        = mood.love
      
      datum_happiness ||= []
      datum_happiness = [time,happiness]
      @data_happiness ||= []
      @data_happiness.push(datum_happiness)

      datum_energy ||= []
      datum_energy = [time,energy]
      @data_energy ||= []
      @data_energy.push(datum_energy)

      datum_motivation ||= []
      datum_motivation = [time,motivation]
      @data_motivation ||= []
      @data_motivation.push(datum_motivation)

      datum_love ||= []
      datum_love = [time,love]
      @data_love ||= []
      @data_love.push(datum_love)


    end


=begin
      @happiness ||= []
      @happiness.push(mood.happiness)
      @times ||= []
      @times.push(mood.created_at.utc)
    end
=end

   
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
      redirect_to root_path
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
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to root_path
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
