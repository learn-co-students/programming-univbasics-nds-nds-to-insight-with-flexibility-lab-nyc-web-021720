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
    updated_movies = []
  num = 0
  while num < movies_collection.count do
    updated_movies.push(movie_with_director_name(name, movies_collection[num]))
#    updated_movies.push({:director_name => name, :title => movies_collection[num][:title]})
    num += 1
  end
   p updated_movies
end


def gross_per_studio(collection)
    result = {}
  i = 0
  while i < collection.count
    studio_name = collection[i][:studio]
    studio_gross = collection[i][:worldwide_gross]
    if !result[studio_name]
      result[studio_name] = studio_gross
    else
      result[studio_name] += studio_gross
    end
    i += 1
  end
  result
end

def movies_with_directors_set(source)
    i = 0
    a_o_a_movies_by_dir = []

  while i < source.length do
    dir_info_hash = source[i]
    director_name = dir_info_hash[:name]
    directors_movies = dir_info_hash[:movies]
    a_o_a_movies_by_dir << movies_with_director_key(director_name, directors_movies)
    i += 1
  end

  a_o_a_movies_by_dir
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end