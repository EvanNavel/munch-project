# Munch 🍽️

A full-stack recipe-sharing social platform built with Ruby on Rails. Users can post, browse, search, and interact with recipes from a community of home cooks and food lovers.

Built as a collaborative capstone project at the University of Memphis (Spring 2024).

![Screen Shot 2024-04-30 at 01 40 02](https://github.com/memphis-cs-projects/sour-patch-kidz-s24/assets/47510094/f2a01841-0b95-481d-bd3e-7594f239b08f)

![Screen Shot 2024-04-30 at 01 39 31](https://github.com/memphis-cs-projects/sour-patch-kidz-s24/assets/47510094/21c37007-3ef5-4c7d-acf0-c0e85a53b502)

---

## Features

**Recipes**
- Create posts with separate fields for description, ingredients, and directions
- Add photos to recipes
- Tag posts by meal type (breakfast, lunch, dinner), difficulty level, cuisine, and dietary/health restrictions
- Edit and delete your own posts
- Fork another user's recipe to put your own spin on it

**Discovery**
- Browse all recipes on the home feed
- Sort by newest or most popular ("Sweets")
- Search by title, difficulty, meal type, or cuisine
- Filter by tags

**Community**
- "Sweet" (like) recipes you enjoy
- Save recipes to your personal Cookbook
- Comment on posts to leave feedback
- Follow other users to keep up with their recipes
- Flag inappropriate content — posts flagged by 2 users are auto-removed

**Accounts**
- Sign up, sign in, and manage your profile
- View your posted recipes, cookbook, followers, and followees
- Create a business page to promote a local restaurant

---

## Tech Stack

- **Framework:** Ruby on Rails
- **Languages:** Ruby, HTML/ERB, CSS, JavaScript
- **Database:** SQLite (development)
- **Auth:** Devise
- **File Uploads:** Active Storage
- **Testing:** Rails built-in test suite (fixtures, controller/model tests)
- **Version Control:** Git & GitHub (feature branch workflow with pull requests)

---

## My Contributions (Evan Patterson — Lead Developer)

- **Tagging system** — designed and built the full tag/tagging models and integrated them across post creation, browsing, and search (M1 incomplete due to merge conflict, fully completed in M2)
- **Sorting** — implemented sort by date and by Sweets count on the post index
- **Likes ("Sweets")** — built the likes controller, model, and toggle UI
- **Photo uploads** — implemented image attachment on posts and forks using Active Storage
- **Post structure** — refactored the recipe body into separate description, ingredients, and directions fields across posts and forks
- **Project lead** — coordinated milestones, managed the team's GitHub workflow, and reviewed pull requests across both sprints

---

## Running Locally

Clone the repository to your hard drive, navigate to the folder and run `rails server`.

The database may need to be re-initialized before launching. If so, run:

```bash
rails db:migrate:reset
rails db:seed
rails server
```

Then visit `http://localhost:3000`

---

## Team

- Evan Patterson (evannavel1819@gmail.com)
- Mohammad Hujeir (m.hujeri@gmail.com)
- Cameron Cox (Cameronacox0904@gmail.com)
- Alexander Fiodorov (alexfiodorov02@gmail.com)