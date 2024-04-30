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

mohammad = User.create(
    email: 'mohammad@example.com',
    password: 'mohammad123'
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

post7 = Post.create(
    title: 'Banana Nut Bread',
    body: "A moist, sweet bread loaded with ripe bananas and crunchy walnuts\n\n**Ingredients:**\n- 3 ripe bananas, mashed\n- 1/3 cup melted butter\n- 1 teaspoon baking soda\n- Pinch of salt\n- 3/4 cup sugar\n- 1 large egg, beaten\n- 1 teaspoon vanilla extract\n- 1 1/2 cups of all-purpose flour\n- 1/2 cup walnuts, chopped\n\n**Recipe:**\n1. Preheat your oven to 350 degrees F (175 degrees C).\n2. In a mixing bowl, stir the mashed bananas with the melted butter.\n3. Mix in the baking soda and salt. Stir in the sugar, beaten egg, and vanilla extract. Mix in the flour and walnuts.\n4. Pour the batter into a greased 4x8 inch loaf pan.\n5. Bake for 1 hour or until a tester inserted into the center comes out clean.\n6. Cool on a rack. Remove from pan and slice to serve.",
    meal: 'breakfast',
    cuisine: 'American',
    difficulty: 'easy',
    user: mohammad,
    created_at: 2.days.ago
)

post8 = Post.create(
    title: 'Spicy Shrimp Pasta',
    body: "A quick pasta dish with a garlic tomato sauce and fiery shrimp\n\n**Ingredients:**\n- 8 oz spaghetti\n- 1 lb shrimp, peeled and deveined\n- 2 tablespoons olive oil\n- 4 cloves garlic, minced\n- 1/2 teaspoon red pepper flakes\n- 1 can (14.5 oz) diced tomatoes\n- Salt and pepper to taste\n- Fresh parsley, chopped\n\n**Recipe:**\n1. Cook the spaghetti according to package instructions.\n2. While the pasta cooks, heat olive oil in a pan over medium heat. Add the garlic and red pepper flakes, and sauté until fragrant.\n3. Add the shrimp and cook until they are pink and opaque.\n4. Stir in the diced tomatoes and simmer for a few minutes. Season with salt and pepper.\n5. Drain the pasta and toss it with the shrimp sauce. Garnish with chopped parsley before serving.",
    meal: 'dinner',
    cuisine: 'Italian',
    difficulty: 'medium',
    user: mohammad,
    created_at: 1.day.ago
)

post9 = Post.create(
    title: 'Mango Chicken Curry',
    body: "A flavorful curry that combines sweet mangoes with tender chicken\n\n**Ingredients:**\n- 2 tablespoons oil\n- 1 onion, chopped\n- 2 garlic cloves, minced\n- 1 tablespoon curry powder\n- 2 mangos, peeled and diced\n- 1 lb chicken breast, cut into chunks\n- 1 can (14 oz) coconut milk\n- Salt and pepper to taste\n- Fresh cilantro, for garnish\n\n**Recipe:**\n1. Heat the oil in a large skillet over medium heat. Add the onion and garlic, and cook until soft.\n2. Stir in the curry powder and cook for 1 minute more.\n3. Add the chicken and brown lightly on all sides.\n4. Add the mangos and coconut milk. Bring to a simmer and cook until the chicken is cooked through.\n5. Season with salt and pepper. Serve garnished with fresh cilantro.",
    meal: 'dinner',
    cuisine: 'Indian',
    difficulty: 'medium',
    user: mohammad,
    created_at: 3.days.ago
)

post10 = Post.create(
    title: 'Lemon Herb Salmon',
    body: "A light and flavorful dish featuring baked salmon with lemon and herbs\n\n**Ingredients:**\n- 4 salmon fillets\n- 2 lemons, thinly sliced\n- 2 tablespoons olive oil\n- 1 tablespoon fresh dill, chopped\n- 1 tablespoon fresh parsley, chopped\n- Salt and pepper to taste\n\n**Recipe:**\n1. Preheat your oven to 400 degrees F (200 degrees C).\n2. Place the salmon fillets in a baking dish.\n3. Drizzle with olive oil and season with salt and pepper.\n4. Arrange lemon slices over the fillets and sprinkle with dill and parsley.\n5. Bake for 15-20 minutes, or until the salmon is cooked through and flakes easily with a fork.",
    meal: 'dinner',
    cuisine: 'Mediterranean',
    difficulty: 'easy',
    user: mohammad,
    created_at: 4.days.ago
)

post11 = Post.create(
    title: 'Avocado Chocolate Mousse',
    body: "A rich and creamy dessert made with avocados and chocolate\n\n**Ingredients:**\n- 2 ripe avocados, peeled and pitted\n- 1/2 cup cocoa powder\n- 1/4 cup honey\n- 1/2 cup coconut milk\n- 1 teaspoon vanilla extract\n- Pinch of salt\n\n**Recipe:**\n1. Combine all ingredients in a blender or food processor.\n2. Blend until smooth and creamy, scraping down the sides as needed.\n3. Chill the mousse in the refrigerator for at least an hour before serving.\n4. Serve with a garnish of fresh fruit or a sprinkle of cocoa powder.",
    meal: 'dessert',
    cuisine: 'Fusion',
    difficulty: 'easy',
    user: mohammad,
    created_at: 5.days.ago
)


