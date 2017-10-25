require 'open-uri'
require 'nokogiri'

cities  = ['dallas','seattle']
search_terms = ['web+developer','full+stack']

cities.each do |city|
    search_terms.each do |search_term|
        
        url = "https://#{city}.craigslist.org/search/cpg?query=#{search_term}&is_paid=all"

        document = open(url)
        content = document.read
        parsed_content = Nokogiri::HTML(content)


        puts '===================================='
        puts '-                                  -'
        puts "       #{city} #{search_term}       "
        puts '-                                  -'
        puts "===================================="

        parsed_content.css('.result-row').each do |row|
            title = row.css('.hdrlnk').inner_text
            posted_at = row.css('time').first.attributes["datetime"].value
            neigh_elem = row.css('.result-hood')#.try(.first.inner_text.strip)

            if neigh_elem.any?
                neighborhood = neigh_elem.first.inner_text.strip
            else
                neighborhood = ''
            end

            puts "#{title} #{neighborhood}"
            # puts "Posted at #{posted_at}"
            puts '------------------------'
        end
    end
end
