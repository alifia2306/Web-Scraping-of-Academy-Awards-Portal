require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"

# Storing name of Required Page in a variable.
list_of_films = "List of films receiving six or more Academy Awards"
url = ""

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
max = 0
num = 0
list = []
data_main.css("table tr td div div table tr td a").each do |href|

  # Preventing nil values.
  if(href['title'] != nil)
    
     # Extracting title to get to the required page.
    if href['title'].include? list_of_films
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url
data = Nokogiri::HTML(open(url))

# Extracting number of awards for each movie
data.css("div#mw-content-text.mw-content-ltr
        table.wikitable.sortable tr").each do |movie|

  td = movie.css("td")

  #Finding the maximum number of awards overall
  if td[2] != nil
    num = td[2].text.to_i
    if num > max
      max = num
    end
  end
  
end
print "Maximum Number of Awards: "
puts max
puts ""

#Extracting table information again
data.css("div#mw-content-text.mw-content-ltr
        table.wikitable.sortable tr").each do |movie|

  td = movie.css("td")
  
  #Searching for movies with the number of awards equal
  #to the maximum and pushing them into a list.
  if td[2] != nil
    num = td[2].text.to_i
    if (num == max)
      s = td[0].css('a')
      list.push(s.text).to_s
    end
  end  
end

#Displaying list of movies with maximum number of awards.
puts "Movies: "
puts list.uniq