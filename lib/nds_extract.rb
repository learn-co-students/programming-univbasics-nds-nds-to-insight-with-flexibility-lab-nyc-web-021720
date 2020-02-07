# Provided, don't edit
require 'directors_database'
require 'pry'

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
  new_array = []
  
  director_index = 0 
    while director_index < movies_collection.length do 
      new_array << movie_with_director_name(name, movies_collection[director_index])
      director_index += 1 
     end
     new_array
  
end


def gross_per_studio(collection)
  new_hash = {}
  movie_index = 0 
  while movie_index < collection.length do 
    studio_name = collection[movie_index][:studio]
    total_gross = collection[movie_index][:worldwide_gross]
    if new_hash[studio_name]
    new_hash[studio_name] += total_gross
  else
    new_hash[studio_name] = total_gross
  end
    movie_index += 1
 end
 new_hash
  
end
def make_movies_with_directors(director_data)
   movie_names = director_data[:movies]
   film_index = 0 
   new_movies = []
   while film_index < movie_names.length do 
    movie = movie_names[film_index]
    movie[:director_name] = director_data[:name]
    new_movies << movie
    film_index += 1 
   end
  new_movies
end

def movies_with_directors_set(source)
 new_array = []
 row_index = 0 
 while row_index < source.length do 
   director_data = source[row_index]
   movie_names = make_movies_with_directors(director_data)
   new_array << movie_names
   row_index += 1 
 end
 new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
