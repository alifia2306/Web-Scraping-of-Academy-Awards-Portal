require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""
list_of_actors = []

# Storing name of Required Page in a variable.
best_actor = "Academy Award for Best Actor"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
   
    # Extracting title to get to the required page.
    if href['title'].include? best_actor
      
      # Extracting link.
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url

# Opening required page for extracting information.
data = Nokogiri::HTML(open(url))

# Storing role in a variable.
role = "King"
data.css("div#mw-content-text.mw-content-ltr
        table.wikitable tr").each do |movie|

  td = movie.css("td")
  if td[2] != nil
    if td[2].text.include? role
    
      # Storing writer names in a list if table
      # data includes role.
      list_of_actors.push(td[0].text)
    end
  end
end

# Displaying list of actors with role.
puts "Actors:"
puts ""
puts list_of_actors.uniq