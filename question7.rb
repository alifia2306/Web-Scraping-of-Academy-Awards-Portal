require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""
url_movie = ""

# Storing name of Required Page in a variable.
best_animated_feature = "Academy Award for Best Animated Feature"
name = "Tom Hanks"
list = []

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
    
    # Extracting title to get to the required page.
    if href['title'].include? best_animated_feature
      url = href['href']
    end
  end
end

# Appending links to get complete url.
url = "http://en.wikipedia.org" + url
data = Nokogiri::HTML(open(url))

# Extracting movie names from table.wikitable
data.css("div#mw-content-text.mw-content-ltr
        table.wikitable tr td").each do |movie|
 
  td = movie.css("i a")
  # Searching for winning films
  if td[0] != nil
    
    # Extracting movie page from able row
    url_movie = "http://en.wikipedia.org" + td[0]['href']
   
    data_movie = Nokogiri::HTML(open(url_movie))
    
    #Opening movie page and searching for Tom Hanks in Starring header
    data_movie.css("table.infobox.vevent tr").each do |stars|
      category = stars.css("th")
      if category.text == "Starring"
        star = stars.css("td div ul li a")
        
        #If tom hanks is starring the movie , it is added to the list
        if star.text.include? name
          list.push(td[0].text)
        end
      end
    end
   
  end
  
   # Searching for nominated films
  if td[1] != nil
    
    # Extracting movie page from able row
    url_movie = "http://en.wikipedia.org" + td[0]['href']
   
   #Opening movie page and searching for Tom Hanks in Starring header
    data_movie = Nokogiri::HTML(open(url_movie))
    data_movie.css("table.infobox.vevent tr").each do |stars|
      category = stars.css("th")
      if category.text == "Starring"
        star = stars.css("td div ul li a")
        
        #If tom hanks is starring the movie , it is added to the list
        if star.text.include? name
          list.push(td[1].text)
        end
      end
    end
  end
end

# displaying list without repitation.
puts list.uniq