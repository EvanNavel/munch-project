# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cameron = User.create(
    email: 'Cameroncox0904@gmail.com',
    password: 'password'
)

post2 = Post.create(
    title: 'Grandma\'s Apple Pie',
    body: "A classic dessert with a sweet and tangy filling\n\n**Ingredients:**\n- 1 pie crust\n- 6 cups of peeled and sliced apples\n- 1 cup of sugar\n- 2 tablespoons of all-purpose flour\n- 1/2 teaspoon of ground cinnamon\n- 1/4 teaspoon of ground nutmeg\n- 1 tablespoon of lemon juice\n\n**Recipe:**\n1. Preheat your oven to 375 degrees F (190 degrees C).\n2. Place the apple slices into the pie crust.\n3. Mix the sugar, flour, cinnamon, nutmeg, and lemon juice in a bowl, then pour over the apples.\n4. Bake for about 50 minutes, or until the crust is golden brown.",
    meal: 'dessert',
    cuisine: 'American',
    difficulty: 'medium',
    user: cameron,
    created_at: 1.week.ago
)

post3 = Post.create(
    title: 'Chicken Tikka Masala',
    body: "A popular Indian dish with a creamy tomato sauce\n\n**Ingredients:**\n- 500g boneless chicken, cut into pieces\n- 1 cup yogurt\n- 1 tablespoon lemon juice\n- 2 teaspoons cumin\n- 1 teaspoon cinnamon\n- 2 teaspoons cayenne pepper\n- 2 teaspoons black pepper\n- 1 tablespoon ginger\n- 1 teaspoon salt\n- 3 cloves garlic, minced\n- 1 onion, diced\n- 2 cups tomato sauce\n- 2 cups cream\n\n**Recipe:**\n1. Marinate the chicken in the yogurt, lemon juice, and spices for an hour.\n2. Saute the garlic and onions in a pan, then add the tomato sauce and cream.\n3. Add the chicken and simmer for 20 minutes.",
    meal: 'dinner',
    cuisine: 'Indian',
    difficulty: 'hard',
    user: cameron,
    created_at: 3.days.ago
)

post4 = Post.create(
    title: 'Vegetable Stir Fry',
    body: "A quick and healthy meal packed with veggies\n\n**Ingredients:**\n- 2 tablespoons vegetable oil\n- 1 onion, sliced\n- 2 cloves garlic, minced\n- 1 bell pepper, sliced\n- 1 carrot, sliced\n- 1 zucchini, sliced\n- 2 tablespoons soy sauce\n\n**Recipe:**\n1. Heat the oil in a wok or large frying pan.\n2. Add the onion and garlic and stir-fry for 2 minutes.\n3. Add the rest of the vegetables and stir-fry for another 5 minutes.\n4. Add the soy sauce and stir-fry for another 2 minutes.",
    meal: 'lunch',
    cuisine: 'Chinese',
    difficulty: 'easy',
    user: cameron,
    created_at: 2.days.ago
)

post5 = Post.create(
    title: 'Beef Tacos',
    body: "Delicious tacos with seasoned beef and fresh toppings\n\n**Ingredients:**\n- 1 lb ground beef\n- 1 packet taco seasoning\n- 1/2 cup water\n- 12 taco shells\n- 1 cup shredded lettuce\n- 1 cup diced tomatoes\n- 1/2 cup shredded cheese\n\n**Recipe:**\n1. Brown the ground beef in a skillet, then drain the fat.\n2. Add the taco seasoning and water, then simmer for 5 minutes.\n3. Spoon the beef into the taco shells, then top with lettuce, tomatoes, and cheese.",
    meal: 'dinner',
    cuisine: 'Mexican',
    difficulty: 'easy',
    user: cameron,
    created_at: 1.day.ago
)

post6 = Post.create(
    title: 'Blueberry Pancakes',
    body: "Fluffy pancakes bursting with blueberries\n\n**Ingredients:**\n- 1 cup all-purpose flour\n- 1 tablespoon sugar\n- 1 teaspoon baking powder\n- 1/2 teaspoon baking soda\n- 1/4 teaspoon salt\n- 3/4 cup buttermilk\n- 1/4 cup milk\n- 1 egg\n- 2 tablespoons butter, melted\n- 1 cup fresh blueberries\n\n**Recipe:**\n1. Mix the dry ingredients in a bowl.\n2. In another bowl, mix the buttermilk, milk, egg, and melted butter, then add to the dry ingredients.\n3. Stir in the blueberries.\n4. Pour 1/4 cup of batter onto a hot griddle for each pancake. Cook until bubbles form on the surface, then flip and cook until golden brown.",
    meal: 'breakfast',
    cuisine: 'American',
    difficulty: 'medium',
    user: cameron,
    created_at: 12.hours.ago
)
