class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to '/songs'
    else
      flash[:danger] = "Oops something went wrong"
      redirect_to '/songs'
    end
  end

  def show
    @song = Song.find(params[:id])
    @songs = Song.all
    @users = User.all
  end

  private
  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
