require 'metainspector'

content = MetaInspector.new('https://github.com/sf-12/SiteStocker')
# puts url = site_url
puts title = content.best_title
puts image = content.images.best
# puts page = content.document
puts content.best_description