# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
pp directors_database
def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  
  movies = []
  i = 0
  while i < movies_collection.length do
    movie = movies_collection[i]
    movies << movie_with_director_name(name, movie)
    i += 1
  end
  movies
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  
  
  gross_total = {}
  i = 0
  
  while i < collection.length do 
    current_studio_name = collection[i][:studio]
    current_studio_gross = collection[i][:worldwide_gross]
    if gross_total[current_studio_name]
      gross_total[current_studio_name] += current_studio_gross
    else
      gross_total[current_studio_name] = current_studio_gross
    end
    
    i += 1
  end
  
   gross_total
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  
  movie = []
  i = 0
  while i < source.length do
    director_name = source[i][:name]
    list_of_movies = source[i][:movies]
    movie << movies_with_director_key(director_name, list_of_movies)
    i += 1
  end
  
  movie
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end













[{:name=>"Stephen Spielberg",
  :movies=> [{
    :title=>"Jaws",
     :studio=>"Universal",
     :worldwide_gross=>260000000,
     :release_year=>1975},
    {
     :title=>"Close Encounters of the Third Kind",
     :studio=>"Columbia",
     :worldwide_gross=>135189114,
     :release_year=>1977},
    {
     :title=>"Raiders of the Lost Ark",
     :studio=>"Paramount",
     :worldwide_gross=>248159971,
     :release_year=>1981},
    {
     :title=>"E.T. the Extra-terrestrial",
     :studio=>"Universal",
     :worldwide_gross=>435110554,
     :release_year=>1982},
    {
     :title=>"Schindler's List",
     :studio=>"Universal",
     :worldwide_gross=>96898818,
     :release_year=>1993},
    {
     :title=>"Lincoln",
     :studio=>"Buena Vista",
     :worldwide_gross=>182207973,
     :release_year=>2012}]},
 
 {:name=>"Russo Brothers",
  :movies=> [{
     :title=>"Avengers Endgame",
     :studio=>"Buena Vista",
     :worldwide_gross=>858371337,
     :release_year=>2019},
    {
     :title=>"Avengers Infinity War",
     :studio=>"Buena Vista",
     :worldwide_gross=>678815482,
     :release_year=>2018},
    {
     :title=>"Captain America Civil War",
     :studio=>"Buena Vista",
     :worldwide_gross=>408084349,
     :release_year=>2016},
    {
     :title=>"Captain America The Winter Soldier",
     :studio=>"Buena Vista",
     :worldwide_gross=>259766572,
     :release_year=>2014},
    {
     :title=>"You, Me and Dupree",
     :studio=>"Universal",
     :worldwide_gross=>75628110,
     :release_year=>2006},
    {
     :title=>"Welcome to Collinwood",
     :studio=>"Warner Brothers",
     :worldwide_gross=>336620,
     :release_year=>2002}]},
 {:name=>"James Cameron",
  :movies=> [{
     :title=>"Avatar",
     :studio=>"Fox",
     :worldwide_gross=>760507625,
     :release_year=>2009},
    {
     :title=>"Titanic",
     :studio=>"Paramount",
     :worldwide_gross=>659363944,
     :release_year=>1997},
    {
     :title=>"Titanic",
     :studio=>"Paramount",
     :worldwide_gross=>659363944,
     :release_year=>1997},
    {
     :title=>"Terminator 2 Judgment Day",
     :studio=>"TriStar",
     :worldwide_gross=>205881154,
     :release_year=>1991},
    {
     :title=>"True Lies",
     :studio=>"Fox",
     :worldwide_gross=>146282411,
     :release_year=>1994},
    {
     :title=>"Aliens",
     :studio=>"Fox",
     :worldwide_gross=>85160248,
     :release_year=>1986},
    {
     :title=>"The Abyss",
     :studio=>"Fox",
     :worldwide_gross=>54461047,
     :release_year=>1989}]},
 {:name=>"Spike Lee",
  :movies=> [{
     :title=>"Inside Man",
     :studio=>"Universal",
     :worldwide_gross=>88513495,
     :release_year=>2006},
    {
     :title=>"BlacKkKlansman",
     :studio=>"Focus",
     :worldwide_gross=>49275340,
     :release_year=>2018},
    {
     :title=>"Malcolm X",
     :studio=>"Warner Brothers",
     :worldwide_gross=>48169910,
     :release_year=>1992},
    {
     :title=>"The Original Kings of Comedy",
     :studio=>"Paramount",
     :worldwide_gross=>38182790,
     :release_year=>2000},
    {
     :title=>"Jungle Fever",
     :studio=>"Universal",
     :worldwide_gross=>32482682,
     :release_year=>1991}]},
 {:name=>"Wachowski Siblings",
  :movies=> [{
     :title=>"The Matrix Reloaded",
     :studio=>"Warner Brothers",
     :worldwide_gross=>281576461,
     :release_year=>2003},
    {
     :title=>"The Matrix",
     :studio=>"Warner Brothers",
     :worldwide_gross=>171479930,
     :release_year=>1999},
    {
     :title=>"The Matrix Revolutions",
     :studio=>"Warner Brothers",
     :worldwide_gross=>139313948,
     :release_year=>2003},
    {
     :title=>"Jupiter Ascending",
     :studio=>"Warner Brothers",
     :worldwide_gross=>139313948,
     :release_year=>2015},
    {
     :title=>"Speed Racer",
     :studio=>"Warner Brothers",
     :worldwide_gross=>47387723,
     :release_year=>2008},
    {
     :title=>"Cloud Atlas",
     :studio=>"Warner Brothers",
     :worldwide_gross=>27108272,
     :release_year=>2012}]},
 {:name=>"Robert Zemeckis",
  :movies=> [{
     :title=>"Forrest Gump",
     :studio=>"Paramount",
     :worldwide_gross=>330455270,
     :release_year=>1994},
    {
     :title=>"Cast Away",
     :studio=>"Fox",
     :worldwide_gross=>233632142,
     :release_year=>2000},
    {
     :title=>"Back to the Future",
     :studio=>"Universal",
     :worldwide_gross=>210609762,
     :release_year=>1985},
    {
     :title=>"The Polar Express",
     :studio=>"Warner Brothers",
     :worldwide_gross=>187224490,
     :release_year=>2004},
    {
     :title=>"Who Framed Roger Rabbit",
     :studio=>"Buena Vista",
     :worldwide_gross=>156452370,
     :release_year=>1988},
    {
     :title=>"What Lies Beneath",
     :studio=>"Dreamworks",
     :worldwide_gross=>155464351,
     :release_year=>2000}]},
 {:name=>"Quentin Tarantino",
  :movies=> [{
     :title=>"Django Unchained",
     :studio=>"Weinstein",
     :worldwide_gross=>162805434,
     :release_year=>2012},
    {
     :title=>"Once Upon a Time in Hollywood",
     :studio=>"Sony",
     :worldwide_gross=>135156125,
     :release_year=>2019},
    {
     :title=>"Inglourious Basterds",
     :studio=>"Weinstein",
     :worldwide_gross=>120540719,
     :release_year=>2009},
    {
     :title=>"Pulp Fiction",
     :studio=>"Miramax",
     :worldwide_gross=>107928762,
     :release_year=>1994},
    {
     :title=>"Kill Bill Vol. 1",
     :studio=>"Miramax",
     :worldwide_gross=>70099045,
     :release_year=>2003},
    {
     :title=>"Kill Bill Vol. 1",
     :studio=>"Miramax",
     :worldwide_gross=>66208183,
     :release_year=>2004}]},
 {:name=>"Martin Scorsese",
  :movies=> [{
     :title=>"The Departed",
     :studio=>"Warner Brothers",
     :worldwide_gross=>132384315,
     :release_year=>2006},
    {
     :title=>"Shutter Island",
     :studio=>"Paramount",
     :worldwide_gross=>128012934,
     :release_year=>2010},
    {
     :title=>"The Wolf of Wall Street",
     :studio=>"Paramount",
     :worldwide_gross=>116900694,
     :release_year=>2013},
    {
     :title=>"The Aviator",
     :studio=>"Miramax",
     :worldwide_gross=>102610330,
     :release_year=>2004},
    {
     :title=>"Cape Fear",
     :studio=>"Universal",
     :worldwide_gross=>79091969,
     :release_year=>1991},
    {
     :title=>"Gangs of New York",
     :studio=>"Miramax",
     :worldwide_gross=>77812000,
     :release_year=>2002}]},
 {:name=>"Francis Ford Coppola",
  :movies=> [{
     :title=>"The Godfather",
     :studio=>"Paramount",
     :worldwide_gross=>134966411,
     :release_year=>1972},
    {
     :title=>"Apocalypse Now",
     :studio=>"MGM",
     :worldwide_gross=>83471511,
     :release_year=>1979},
    {
     :title=>"Apocalypse Now Redux",
     :studio=>"Miramax",
     :worldwide_gross=>83471511,
     :release_year=>2001},
    {
     :title=>"Bram Stoker's Dracula",
     :studio=>"Columbia",
     :worldwide_gross=>82522790,
     :release_year=>1992},
    {
     :title=>"The Godfather Part III",
     :studio=>"Paramount",
     :worldwide_gross=>66666062,
     :release_year=>1990},
    {
     :title=>"Jack",
     :studio=>"Buena Vista",
     :worldwide_gross=>58620973,
     :release_year=>1996}]}]
