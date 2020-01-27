class BreweriesController < ApplicationController

  def index

    if params[:near_search]
      @near_search_parameters = params[:near_search].downcase
      response = HTTParty.get('https://sandbox-api.brewerydb.com/v2/locations/?key=409ef177366ff1a3e706e1ce3d0032fb')
      locations = response["data"]
      @near_search_results = locations.find_all { |location| location['locality'].downcase == "#{@near_search_parameters}"}

      if @near_search_results.any?
        @location_coordinates = []
        @near_search_results.each do |location|
          @location_coordinates.append([location['latitude'], location['longitude']])
        end
      else
        @words = 'Could not find a brewery in that town.'
      end
    end
  end

  def show

    @organization = HTTParty.get('https://sandbox-api.brewerydb.com/v2/brewery/' + params[:id].split('_').first + '/?key=409ef177366ff1a3e706e1ce3d0032fb')
    @breweries = HTTParty.get('https://sandbox-api.brewerydb.com/v2/brewery/' + params[:id].split('_').first + '/locations/?key=409ef177366ff1a3e706e1ce3d0032fb')
    @beers = HTTParty.get('https://sandbox-api.brewerydb.com/v2/brewery/' + params[:id].split('_').first + '/beers/?key=409ef177366ff1a3e706e1ce3d0032fb')
    @beer_ids = HTTParty.get('https://sandbox-api.brewerydb.com/v2/beers/?key=409ef177366ff1a3e706e1ce3d0032fb')


  end

  def search
    locations_response = HTTParty.get('https://sandbox-api.brewerydb.com/v2/locations/?key=409ef177366ff1a3e706e1ce3d0032fb')
    beers_response = HTTParty.get('https://sandbox-api.brewerydb.com/v2/beers/?key=409ef177366ff1a3e706e1ce3d0032fb')
    locations = locations_response['data']

    if params[:search]
      @parameter = params[:search].downcase
      @results_brewery = locations.find_all{ |location| location['brewery']['name'].downcase.include? "#{@parameter}"}

    end

    if params[:hidden_search]
      @parameter = params[:hidden_search].downcase
      @results_brewery = locations.find_all{ |location| location['brewery']['name'].downcase.include? "#{@parameter}"}

    end
  end
end
