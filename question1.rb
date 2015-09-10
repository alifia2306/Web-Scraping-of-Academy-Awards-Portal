require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""

# Storing name of Required Page in a variable.
best_Picture = "Academy Award for Best Picture"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
    
    # Extracting title to get to the required page.
    if href['title'].include? best_Picture
      
      # Extracting link.
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url

# Opening required page for extracting information.
data = Nokogiri::HTML(open(url))

# Storing name of Production Company in a variable.
production_company = "Disney"
data.css("div#mw-content-text.mw-content-ltr
        table.wikitable tr").each do |movie|
 
  td = movie.css("td")
  if td[1] != nil
    
    # Displaying film name if table data includes production company.
    if td[1].text.include? production_company
      puts td[0].text
    end
  end
end