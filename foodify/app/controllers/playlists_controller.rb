class PlaylistsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @playlists = @user.playlists
  end

  def new
    user = User.find(params[:user_id])
    if current_user == user
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
    user = User.find(params[:user_id])
    if current_user == user
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
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    redirect_to root_path
  end

  protected

  def playlist_params
    params.require(:playlist).permit(:name)
  end

end