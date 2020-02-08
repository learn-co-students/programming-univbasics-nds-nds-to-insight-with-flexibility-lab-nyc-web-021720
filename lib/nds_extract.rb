# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

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


# Your code after this point

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
  
  # we're going to individually sort thru the movie collection 
  # and spit out a hash into the array {director name => movie}
  
  aoh = [] #array of hashes
  current_movie = 0 
    while current_movie < movies_collection.count do 
      movie_info = movies_collection[current_movie]
      aoh << movie_with_director_name(name, movie_info)
      current_movie += 1 
    end 
  aoh
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  # i'm sure there's a better way to do this but i'm basically cross referencing a custom
  # array that adds the studio to the array if it isn't found
  list_of_studios = []
  gross = {}
  movie_index = 0 
  # binding.pry
    while movie_index < collection.count do 
      if list_of_studios.include?(collection[movie_index][:studio])
        studio_name = collection[movie_index][:studio]
        total = gross[studio_name]
        total += collection[movie_index][:worldwide_gross]
        gross[studio_name] = total
        movie_index += 1
      else 
        list_of_studios << collection[movie_index][:studio]
        gross[collection[movie_index][:studio]] = collection[movie_index][:worldwide_gross]
        movie_index += 1 
      end
    end   
  
  gross  
  
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
  # x = source 
  # puts source
  result_array = []
  director_index = 0 
    while director_index < source.count do
      which_hash_in_array = source[director_index]
      director_name = which_hash_in_array[:name]
      dir_movies = which_hash_in_array[:movies]
      result_array << movies_with_director_key(director_name, dir_movies)
      director_index += 1 
    end
  result_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
