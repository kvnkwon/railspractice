class PlaylistsController < ApplicationController

  def new
    if current_user
      @playlist = Playlist.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      render :show
    else
      render :new
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @items = @playlist.items
  end

  def edit
    if current_user
      @playlist = Playlist.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
  end

  protected

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end