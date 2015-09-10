require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""

# Storing name of Required Page in a variable.
best_director = "Academy Award for Directing"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
    
    # Extracting title to get to the required page.
    if href['title'].include? best_director
      
      # Extracting link.
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url

# Opening required page for extracting information.
data = Nokogiri::HTML(open(url))
page = Nokogiri::HTML(open(url))
s = ""
m = ""

# Storing number of nominations in a variable
num_of_nominations = 4

data.css("div#mw-content-text.mw-content-ltr
        table.multicol tr td ul li").each do |director|
  
  # Extracting number of nominations for each director
  num = 0;
  s = (/[(]\d[)]/.match(director.text)).to_s
  s = (/\d/.match(s)).to_s
  num = s.to_i
  
  # For directors having nominations equal or more than required
  # number of nominations, extracting film names from the table.
  if num >= num_of_nominations
    
    # Extracting and displaying director names
    if director.text.include? ("(#{num})")
      if(director.css("a"))
        puts ""
        puts director.css("a").text
        puts ""
        
         
        page.css("div#mw-content-text.mw-content-ltr
                table.wikitable tr").each do |movie|
          td = movie.css("td") 
          
          # Extracting and displaying movie names for winners
          if td[1] != nil && (td[1].text.include? director.css("a").text)
            
            puts "- " + td[1].css('i').text
           
           # Extracting and displaying movie names for winners
          elsif td[2] != nil && (td[2].text.include? director.css("a").text)
            d =  director.css("a").text
            m = ((/#{d}[ - ].*/).match(td[2].text)).to_s
            m = (/\W\s.*/).match(m).to_s
            puts m
          end
        end
      end
    end
  end
end

