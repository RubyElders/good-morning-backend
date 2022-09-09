require 'open-uri'
require 'nokogiri'

class HomeAlone

  TV = 'https://www.ceskatelevize.cz'
  TV_TODAY = TV + '/tv-program/'

  def today
    find_topics rescue '' # freestyle
  end

  private

  def find_topics
    date = Date.today.strftime('%d.%m.%Y')
    tv_today = URI.open(TV_TODAY + date + '/').read
    tv_today_html = Nokogiri::HTML(tv_today)

    link = tv_today_html.css('a').find {|el| el.text == 'Sama doma'}
    return '' if link.nil?

    today = URI.open(TV + link.attributes['href'].value).read
    today_html = Nokogiri::HTML(today)
    description_el = today_html.css('div[class^=description] p').first
    return '' if description_el.nil?

    description_el.text
  end
end
