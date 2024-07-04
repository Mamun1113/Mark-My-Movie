# Mark My Movie
**Download APK (https://mark-my-movie.uptodown.com/android)**

Mark My Movie is a Flutter-based mobile application that allows users to explore, search and manage their favorite movies. The app provides functionalities to add movies to wishlists, mark them as watched and add them to favorites.

|                                                      Explore Screen                                                       |                                                      Wishlist Screen                                                      |                                                      Watched Screen                                                       |                                                      Favorite Screen                                                      |
| :-----------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: |
| ![Screenshot_1718822030](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/af72add8-be76-49c9-a73a-f96757fce603) | ![Screenshot_1718822042](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/fcbe215d-cc60-420b-b211-719d95738269) | ![Screenshot_1718822045](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/51bbc256-a5ca-45a1-b1d2-e4321aa50fae) | ![Screenshot_1718822048](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/4f9b3c27-f7d1-4922-913e-8a830a46ae97) |

## Features

### 1. Explore Movies

- **Search Functionality:** Users can search for movies using the search bar.
- **Grid View:** Displays search results in a grid format with movie posters, titles, types, years and IMDb IDs.
- **Action Buttons:** Users can add movies to wishlists, mark them as watched or add them to favorites directly from the search results.

### 2. Wishlist

- **List View:** Displays movies added to the wishlist.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
- **Action Buttons:** Users can mark them as watched or add them to favorites.
- **Remove Option:** Users can remove movies from the wishlist.

### 3. Watched Movies

- **List View:** Displays movies marked as watched.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
- **Action Buttons:** Users can add movies to wishlists or add them to favorites.
- **Remove Option:** Users can remove movies from the watched list.

### 4. Favorite Movies

- **List View:** Displays favorite movies.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
- **Action Buttons:** Users can add movies to wishlists or mark them as watched.
- **Remove Option:** Users can remove movies from the favorites list.

## UI Design

- **Curved AppBar and BottomNavigationBar:** The app features a custom-designed AppBar and BottomNavigationBar with curvy shapes and gradient backgrounds for a modern look.
- **Material Design:** Utilizes Flutter's Material Design components for a consistent and intuitive user experience.
- **Custom Fonts:** Uses Google Fonts (Itim) for a unique and stylish typography.

## Screens

### Home Screen

- **Bottom Navigation Bar:** Provides quick navigation between the Explore, Wishlist, Watched, and Favorite screens.
- **Curved Design:** Custom ClipPaths are used to create a curvy design for the AppBar and BottomNavigationBar.

### Explore Screen

- **Search Bar:** Allows users to search for movies.
- **Grid Display:** Shows search results with movie posters and details.
- **Action Buttons:** Allows users to add movies to wishlists, mark as watched, or add to favorites.

### Wishlist Screen

- **List Display:** Shows movies added to the wishlist.
- **Movie Details:** Displays movie posters, titles, types, years, and IMDb IDs.
- **Remove Button:** Allows users to remove movies from the wishlist.

### Watched Screen

- **List Display:** Shows movies marked as watched.
- **Movie Details:** Displays movie posters, titles, types, years, and IMDb IDs.
- **Remove Button:** Allows users to remove movies from the watched list.

### Favorite Screen

- **List Display:** Shows favorite movies.
- **Movie Details:** Displays movie posters, titles, types, years, and IMDb IDs.
- **Remove Button:** Allows users to remove movies from the favorites list.

## Installation

### Prerequisites

- **Flutter SDK:** Ensure you have Flutter installed on your development machine.
- **Android/iOS Device or Emulator:** You need a device or emulator to run the app.

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/mark-my-movie.git
   ```
2. **Navigate to the project directory:**

   ```bash
   cd mark-my-movie
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```
5. **Create android APK:**
   ```bash
   flutter build apk
   ```

### Dependencies

- provider: State management.
- google_fonts: Custom fonts.
- flutter/material.dart: Material design components.
