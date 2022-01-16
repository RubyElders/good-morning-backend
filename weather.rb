require 'net/http'
require 'nokogiri'

class Weather

  PRAGUE = 'https://www.meteocentrum.cz/predpoved-pocasi/cz/6250/praha'

  def today
    {
      temp_min: temperatures.last,
      temp_max: temperatures.first
    }
  end

  private

  def html
    uri = URI.parse(PRAGUE)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parsed_html
    Nokogiri::HTML(html)
  end

  def temperatures
    weather.split('/').map(&:strip).map { |t| t.tr('°', '') }
  end

  def weather
    @weather ||= parsed_html.css('#snippet--days .tabs__temp').first.text
  end
end
