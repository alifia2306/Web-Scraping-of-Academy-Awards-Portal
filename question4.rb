require 'nokogiri'
require 'open-uri'

# Main url.
url_main = "http://en.wikipedia.org/wiki/Portal:Academy_Award"
url = ""
url_movie = ""

# Storing name of Required Page in a variable.
best_actress = "Academy Award for Best Actress"

# Storing year in a variable.
year = "2006"
next_column = ""
count = 0
date = ""

# Opening main url for extracting required page.
data_main = Nokogiri::HTML(open(url_main))
data_main.css("table tr td div div table
              tr td a").each do |href|
  
  # Preventing nil values.
  if(href['title'] != nil)
    
    # Extracting title to get to the required page.
    if href['title'].include? best_actress
      
      # Extracting link.
      url = href['href']
    end
  end
end

# Appending link to get complete url.
url = "http://en.wikipedia.org" + url

# Opening required page for extracting information.
data = Nokogiri::HTML(open(url))
movie = data.css("table.wikitable tr")

# Extracting the table data for each row.
for i in 0..movie.length - 1
  columns = movie[i].css("td")
  
  # Columns having length one have year entries.
  if (columns[0] != nil and columns.length == 1)
    if (columns[0].text.include? year) 
      
      # Extracting the next column for Actress Information.
      next_column = movie[i+1..i+5].css("td")
    end
  end
end
 
next_column.each do |element|
  
  # For actress name count is zero.
  if count == 0
    print "Actress: " 
    
    # Displaying Actress name.
    puts element.text
    
    # Accessing actress url and opening page for each actress.
    url_actress = element.css("a")[0]["href"]
    url_actress = "http://en.wikipedia.org" + url_actress
    page_actress = Nokogiri::HTML(open(url_actress))
    page_actress.css("table.infobox.biography.vcard
                    tr").each do |actress|
                    
      # Accessing actress birth year from infobox.
      category = actress.css("th")
      if category.text == "Born"
        date = actress.css("td")
        birth_date = (/\d{4}/).match(date.text).to_s
        birth_date = birth_date.to_i
        print "Age: "
        
        # Finding actress age and Displaying .
        puts year.to_i - birth_date
      end
    end  
  end
   
  count = count + 1
  
  # For film name count is two.
  if count == 2
    
    # Displaying film name
    puts "Film: " + element.text
    puts ""
  end
  
  # Resetting Count to zero for next actress.
  if count == 3
    count = 0
  end
   
end
