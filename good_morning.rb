require 'sinatra'
require_relative 'holidays'

get '/' do
  "Dobré ráno!"
end

get '/today' do
  content_type :json
  Holidays.new.today.to_json
end
