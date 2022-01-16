require 'sinatra'
require_relative 'holidays'
require_relative 'national_days'

get '/' do
  "Dobré ráno!"
end

get '/today' do
  content_type :json
  Holidays.new.today.merge(NationalDays.new.today).to_json
end
