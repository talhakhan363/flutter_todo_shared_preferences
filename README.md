# Internship Task 2: Data Management & Persistent Storage

A Flutter application demonstrating foundational state management and local data persistence. This project serves as the Week 2 deliverable for my Flutter Development Internship track.

## 📱 Project Overview

This repository contains two mini-applications accessible from a central home screen navigation hub. It showcases how to manage dynamic UI states and how to save user data locally so it persists even after the app is completely closed and restarted.

### ✨ Features & Learning Outcomes

* **Central Navigation Hub:** A unified home screen routing to different task modules.
* **Counter App (State & Integer Storage):**
  * Manages UI state using `setState()`.
  * Increments and decrements a counter value.
  * Uses `SharedPreferences` to save the integer value and retrieve it automatically inside `initState()` upon app restart.
* **To-Do List App (Dynamic Lists & Array Storage):**
  * Takes user input via `TextFormField` and dynamically adds it to a task list.
  * Renders the list efficiently using `ListView.separated()`.
  * Serializes and saves the entire `List<String>` to local storage using `SharedPreferences`, ensuring tasks are never lost.

## 📂 Project Structure

The codebase is organized to separate the navigation hub from the individual task screens cleanly:

```text
lib/
│
├── main.dart                # App entry point and theme setup
└── screens/
    ├── home_screen.dart     # Main menu for navigation
    ├── counter_screen.dart  # Task 1 & 2 logic (State + Int Storage)
    └── todo_screen.dart     # Task 3 logic (Lists + Array Storage)