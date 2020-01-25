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
  movies_collection_with_directors_name = []

  movies_index = 0
  while movies_index < movies_collection.size do
    director_name = name
    movie_data = movies_collection[movies_index]

    movies_collection_with_directors_name << movie_with_director_name(director_name, movie_data)
    movies_index += 1
  end
  return movies_collection_with_directors_name
end


def gross_per_studio(collection)
  worldwide_gross_per_studio = {}
  row_index = 0 
  while row_index < collection.size do
    studio = collection[row_index][:studio]
    gross = collection[row_index][:worldwide_gross]
    if !worldwide_gross_per_studio[studio]
      worldwide_gross_per_studio[studio] = gross
    else
      worldwide_gross_per_studio[studio] += gross
    end
    row_index += 1
  end
  return worldwide_gross_per_studio 
end


def movies_with_directors_set(source)
  final_array = []
  row_index = 0
  while row_index < source.size do
    name = source[row_index][:name]
    movies_collection = source[row_index][:movies]
    movies_with_director_key(name, movies_collection)
    final_array << movies_with_director_key(name, movies_collection)
    row_index += 1
  end
  return final_array
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end

