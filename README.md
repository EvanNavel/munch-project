# Munch 🍽️

A full-stack recipe-sharing social platform built with Ruby on Rails. Users can post, browse, search, and interact with recipes from a community of home cooks and food lovers.

Built as a collaborative capstone project at the University of Memphis (Spring 2024).

**[Interactive demo on naveevan.com](https://naveevan.com/projects/munch)** · [Original app snapshot on GitHub Pages](https://evannavel.github.io/munch-project/)

![Screen Shot 2024-04-30 at 01 40 02](https://github.com/memphis-cs-projects/sour-patch-kidz-s24/assets/47510094/f2a01841-0b95-481d-bd3e-7594f239b08f)

![Screen Shot 2024-04-30 at 01 39 31](https://github.com/memphis-cs-projects/sour-patch-kidz-s24/assets/47510094/21c37007-3ef5-4c7d-acf0-c0e85a53b502)

---

## About the Demos

**Interactive demo (naveevan.com):** a lightweight preview of the recipe feed that I rebuilt for my portfolio so it runs in the browser without a server, database, or account. It uses sample data and covers sorting, tag filtering, and Sweets.

**Original app snapshot (GitHub Pages):** the team's actual Rails app, run locally with seed data and saved as static pages from the point of view of the seed user alice. It shows how the capstone looked as built: the feed, recipe and fork pages, comments, profiles with follows, the Cookbook, business pages, and the create and edit forms. Since GitHub Pages can't run Rails, buttons and forms are disabled, and the search box only works for tag names. The snapshot lives in [`docs/`](docs/).

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
- **Database:** PostgreSQL
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

Requires Ruby 3.1.2 and PostgreSQL.

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
```

Then visit `http://localhost:3000`. Every seeded account uses the password `password` (for example `alice.smith@example.com`).

---

## Post-Capstone Changes

Everything up to commit [`d0fd1f5`](https://github.com/EvanNavel/munch-project/tree/d0fd1f5) (April 30, 2024) is the team's project as submitted for the class. Everything below was added afterward, on my own, while preparing the project for my portfolio:

- **README rewrite**: a project overview, my contributions, setup steps, and links to the demo
- **Demos**: a lightweight interactive preview of the recipe feed for naveevan.com, and a static snapshot of the original app on GitHub Pages ([`docs/`](docs/)) with sample forks, comments, Sweets, Cookbook saves, and follows added to the seed data
- **Authorization**: only a post's, fork's, comment's, or business page's owner can edit or delete it. The class version hid those buttons in the views but didn't enforce ownership in the controllers.
- **Flagging**: a user can flag an item only once (enforced by a validation and a unique index), and the flag, comment, and Cookbook routes now accept only posts and forks
- **Search**: matches every tag that fits the search term instead of only the first one, and searches fork titles and text as well as their tags
- **Comments on forks**: the comment form now posts to the fork instead of the post route
- **Cleanup**: removed unused search, sort, and fork methods left over from earlier iterations

---

## Team

- Evan Patterson ([@EvanNavel](https://github.com/EvanNavel))
- Mohammad Hujeir ([@Hujeir](https://github.com/Hujeir))
- Cameron Cox ([@Cameron0904](https://github.com/Cameron0904))
- Alexander Fiodorov ([@alexfiodorov02](https://github.com/alexfiodorov02))
