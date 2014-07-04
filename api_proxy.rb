require 'sinatra'
require 'sinatra/jsonp'
require 'json'
require 'rest_client'
require 'nokogiri'

BASE_URI = "http://www.strava.com/athletes/"

class SummaryParser
  attr_reader :table

  def initialize(table)
    @table = table
  end

  def to_hash
    { sport: sport,
      distance: distance,
      time: time,
      elevation: elevation,
      activities: activities }
  end

  def sport
    table.css('th').first.text.strip
  end

  def distance
    begin
      table.css('td')[0].text.strip
    rescue
      ''
    end
  end

  def time
    begin
      table.css('td')[1].text.strip
    rescue
      ''
    end
  end

  def elevation
    begin
      table.css('td')[2].text.strip
    rescue
      ''
    end
  end

  def activities
    begin
      table.css('td')[3].text.strip
    rescue
      ''
    end
  end
end

get "/:athlete_id" do
  content_type 'application/json', charset: 'utf-8'
  raw_response = RestClient.get(BASE_URI + params[:athlete_id])
  page = Nokogiri::HTML(raw_response)
  response = {}

  # Current month
  distance, time, elevation =
    page.css('#activity-totals').css('strong').map(&:text).map(&:strip)

  response[:current] = {
    distance: distance,
    time: time,
    elevation: elevation
  }

  # Year to date
  response[:year] =
    SummaryParser.new(page.css('.athlete-records > .spans8').first).to_hash
  response[:all] =
    SummaryParser.new(page.css('.athlete-records > .spans8').last).to_hash

  JSONP(response, params[:callback])
end
