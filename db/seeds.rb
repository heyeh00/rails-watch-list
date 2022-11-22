require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying all movies'
Movie.destroy_all

puts 'creating movies'
def movies
  url = 'https://tmdb.lewagon.com/movie/top_rated'
  movie_list = URI.open(url).read
  movies = JSON.parse(movie_list)
  movies_parse = movies["results"]
  movies_parse.each do |movie|
    movie_title = movie["original_title"]
    movie_overview = movie["overview"]
    movie_poster = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
    movie_rating = movie["vote_average"].to_f
    Movie.create(title: movie_title, overview: movie_overview, poster_url: movie_poster, rating: movie_rating)
  end
end

movies

puts 'done!'
