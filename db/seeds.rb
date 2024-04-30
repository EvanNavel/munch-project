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
      body: "A classic dessert with a sweet and tangy filling\n\n**Ingredients:**\n- 1 pie crust\n- 6 cups of peeled and sliced apples\n- 1 cup of sugar\n- 2 tablespoons of all-purpose flour\n- 1/2 teaspoon of ground cinnamon\n- 1/4 teaspoon of ground nutmeg\n- 1 tablespoon of lemon juice\n\n**Recipe:**\n1. Preheat your oven to 375 degrees F (190 degrees C).\n2. Place the apple slices into the pie crust.\n3. Mix the sugar, flour, cinnamon, nutmeg, and lemon juice in a bowl, then pour over the apples.\n4. Bake for about 50 minutes, or until the crust is golden brown.",
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
      body: "A popular Indian dish with a creamy tomato sauce\n\n**Ingredients:**\n- 500g boneless chicken, cut into pieces\n- 1 cup yogurt\n- 1 tablespoon lemon juice\n- 2 teaspoons cumin\n- 1 teaspoon cinnamon\n- 2 teaspoons cayenne pepper\n- 2 teaspoons black pepper\n- 1 tablespoon ginger\n- 1 teaspoon salt\n- 3 cloves garlic, minced\n- 1 onion, diced\n- 2 cups tomato sauce\n- 2 cups cream\n\n**Recipe:**\n1. Marinate the chicken in the yogurt, lemon juice, and spices for an hour.\n2. Saute the garlic and onions in a pan, then add the tomato sauce and cream.\n3. Add the chicken and simmer for 20 minutes.",
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
      body: "A quick and healthy meal packed with veggies\n\n**Ingredients:**\n- 2 tablespoons vegetable oil\n- 1 onion, sliced\n- 2 cloves garlic, minced\n- 1 bell pepper, sliced\n- 1 carrot, sliced\n- 1 zucchini, sliced\n- 2 tablespoons soy sauce\n\n**Recipe:**\n1. Heat the oil in a wok or large frying pan.\n2. Add the onion and garlic and stir-fry for 2 minutes.\n3. Add the rest of the vegetables and stir-fry for another 5 minutes.\n4. Add the soy sauce and stir-fry for another 2 minutes.",
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
      body: "Delicious tacos with seasoned beef and fresh toppings\n\n**Ingredients:**\n- 1 lb ground beef\n- 1 packet taco seasoning\n- 1/2 cup water\n- 12 taco shells\n- 1 cup shredded lettuce\n- 1 cup diced tomatoes\n- 1/2 cup shredded cheese\n\n**Recipe:**\n1. Brown the ground beef in a skillet, then drain the fat.\n2. Add the taco seasoning and water, then simmer for 5 minutes.\n3. Spoon the beef into the taco shells, then top with lettuce, tomatoes, and cheese.",
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
      body: "Fluffy pancakes bursting with blueberries\n\n**Ingredients:**\n- 1 cup all-purpose flour\n- 1 tablespoon sugar\n- 1 teaspoon baking powder\n- 1/2 teaspoon baking soda\n- 1/4 teaspoon salt\n- 3/4 cup buttermilk\n- 1/4 cup milk\n- 1 egg\n- 2 tablespoons butter, melted\n- 1 cup fresh blueberries\n\n**Recipe:**\n1. Mix the dry ingredients in a bowl.\n2. In another bowl, mix the buttermilk, milk, egg, and melted butter, then add to the dry ingredients.\n3. Stir in the blueberries.\n4. Pour 1/4 cup of batter onto a hot griddle for each pancake. Cook until bubbles form on the surface, then flip and cook until golden brown.",
      user: cameron,
      tags: [
        meal_tags[:breakfast],
        cuisine_tags[:american],
        difficulty_tags[:medium],
        dietary_tags[:vegan]
      ]
    }
  ]

  images_folder_path = Rails.root.join('app', 'assets', 'images')

  image_files = {
    'Grandma\'s Apple Pie' => 'Apple_pie.jpg',
    'Chicken Tikka Masala' => 'chicken-tikka-masala.jpg',
    'Vegetable Stir Fry' => 'Vegetable-Stir-Fry.jpg',
    'Beef Tacos' => 'Ground-Beef-Tacos.jpg',
    'Blueberry Pancakes' => 'Blueberry-Pancakes.jpg'
  }

  posts_data.each do |post_data|
    post = Post.create!(
      title: post_data[:title],
      body: post_data[:body],
      user: post_data[:user]
    )

    post.tags = post_data[:tags]

    image_filename = image_files[post_data[:title]]
    image_path = File.join(images_folder_path, image_filename)
    if File.exist?(image_path)
      post.image.attach(io: File.open(image_path), filename: image_filename)
    end

    post.save!
  end

  puts "Seeded #{posts_data.size} posts with images."
