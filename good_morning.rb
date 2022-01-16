require 'sinatra'
require_relative 'holidays'
require_relative 'national_days'
require_relative 'bio'

get '/' do
  "Dobré ráno!"
end

get '/today' do
  content_type :json
  Holidays.new.today.merge(NationalDays.new.today).merge(bio: Bio.new.today).to_json
end
