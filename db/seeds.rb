# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create!(name: "Luke", movie: movies.first)

# Ensuring idempotency in user creation
cameron = User.find_or_create_by!(email: 'Cameroncox0904@gmail.com') do |user|
    user.password = 'password'
  end

  # Creating or finding tags to avoid duplication
  meal_tags = {
    breakfast: Tag.find_or_create_by!(name: 'Breakfast', category: 'meal'),
    lunch: Tag.find_or_create_by!(name: 'Lunch', category: 'meal'),
    dinner: Tag.find_or_create_by!(name: 'Dinner', category: 'meal'),
    snack: Tag.find_or_create_by!(name: 'Snack', category: 'meal')
  }

  cuisine_tags = {
    american: Tag.find_or_create_by!(name: 'American', category: 'cuisine'),
    indian: Tag.find_or_create_by!(name: 'Indian', category: 'cuisine'),
    chinese: Tag.find_or_create_by!(name: 'Chinese', category: 'cuisine'),
    mexican: Tag.find_or_create_by!(name: 'Mexican', category: 'cuisine')
  }

  difficulty_tags = {
    easy: Tag.find_or_create_by!(name: 'Easy', category: 'difficulty'),
    medium: Tag.find_or_create_by!(name: 'Medium', category: 'difficulty'),
    hard: Tag.find_or_create_by!(name: 'Hard', category: 'difficulty'),
    expert: Tag.find_or_create_by!(name: 'Expert', category: 'difficulty')
  }

  dietary_tags = {
    gluten_free: Tag.find_or_create_by!(name: 'Gluten Free', category: 'dietary'),
    vegan: Tag.find_or_create_by!(name: 'Vegan', category: 'dietary'),
    low_carb: Tag.find_or_create_by!(name: 'Low Carb', category: 'dietary')
  }

  # Posts array to maintain cleanliness and order
  posts_data = [
    {
      title: 'Grandma\'s Apple Pie',
      body: "A classic dessert with a sweet and tangy filling...",
      user: cameron,
      tags: [
        meal_tags[:snack], # Adjusted from dessert to snack for consistency
        cuisine_tags[:american],
        difficulty_tags[:medium],
        dietary_tags[:gluten_free]
      ]
    },
    {
      title: 'Chicken Tikka Masala',
      body: "A popular Indian dish with a creamy tomato sauce...",
      user: cameron,
      tags: [
        meal_tags[:dinner],
        cuisine_tags[:indian],
        difficulty_tags[:hard],
        dietary_tags[:gluten_free]
      ]
    },
    {
      title: 'Vegetable Stir Fry',
      body: "A quick and healthy meal packed with veggies...",
      user: cameron,
      tags: [
        meal_tags[:lunch],
        cuisine_tags[:chinese],
        difficulty_tags[:easy],
        dietary_tags[:vegan]
      ]
    },
    {
      title: 'Beef Tacos',
      body: "Delicious tacos with seasoned beef and fresh toppings...",
      user: cameron,
      tags: [
        meal_tags[:dinner],
        cuisine_tags[:mexican],
        difficulty_tags[:easy],
        dietary_tags[:low_carb]
      ]
    },
    {
      title: 'Blueberry Pancakes',
      body: "Fluffy pancakes bursting with blueberries...",
      user: cameron,
      tags: [
        meal_tags[:breakfast],
        cuisine_tags[:american],
        difficulty_tags[:medium],
        dietary_tags[:vegan]
      ]
    }
  ]

  # Creating posts and associating tags in a safe manner
  posts_data.each do |post_data|
    post = Post.create!(
      title: post_data[:title],
      body: post_data[:body],
      user: post_data[:user]
    )
    post.tags = post_data[:tags]
    post.save!
  end

  puts "Seeded #{posts_data.size} posts."
