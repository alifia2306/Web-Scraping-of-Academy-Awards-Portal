require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""

# Storing name of Required Page in a variable.
best_screenplay = "Academy Award for Writing Original Screenplay"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
   
    # Extracting title to get to the required page.
    if href['title'].include? best_screenplay
      
      # Extracting link.
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url

# Opening required page for extracting information.
data = Nokogiri::HTML(open(url))

# Storing name of ƒilm title in a variable.
film = "Divorce, Italian Style"
data.css("div#mw-content-text.mw-content-ltr 
        table.wikitable tr").each do |writer|

  td = writer.css("td")

  if td[0] != nil
  
    # Displaying writer names if table data includes film.
    if td[0].text.include? film
      puts td[1].text
    end
  end
end