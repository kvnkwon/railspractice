class HomesController < ApplicationController

  def index
  end

  def search
    location = params[:location]
    parameters = { term: params[:term], limit: 5 }
    yelp_search = Yelp.client.search(location, parameters)
    @results = yelp_search.businesses
  end

end