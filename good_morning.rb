require 'sinatra'
require_relative 'holidays'
require_relative 'national_days'
require_relative 'bio'
require_relative 'weather'
require_relative 'home_alone'

get '/' do
  "Dobré ráno!"
end

get '/today' do
  content_type :json
  Holidays.new.today.merge(NationalDays.new.today).merge(bio: Bio.new.today).merge(Weather.new.today).merge(home_alone: HomeAlone.new.today).to_json
end
