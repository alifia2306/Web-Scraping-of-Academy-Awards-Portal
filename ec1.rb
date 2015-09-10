require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url_picture = ""
flag = 0
list_picture = []
list_picture_winner = []
url_actor = ""
list_actor = []
list_actor_winner = []
url_actress = ""
list_actress = []
list_actress_winner = []
url_director = ""
list_director = []
list_director_winner = []
list_film = []
hash_movies = Hash.new()

# Storing name of Best Picture Page in a variable.
bestPicture = "Academy Award for Best Picture"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  if(href['title'] != nil)
    if href['title'].include? bestPicture
      url_picture = href['href']
    end
  end
end

# Appending link to get complete url.
url_picture = "http://en.wikipedia.org" + url_picture

# Opening main url for picture.
data = Nokogiri::HTML(open(url_picture))
data.css("div#mw-content-text.mw-content-ltr table.wikitable tr").each do |movie|

  td = movie.css("td")
  # Extracting movie links for Best Picture Category
  if td.length == 3
    
    #Adding winning movie links to winning list and nominees list
    if flag == 1    
      list_picture_winner.push(movie.css("td a")[0]["href"])
      list_picture.push(movie.css("td a")[0]["href"])
      hash_movies[movie.css("td a")[0]["href"]] = movie.css("td")[0].text
      flag = 0
         
    #Adding rest of the movie links to nominees list
    else    
      list_picture.push(movie.css("td a")[0]["href"])
      hash_movies[movie.css("td a")[0]["href"]] = movie.css("td")[0].text
    end
   
  elsif movie.css("td").length == 0
    flag = 1
  end
  
end
flag = 0

# Storing name of Best Actor Page in a variable.
bestActor = "Academy Award for Best Actor"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  if(href['title'] != nil)
    if href['title'].include? bestActor
      url_actor = href['href']
    end
  end
end

# Appending link to get complete url.
url_actor = "http://en.wikipedia.org" + url_actor

# Opening main url for actor.
data = Nokogiri::HTML(open(url_actor))
data.css("div#mw-content-text.mw-content-ltr table.wikitable tr").each do |movie|
  
  # Extracting movie links for Best Actor Category
  if movie.css("td").length == 4
    movie.css("td")[1].css('a').each do |k|
      
      #Adding winning movie links to winning list and nominees list
      list_actor_winner.push(k['href'])
      list_actor.push(k['href'])
    end
    
    #Adding the rest to nominees list
  elsif movie.css("td").length == 3
    movie.css("td")[1].css('a').each do |j|
      list_actor.push(j['href'])
    end
  end
  
  
end
flag = 0
# Storing name of Best Actress Page in a variable.
bestActress = "Academy Award for Best Actress"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  if(href['title'] != nil)
    if href['title'].include? bestActress
      url_actress = href['href']
    end
  end
end

# Appending link to get complete url.
url_actress = "http://en.wikipedia.org" + url_actress

# Opening main url for actress.
data = Nokogiri::HTML(open(url_actress))
data.css("div#mw-content-text.mw-content-ltr table.wikitable tr").each do |movie|

   # Extracting movie links for Best Actress Category
  if movie.css("td a").length == 4
    movie.css("td")[1].css('a').each do |k|
      
      #Adding winning movie links to winning list and nominees list
      list_actress_winner.push(k['href'])
      list_actress.push(k['href'])
    end
  end
  if movie.css("td").length == 3
    
    #Adding the rest to nominees list
    movie.css("td")[1].css('a').each do |j|
      list_actress.push(j['href'])
    end
  end
end
flag = 0

# Storing name of Best Director Page in a variable.
bestDirector = "Academy Award for Directing"

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table tr td a").each do |href|
  if(href['title'] != nil)
    if href['title'].include? bestDirector
      url_director = href['href']
    end
  end
end

# Appending link to get complete url.
url_director = "http://en.wikipedia.org" + url_director

# Opening main url for director.
data = Nokogiri::HTML(open(url_director))
data.css("div#mw-content-text.mw-content-ltr table.wikitable tr").each do |movie|

  td = movie.css("td")
   # Extracting movie links for Best Director Category
  if td[1] != nil
    movie.css("td")[1].css('a').each do |k|
      
      #Adding winning movie links to winning list and nominees list
      list_director.push(k['href'])
      list_director_winner.push(k['href'])
    end
  end
  
  if td[2] != nil
    movie.css("td")[2].css('a').each do |k|
      #Adding the rest to nominees list
      list_director.push(k['href'])
    end
  end
end

#Taking intersection of the four lists and removing duplicate elements
list_of_big_four_repeat = list_picture & list_actor & list_director & list_actress
list_of_big_four = list_of_big_four_repeat.uniq

#For each film checking if the film is in the big four winner lists
list_of_big_four.each do |film|
  count = 0
  puts hash_movies[film]
  if list_picture_winner.include? film
    count = count + 1
  end
  if list_actor_winner.include? film
    count = count + 1
  end
  if list_actress_winner.include? film
    count = count + 1
  end
  if list_director_winner.include? film
    count = count + 1
  end
  
  #Printing number of awards for each
  print "Number of awards: "
  puts count 
  puts ""
end