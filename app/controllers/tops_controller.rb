class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  layout 'age50'

  def index
    @tops = Top.all
  end

  def show
  end

  def new
    @top = current_user.tops.build
  end

  def edit
  end

  def create
    @top = current_user.tops.build(top_params)
    if @video.save!
      redirect_to @top, notice: 'top was successfully created.'
    else
      render :new
    end
  end

  def update
    if @top.update(top_params)
      redirect_to @top, notice: 'top was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @top.destroy
    redirect_to tops_url, notice: 'top was successfully destroyed.'
  end

  private
  def set_top
    @top = Top.friendly.find(params[:id])
  end

  def top_params
    params.require(:top).permit(:name, :description, :category, :user_id, :occupation, :age)
  end

  def correct_user
    unless @top.user_id == current_user.id
      redirect_to tops_path, notice: "Not authorized to edit this top"
      #you must return false to halt
      false
    end
  end
end
