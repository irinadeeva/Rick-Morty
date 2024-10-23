# Rick and Morty Characters App

## Overview
This is a simple iOS application developed as a test task. The application uses the **Rick and Morty API** to display a list of characters from the *Rick and Morty* series and provides detailed information about each character when selected.

The project follows the **MVVM+Coordinator** architecture pattern to ensure a clean, maintainable, and scalable code structure. The app also utilizes **Dependency Injection** for managing dependencies and ensures smooth navigation with infinite scroll and pagination.

## Features
- **First Screen**: Displays a list of all *Rick and Morty* characters.
    - Each character is presented in a simple cell containing:
        - Character name
        - Character image
        - Character gender
    - Supports **pagination** and **infinite scrolling** to load more characters dynamically.
    
- **Second Screen**: Displays detailed information about the selected character.
    - Opens when a user taps on a character from the first screen.
    - Shows additional details such as the character's status, species, origin, and more (depending on available API data).

## Technologies Used
- **Swift**: The primary programming language used for iOS development.
- **MVVM+Coordinator**: A design pattern that separates the app's logic from the UI, improving code organization and reusability.
- **REST API**: The app fetches character data from the Rick and Morty API using RESTful requests.
- **Pagination & Infinite Scrolling**: Efficiently handles large datasets by loading characters in chunks.
- **Dependency Injection (DI)**: Used for injecting dependencies to promote testability and flexibility in the app's components.

## Installation
To run the project locally, follow these steps:

1. Clone the repository from GitHub:
   ```bash
   git clone <repository_url>
2. Open the project in Xcode:
   ```bash
  open RickAndMortyApp.xcodeproj

