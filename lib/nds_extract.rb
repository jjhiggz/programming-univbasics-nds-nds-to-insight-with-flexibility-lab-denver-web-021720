# Provided, don't edit
require_relative './directors_database.rb'
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
  array = []
  mlength = movies_collection.length
  i=0
  while i < mlength do
    #binding.pry
      array << movie_with_director_name(name,movies_collection[i])
      i=i+1
  end
return array
end
################
##############
def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  #binding.pry
  hash = {}
  i=0
  while i <collection.length
<<<<<<< HEAD
    #binding.pry
    key = collection[i][:title]
    if !hash[key]
      hash[key] = collection[i][:worldwide_gross]
    else
      hash[key]= collection[i][:worldwide_gross] + hash[key]
    end
    i+= 1
=======
    if !hash[collection[i][:title]]
      hash[collection[i][:title]] = collection[i][:worldwide_gross]
    else
      hash[collection[i][:title]]= collection[i][:worldwide_gross] + hash[collection[i][:title]]
    end
>>>>>>> 6ea317887667d284fd61385040cc70352face186
  end
end

puts 'a'
collection =  [
  { :title => "Movie A", :studio => "Alpha Films", :worldwide_gross => 10 },
  { :title => "Movie B", :studio => "Alpha Films", :worldwide_gross => 30 },
  { :title => "Movie C", :studio => "Omega Films", :worldwide_gross => 30 }
]
puts gross_per_studio(collection)

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
    # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  # RETURN:
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  #binding.pry
  a =[]
  i=0
  while i < source.length do
    name = source[i][:name]
    #binding.pry
    newterm = source[i][:movies]
    j=0
    while j<newterm.length
      newterm[j][:director_name]=name
      j=j+1
    end
    a[i]=newterm
    i=i+1
  end

  return a
=======
  binding.pry
>>>>>>> 6ea317887667d284fd61385040cc70352face186
end
source = [{:name=>"Byron Poodle",
  :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]},
 {:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}]
 puts movies_with_directors_set(source)

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
