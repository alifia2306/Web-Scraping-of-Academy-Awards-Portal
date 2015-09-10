I have mainly used Nokogiri gem and css selectors for web scraping. Additionally at some places, I have also used regular expressions along with them. I have written separate files for all questions. I have named them question-wise from questions 1 to 8 and named them ec1.rb and ec2.rb for the two extra credit parts. I have stored names of pages and fields to search for as variables to make the code more generic.

1.) question1.rb

My algorithm includes opening the academy portal, storing the page title for ‘Best Picture’ in a variable on line 9 and the production company name in a variable on line 34, opening the main page , extracting the link of ‘Best Picture’ page from the table data and opening the required page. After opening the ‘Best Picture’ page, I search for production company in column 1 in the table.wikitable data for to each row. After finding a match, I display the corresponding movie names from column 0 of the same row.

output: Mary Poppins
	Beauty and the Beast
	Up
	Toy Story 3


2.) question2.rb

My algorithm includes opening the academy portal, storing the page title for ‘Best Screenplay’ in a variable on line 9 and the film name in a variable on line 34, opening the main page , extracting the link of ‘Best Screenplay’ page from the table data and opening the required page. After opening the ‘Best Screenplay’ page, I search for film in column 0 in the table.wikitable data for each row. After finding a match, I display the corresponding writer names from column 1 of the same row.

output: Ennio de Concini
	Pietro Germi
	Alfredo Giannetti

3.) question3.rb

My algorithm includes opening the academy portal, storing the page title for ‘Best Leading Actor’ in a variable on line 10 and the role in a variable on line 35, opening the main page , extracting the link of ‘Best Leading Actor’ page from the table data and opening the required page. After opening the ‘Best Leading Actor’ page, I search for the role in column 2 in the table.wikitable data for each row. After finding a match, I store corresponding actor names from column 0 of the same row into a list. Finally, I display the list removing any duplicate actor names.

output- 

Actors:

Charles Laughton
Laurence Olivier
Yul Brynner
Peter O'Toole
Richard Burton
Kenneth Branagh
Nigel Hawthorne
Colin Firth
George Clooney


4.) question4.rb

My algorithm includes opening the academy portal, storing the page title for ‘Best Leading Actress’ in a variable on line 10 and year on line 13, extracting the link of ‘Best Leading Actress’ page from the table data and opening the required page. After opening the ‘Best Leading Actress’ page, I extract table data for each row, find the row with year header equal to the required year,extract the next column containing actress information, go to the appropriate column and display actress name. Then I extract actress page link and find age from the info box table for each actress and display it. Next I display the movie from the appropriate column in the ‘Best Leading Actress’ page table.

output-

Actress: Helen Mirren
Age: 61
Film: The Queen

Actress: Penélope Cruz
Age: 32
Film: Volver

Actress: Judi Dench
Age: 72
Film: Notes on a Scandal

Actress: Meryl Streep
Age: 57
Film: The Devil Wears Prada

Actress: Kate Winslet
Age: 31
Film: Little Children

5.) question5.rb

My algorithm includes opening the academy portal, storing the page title for ‘Academy Award for Directing’ in a variable on line 9 , and number of nominations on line 37, extracting the link of ‘Academy Award for Directing’ page from the table data and opening the required page. After opening the ‘Academy Award for Directing’ page, I extract table.multicol data for each row, find the number of nominations for each director. If it is greater than number of nominations , I print director name and I go to the table.wikitable and print all movies for that director.

output-

John Ford

- The Informer
– Stagecoach
- The Grapes of Wrath
- How Green Was My Valley
- The Quiet Man

Frank Capra

– Lady for a Day
- It Happened One Night
- Mr. Deeds Goes to Town
- You Can't Take It With You
– Mr. Smith Goes to Washington
– It's a Wonderful Life

Billy Wilder

– Double Indemnity
- The Lost Weekend
– Sunset Boulevard
– Stalag 17
– Sabrina
– Witness for the Prosecution
– Some Like It Hot
- The Apartment

David Lean

– Brief Encounter
– Great Expectations
– Summertime
- The Bridge on the River Kwai
- Lawrence of Arabia
– Doctor Zhivago
– A Passage to India

Steven Spielberg

– Close Encounters of the Third Kind
– Raiders of the Lost Ark
– E.T. the Extra-Terrestrial
- Schindler's List
- Saving Private Ryan
– Munich
– Lincoln

Fred Zinnemann

– The Search
– High Noon
- From Here to Eternity
– The Nun's Story
– The Sundowners
- A Man for All Seasons
– Julia

Elia Kazan

- Gentleman's Agreement
– A Streetcar Named Desire
- On the Waterfront
– East of Eden
– America, America

George Stevens

– The More the Merrier
- A Place in the Sun
– Shane
- Giant
– The Diary of Anne Frank

Clint Eastwood

- Unforgiven
– Mystic River
- Million Dollar Baby
– Letters from Iwo Jima

Frank Lloyd

- The Divine Lady
- Cavalcade
– Mutiny on the Bounty

Joseph L. Mankiewicz

- A Letter to Three Wives
- All About Eve
. Mankiewicz – 5 Fingers
. Mankiewicz – Sleuth

Martin Scorsese

– Raging Bull
– The Last Temptation of Christ
– Goodfellas
– Gangs of New York
– The Aviator
- The Departed
– Hugo
– The Wolf of Wall Street

Woody Allen

- Annie Hall
– Interiors
– Broadway Danny Rose
– Hannah and Her Sisters
– Crimes and Misdemeanors
– Bullets over Broadway
– Midnight in Paris

George Cukor

– Little Women
– The Philadelphia Story
– A Double Life
– Born Yesterday
- My Fair Lady

Michael Curtiz


– Angels with Dirty Faces
– Yankee Doodle Dandy
- Casablanca

John Huston

- The Treasure of the Sierra Madre
– The Asphalt Jungle
– The African Queen
– Moulin Rouge
– Prizzi's Honor

Francis Ford Coppola

– The Godfather
- The Godfather Part II
– Apocalypse Now
– The Godfather Part III

Mike Nichols

– Who's Afraid of Virginia Woolf?
- The Graduate
– Silkwood
– Working Girl

Robert Altman

– MASH
– Nashville
– The Player
– Short Cuts
– Gosford Park

Clarence Brown

– Anna Christie and Romance
– A Free Soul
– The Human Comedy
– National Velvet
– The Yearling

Alfred Hitchcock

– Rebecca
– Lifeboat
– Spellbound
– Rear Window
– Psycho

King Vidor

– The Crowd
– Hallelujah
– The Champ
– The Citadel
– War and Peace

Federico Fellini

– La Dolce Vita
– 8½
– Satyricon
– Amarcord

Stanley Kubrick

– Dr. Strangelove
– 2001: A Space Odyssey
– A Clockwork Orange
– Barry Lyndon

Sidney Lumet

– 12 Angry Men
– Dog Day Afternoon
– Network
– The Verdict

Peter Weir

– Witness
– Dead Poets Society
– The Truman Show
– Master and Commander: The Far Side of the World

6.) question6.rb

My algorithm includes opening the academy portal, storing the page titles in a variables on line 11,line12 and line13, extracting the links of ‘List of Academy Award winners and nominees for Best Foreign Language Film’ page and "Academy Awards for Best Foreign Language Film" page from the table data and opening the required pages. Further I extract "List of countries by number of Academy Awards for Best Foreign Language Film" page from "Academy Awards for Best Foreign Language Film”. After opening it, I extract table.wikitable.sortable data for each row, find the the country with maximum number of awards. Then I go to the ‘List of Academy Award winners and nominees for Best Foreign Language Film’ page and extract the movies for that country.

output-

France

Monsieur Vincent [D]
The Walls of Malapaga [F]
Forbidden Games [H]
Gervaise [K]
Gates of Paris
My Uncle
Black Orpheus
La Vérité
Sundays and Cybele
The Umbrellas of Cherbourg
A Man and a Woman
Live for Life
Stolen Kisses
My Night with Maud [L]
Hoa-Binh
The Discreet Charm of the Bourgeoisie
Day for Night
Lacombe, Lucien
Cousin, Cousine
Madame Rosa
Get Out Your Handkerchiefs
A Simple Story
The Last Metro
Coup de Torchon ('Clean Slate')
Entre Nous
Three Men and a Cradle
Betty Blue
Au Revoir Les Enfants (Goodbye, Children)
Camille Claudel
Cyrano de Bergerac
Indochine
Ridicule
East-West
The Taste of Others
Amélie
The Chorus
Joyeux Noël
The Class
A Prophet

7.) question7.rb

My algorithm includes opening the academy portal, storing the page title in a variable on line 10 and actor name on line 11, extracting the links of ‘Academy Award for Best Animated Feature’ page from the table data and opening the required page. It then extracts movies from the table.wikitable for winners first and then nominees and opens the corresponding pages in it. It then goes to the info box table on those pages and searches for the actor in the Starring header and if it matches then the movie is added to the list.

output-
Toy Story 3

8.) List the actor who has won the maximum awards in Best Leading Actor Category.
question8.rb

My algorithm includes opening the academy portal, storing the page title in a variable on line 8 , extracting the link of ‘List of actors who have appeared in multiple Best Picture Academy Award winners’ page from the table data and opening the required page. It then extracts number of awards for each actor from the table.wikitable.sortable and finds the maximum number of awards overall. Then it searches for actors with the number of awards and returns it.

output-

Actor: Franklyn Farnum

Extra Credit 1.) 
ec1.rb

My algorithm includes opening the academy portal, storing the required page titles for best picture, best actor, best actress and best director in variables on lines 22,67,106,145 , extracting the link for these pages from the table data and opening them. Then I extract a list of movie links for nominated pictures and winning pictures for all four categories. I also create a hash table for storing the movie names, corresponding to those links. The reason for using links here instead of names is that there are formatting differences in movie names for the same movie on different pages. However the links are unique for the movies. Then I make a list having intersection of these lists and remove repeated elements. For all elements in the list, I print them and search them in the winner lists and count their appearances and display them.

output-

Cimarron
Number of awards: 1

It Happened One Night [I]
Number of awards: 3

A Star Is Born
Number of awards: 0

Gone with the Wind
Number of awards: 2

Goodbye, Mr. Chips
Number of awards: 1

Rebecca
Number of awards: 1

The Philadelphia Story
Number of awards: 1

Mrs. Miniver
Number of awards: 2

The Bells of St. Mary's
Number of awards: 0

The Yearling
Number of awards: 0

Gentleman's Agreement
Number of awards: 2

Johnny Belinda
Number of awards: 0

Sunset Boulevard
Number of awards: 0

A Place in the Sun
Number of awards: 1

A Streetcar Named Desire
Number of awards: 0

From Here to Eternity
Number of awards: 2

The Country Girl
Number of awards: 0

The King and I
Number of awards: 1

Cat on a Hot Tin Roof
Number of awards: 0

Room at the Top
Number of awards: 0

The Apartment
Number of awards: 2

The Hustler
Number of awards: 0

Who's Afraid of Virginia Woolf?
Number of awards: 0

Bonnie and Clyde
Number of awards: 0

The Graduate
Number of awards: 1

Guess Who's Coming to Dinner
Number of awards: 0

The Lion in Winter
Number of awards: 0

Love Story
Number of awards: 0

Chinatown
Number of awards: 0

Lenny
Number of awards: 0

One Flew Over the Cuckoo's Nest
Number of awards: 3

Rocky
Number of awards: 2

Network
Number of awards: 1

Annie Hall
Number of awards: 2

Coming Home
Number of awards: 1

Atlantic City
Number of awards: 0

On Golden Pond
Number of awards: 1

Reds
Number of awards: 1

The Silence of the Lambs
Number of awards: 3

The Remains of the Day
Number of awards: 0

The English Patient
Number of awards: 2

American Beauty
Number of awards: 3

Million Dollar Baby
Number of awards: 2

Silver Linings Playbook
Number of awards: 0

American Hustle
Number of awards: 0


Extra Credit 2.) List maximum number of Academy Awards that a movie has won and list the winning movies.
ec2.rb

My algorithm includes opening the academy portal, storing the page title in a variable on line 8 , extracting the link of ‘List of films receiving six or more Academy Awards’ page from the table data and opening the required page. It then extracts number of awards for each movie from the table.wikitable.sortable and finds the maximum number of awards overall. It then prints the maximum number of awards. Then it searches for movies with the number of awards equal to the maximum and pushes them into a list. It finally returns the list of movies with maximum number of academy awards.

output-

Maximum Number of Awards: 11

Movies: 
Ben-Hur
The Lord of the Rings: The Return of the King
Titanic