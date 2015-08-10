class ItemsController < ApplicationController

  def new
    user = User.find(params[:user_id])
    if current_user == user
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    @playlist = Playlist.find(params[:playlist_id])
    @item.playlist = @playlist

    # Yelp's search results
    # location = params[:location]
    # parameters = { term: params[:term], limit: 5 }
    # yelp_search = Yelp.client.search(location, parameters)
    # @results = yelp_search.businesses

    if @item.save
      redirect_to controller: "playlists", action: "show", id: @playlist.id
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def item_params
    params.require(:item).permit(:name)
  end

end