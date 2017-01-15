class SelectionsController < ApplicationController
  expose :selections, ->{ Selection.all }
  expose :selection
  def show
      # users = User.all
      # user = User.find(params[:user_id])
  end
  def create
    song = Song.find(params[:song_id])
    selection = Selection.where(song:song).find_by_user_id(current_user.id)
    if selection.nil?
      Selection.create(song:song, user:current_user, count:1)
    else
      selection.count += 1
      selection.save
    end
    redirect_to '/songs'
  end
end
