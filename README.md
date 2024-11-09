# Book Management

![](https://raw.githubusercontent.com/hijasahamed/PersonalWebsite/refs/heads/main/book_management.jpg)

App Link : https://drive.google.com/file/d/1Alr4rxcJcZk1C7HiGvTxbHMVDCEpbO8-/view?usp=sharing

Book Management is a Flutter application designed to help users manage and explore a collection of books. The app offers features for browsing, searching, and rating books, as well as viewing author information.

## Features

### Authentication Screen
- **User Registration**: Register using username, password, and confirm password fields. The app stores the JWT token securely using Shared Preferences.
- **Persistent Login**: The app retains the user’s login status by storing the JWT token, ensuring they are navigated directly to the Home Screen when reopening the app if they are already registered.

### Home Screen
- **List of Books**: Displays a collection of books with brief information, including the author and star ratings.
- **Search Functionality**: Allows users to search for books by title, providing a seamless way to find specific books within the app.

### Book Details Screen
- **Detailed View**: Provides in-depth information about a selected book, including title, author, description, and user ratings.

### Add Star Rating Bottom Sheet
- **Rating Feature**: Users can add a star rating for a selected book via a bottom sheet interface. This rating request includes:
  - **Bearer Token in Headers**: Adds the JWT token in headers for authenticated requests.
  - **Book-Specific URL**: Incorporates the `bookId` in the request URL, as specified by the API documentation.
- **Multiple Ratings**: Users can rate the same book multiple times. This functionality is designed for development and testing purposes.

### Authors Screen
- **Authors List**: Displays a list of authors with detailed information for each, allowing users to explore authors and their contributions.

## Getting Started

To get started with this project:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/book_management.git
