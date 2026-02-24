# Eventbrite

![Ruby 3.4.2](https://img.shields.io/badge/Ruby-3.4.2-CC342D?style=flat-square&logo=ruby&logoColor=white) ![Rails 8.1](https://img.shields.io/badge/Rails-8.1-CC0000?style=flat-square&logo=rubyonrails&logoColor=white) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-316192?style=flat-square&logo=postgresql&logoColor=white) ![Bootstrap 5.3](https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=flat-square&logo=bootstrap&logoColor=white) ![Devise 5](https://img.shields.io/badge/Devise-5.0-10B981?style=flat-square&logo=rubygems&logoColor=white) ![PWA](https://img.shields.io/badge/PWA-Rails_8-5A0FC8?style=flat-square&logo=pwa&logoColor=white)

Event listing app (The Hacking Project, Week 5). Browse events, create your own when signed in, and manage your profile. Auth with Devise, UI with Bootstrap 5, installable as a PWA.

**[Project diagrams (ER, associations, routes, flows)](docs/projet-mermaid.md)**

---

## Table of contents

- [Features](#features)
- [Stack](#stack)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
- [Routes](#routes)
- [Docs](#docs)

---

## Features

- **Authentication** — Sign up, sign in, sign out, password reset (Devise)
- **Events** — List, show, create (title, description, date, duration, price, location)
- **Profiles** — View your profile and events you created; edit email/password via Devise
- **PWA** — Installable app (manifest + service worker for push/notifications)
- **Mailers** — Welcome email on signup; email to organizer on new attendance

---

## Stack

| Layer     | Tech                                      |
| --------- | ----------------------------------------- |
| Language  | Ruby 3.4                                  |
| Framework | Rails 8.1                                 |
| Database  | PostgreSQL                                |
| Auth      | Devise                                    |
| Front-end | Bootstrap 5, Turbo, Stimulus, importmap   |
| PWA       | Rails 8 native (manifest, service worker) |

---

## Prerequisites

- **Ruby** 3.4.x (see [.ruby-version](.ruby-version))
- **PostgreSQL** (running and reachable)
- **Bundler** (`gem install bundler`)

---

## Setup

1. **Clone and install**

   ```bash
   git clone <repo-url>
   cd eventbrite
   bundle install
   ```

2. **Database**

   Configure `config/database.yml` for your PostgreSQL user/password if needed, then:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

   The seed creates sample users (e.g. alice@yopmail.com) and two test events.

3. **Run**

   ```bash
   rails server
   ```

   Open [http://localhost:3000](http://localhost:3000).

---

## Usage

- **Guest:** Browse events on the home page, open event details, sign up or sign in from the navbar.
- **Signed in:** Create events (navbar “Créer un événement”), view and edit your profile (dropdown “Mon profil”), sign out.
- **PWA:** In a supporting browser, use the install prompt to add the app to your home screen.

---

## Routes

| Path              | Controller     | Description                       |
| ----------------- | -------------- | --------------------------------- |
| `/`               | `events#index` | Home, list of events              |
| `/events/:id`     | `events#show`  | Event details                     |
| `/events/new`     | `events#new`   | Create event form (auth required) |
| `/users/:id`      | `users#show`   | User profile (owner only)         |
| `/users/sign_up`  | Devise         | Registration                      |
| `/users/sign_in`  | Devise         | Sign in                           |
| `/users/sign_out` | Devise         | Sign out (DELETE)                 |
| `/manifest`       | PWA            | Web app manifest                  |
| `/service-worker` | PWA            | Service worker script             |

---

## Docs

- [Project Mermaid diagrams](docs/projet-mermaid.md) — Data model, associations, routes, user flow
