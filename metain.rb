
  require 'nokogiri'
  require 'open-uri'

  site_url = "https://qiita.com/iiyama_makoto/items/940b130fd20540fd70f1"

  html = URI.open(site_url).read

  doc = Nokogiri::HTML.parse(html)
puts  ogp_image = doc.css('//meta[property="og:image"]/@content')
# puts ogp_title = doc.title
puts ogp_title = doc.css('html').text.strip.gsub(/[\r\n]/,"")