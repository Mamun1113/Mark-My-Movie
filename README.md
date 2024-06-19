# Mark My Movie

Mark My Movie is a Flutter-based mobile application that allows users to explore, search and manage their favorite movies. The app provides functionalities to add movies to wishlists, mark them as watched and add them to favorites.

Explore Screen             |Wishlist Screen             |Watched Screen             |Favorite Screen             |
:-------------------------:|:--------------------------:|:-------------------------:|:--------------------------:|
![Screenshot_1718816733](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/751b1f01-a876-425d-a818-d44b447e4a73) | ![Screenshot_1718816746](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/6e7ef949-b0b6-48f4-aa25-f32ea6d50e70) | ![Screenshot_1718816748](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/5ffadaef-e766-43f1-b42c-123f43b4db28) | ![Screenshot_1718816751](https://github.com/Mamun1113/Mark-My-Movie/assets/66373332/48a8cae4-c56a-40fb-897f-43440dd713d9)


## Features

### 1. Explore Movies
- **Search Functionality:** Users can search for movies using the search bar.
- **Grid View:** Displays search results in a grid format with movie posters, titles, types, years and IMDb IDs.
- **Action Buttons:** Users can add movies to wishlists, mark them as watched or add them to favorites directly from the search results.

### 2. Wishlist
- **List View:** Displays movies added to the wishlist.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
- **Remove Option:** Users can remove movies from the wishlist.

### 3. Watched Movies
- **List View:** Displays movies marked as watched.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
- **Remove Option:** Users can remove movies from the watched list.

### 4. Favorite Movies
- **List View:** Displays favorite movies.
- **Details:** Shows movie posters, titles, types, years and IMDb IDs.
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

3. **Run the app:**
   ```bash
   flutter run
   ```

### Dependencies
- provider: State management.
- google_fonts: Custom fonts.
- flutter/material.dart: Material design components.









