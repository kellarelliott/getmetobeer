class Brewerydb < ActiveRecord::Base
  def self.get_breweries(city)
  end

  def self.get_brewery_id
    response = HTTParty.get('https://sandbox-api.brewerydb.com/v2/breweries/?key=409ef177366ff1a3e706e1ce3d0032fb')
    breweries = response["data"]
    id = breweries.map do |brewery|
        i = Id.new
        i.api_id = brewery["id"]
        i.save
        i
    end

  end
end
