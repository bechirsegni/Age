class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = current_user.videos.build
  end

  def edit
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save!
      redirect_to @video, notice: 'video was successfully created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Post was successfully destroyed.'
  end

  private
  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :description, :url, :user_id, :category_id, :thumb)
  end

  def correct_user
    unless @video.user_id == current_user.id
      redirect_to videos_path, notice: "Not authorized to edit this video"
      #you must return false to halt
      false
    end
  end
end
