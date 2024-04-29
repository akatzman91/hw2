# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Actor.destroy_all
Movie.destroy_all
Role.destroy_all
Studio.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

ActiveRecord::Schema[7.1].define(version: 2024_04_29_180457) do
    create_table "actors", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "movies", force: :cascade do |t|
      t.string "title"
      t.integer "year_released"
      t.string "rated"
      t.integer "studio_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "roles", force: :cascade do |t|
      t.integer "movie_id"
      t.integer "actor_id"
      t.string "character_name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "studios", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
  end

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio_1 = Studio.new
studio_1 ["name"] = "Warner Bros."
studio_1.save

movie_1 = Movie.new
movie_1 ["title"] = "Batman Begins"
movie_1 ["year_released"] = "2005"
movie_1 ["rated"] = "PG-13"
movie_1 ["studio_id"] = studio_1.id
movie_1.save

movie_2 = Movie.new
movie_2 ["title"] = "The Dark Knight"
movie_2 ["year_released"] = "2008"
movie_2 ["rated"] = "PG-13"
movie_2 ["studio_id"] = studio_1.id
movie_2.save

movie_3 = Movie.new
movie_3 ["title"] = "The Dark Knight Rises"
movie_3 ["year_released"] = "2012"
movie_3 ["rated"] = "PG-13"
movie_3 ["studio_id"] = studio_1.id
movie_3.save

actor_1 = Actor.new
actor_1 ["name"] = "Christian Bale"
actor_1.save

actor_2 = Actor.new
actor_2 ["name"] = "Michael Caine"
actor_2.save

actor_3 = Actor.new
actor_3 ["name"] = "Liam Neeson"
actor_3.save

actor_4 = Actor.new
actor_4 ["name"] = "Katie Holmes"
actor_4.save

actor_5 = Actor.new
actor_5 ["name"] = "Gary Oldman"
actor_5.save

actor_6 = Actor.new
actor_6 ["name"] = "Heath Ledger"
actor_6.save

actor_7 = Actor.new
actor_7 ["name"] = "Aaron Eckhart"
actor_7.save

actor_8 = Actor.new
actor_8 ["name"] = "Maggie Gyllenhaal"
actor_8.save

actor_9 = Actor.new
actor_9 ["name"] = "Tom Hardy"
actor_9.save

actor_10 = Actor.new
actor_10 ["name"] = "Joseph Gordon-Levitt"
actor_10.save

actor_11 = Actor.new
actor_11 ["name"] = "Anne Hathaway"
actor_11.save

role_1 = Role.new
role_1 ["movie_id"] = movie_1.id
role_1 ["actor_id"] = actor_1.id
role_1 ["character_name"] = "Bruce Wayne"
role_1.save

role_1 = Role.new
role_1 ["movie_id"] = movie_2.id
role_1 ["actor_id"] = actor_1.id
role_1 ["character_name"] = "Bruce Wayne"
role_1.save

role_1 = Role.new
role_1 ["movie_id"] = movie_3.id
role_1 ["actor_id"] = actor_1.id
role_1 ["character_name"] = "Bruce Wayne"
role_1.save

role_2 = Role.new
role_2 ["movie_id"] = movie_1.id
role_2 ["actor_id"] = actor_2.id
role_2 ["character_name"] = "Alfred"
role_2.save

role_2 = Role.new
role_2 ["movie_id"] = movie_2.id
role_2 ["actor_id"] = actor_2.id
role_2 ["character_name"] = "Alfred"
role_2.save

role_3 = Role.new
role_3 ["movie_id"] = movie_1.id
role_3 ["actor_id"] = actor_3.id
role_3 ["character_name"] = "Ra's Al Ghul"
role_3.save

role_4 = Role.new
role_4 ["movie_id"] = movie_1.id
role_4 ["actor_id"] = actor_4.id
role_4 ["character_name"] = "Rachel Dawes"
role_4.save

role_5 = Role.new
role_5 ["movie_id"] = movie_1.id
role_5 ["actor_id"] = actor_5.id
role_5 ["character_name"] = "Commissioner Gordon"
role_5.save

role_5 = Role.new
role_5 ["movie_id"] = movie_3.id
role_5 ["actor_id"] = actor_5.id
role_5 ["character_name"] = "Commissioner Gordon"
role_5.save

role_6 = Role.new
role_6 ["movie_id"] = movie_2.id
role_6 ["actor_id"] = actor_6.id
role_6 ["character_name"] = "Joker"
role_6.save

role_7 = Role.new
role_7 ["movie_id"] = movie_2.id
role_7 ["actor_id"] = actor_7.id
role_7 ["character_name"] = "Harvey Dent"
role_7.save

role_8 = Role.new
role_8 ["movie_id"] = movie_2.id
role_8 ["actor_id"] = actor_8.id
role_8 ["character_name"] = "Rachel Dawes"
role_8.save

role_9 = Role.new
role_9 ["movie_id"] = movie_3.id
role_9 ["actor_id"] = actor_9.id
role_9 ["character_name"] = "Bane"
role_9.save

role_10 = Role.new
role_10 ["movie_id"] = movie_3.id
role_10 ["actor_id"] = actor_10.id
role_10 ["character_name"] = "John Blake"
role_10.save

role_11 = Role.new
role_11 ["movie_id"] = movie_3.id
role_11 ["actor_id"] = actor_11.id
role_11 ["character_name"] = "Selina Kyle"
role_11.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
all_movies = Movie.all

for movie in all_movies
    # p movie
    title = movie["title"]
    year_released = movie["year_released"]
    rated = movie["rated"]
    studio = movie["studio_id"]

    puts "#{title} #{year_released} #{rated} #{studio} "
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
