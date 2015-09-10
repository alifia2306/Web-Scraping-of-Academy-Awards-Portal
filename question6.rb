require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""
url2 = ""
url1 = ""

# Storing name of Required Page in a variable.
best_foreign_language_film_list = "List of Academy Award winners and nominees for Best Foreign Language Film"
list_of_countries = "List of countries by number of Academy Awards for Best Foreign Language Film"
best_foreign_language = "Academy Award for Best Foreign Language Film"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
    
     # Extracting title to get to the required page.
    if href['title'].include? best_foreign_language_film_list
      
      # Extracting link.
      url2 = href['href']
    end
  end

  # Preventing nil values.
  if(href['title'] != nil)
    if href['title'].include? best_foreign_language
      url1 = href['href']
    end
  end
end

# Appending links to get complete url.
url2 = "http://en.wikipedia.org" + url2
url1 = "http://en.wikipedia.org" + url1

# Opening url
data1 = Nokogiri::HTML(open(url1))

data1.css("div a").each do |href|
  
  if(href['title'] != nil)
    if href['title'].include? list_of_countries
      url = href['href']
    end
  end
end
url = "http://en.wikipedia.org" + url

# Opening url2 using url1.
data = Nokogiri::HTML(open(url))
data2 = Nokogiri::HTML(open(url2))
countries = ""
num_string = "";
num_intermediate = 0;
num = 0;

# Extracting data from table and finding the country with maximum number of awards.
data.css("div#mw-content-text.mw-content-ltr table.wikitable.sortable tr").each do |country|
  td = country.css("td")
  if(td[2] != nil)
    num_string = (/\d+/.match(td[2].text)).to_s
    num_intermediate = num_string.to_i
    
    #Finding maximum number.
    if num < num_intermediate
      num = num_intermediate
      
      #Storing country name.
      countries = td[0].text
    end
  end
end
countries = (/\w+/).match(countries).to_s

#Displaying country name.
puts countries
puts ""

#Extracting films for country.
data2.css("div#mw-content-text.mw-content-ltr table.sortable.wikitable tr").each do |films|
  td = films.css("td")
  if(td[3] != nil)
    if td[3].text.include? countries
      puts td[1].text
    end
  end
end