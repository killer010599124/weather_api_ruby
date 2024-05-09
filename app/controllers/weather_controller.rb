require 'net/http'

class WeatherController < ApplicationController
  def index
    api_key = '3C8TRCWYPKSPU83H6U8CJ5CUR'
    location = params[:location]

    puts location

    url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/#{location}?unitGroup=us&key=#{api_key}&contentType=json"

    puts url

    uri = URI(url)
    response = Net::HTTP.get(uri)
    weather_data = JSON.parse(response)
    puts weather_data
    render 'index', locals: { weatherData: weather_data }
  end
end
