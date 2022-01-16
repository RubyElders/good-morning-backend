require 'net/http'
require 'nokogiri'

class Bio

  PRAGUE = 'https://www.meteocentrum.cz/predpoved-pocasi/bio-ovzdusi/6250/praha'

  def today
    bio.first&.text
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

  def bio
    parsed_html.css('#snippet--days .ico--bio_lg')
  end
end
