Flutter Quiz Application 

This Flutter-based quiz application  to create an engaging experience for users. The app fetches quiz data from an API and provides a fun, interactive way to test knowledge, track scores, and improve performance.
Features

    Quiz Interface: Displays multiple choice questions with a timer and score tracking.
    API Integration: Quiz questions are dynamically fetched from an external API
    Scoreboard: Displays the user's total score at the end of the quiz.

Requirements

    Flutter (version >=2.x)
    An active internet connection for fetching data from the API.

Installation
Step 1: Clone the Repository

First, clone the repository to your local machine:

git clone https://github.com/yourusername/flutter-quiz-app.git

Step 2: Install Dependencies

Navigate to the project directory and install the required dependencies:

cd flutter-quiz-app
flutter pub get

Step 3: Run the Application

Once the dependencies are installed, run the app on your device or emulator:

flutter run

API Integration

The app fetches quiz data from a API 

The API returns a list of questions with multiple-choice answers.
Screenshots:

![Screenshot_2025-01-23-21-21-32-42_f6961eafad9dbeda59a672048c3bb4e1](https://github.com/user-attachments/assets/a57abb3b-59cd-4ad0-8ff5-239752cd019a)

![Screenshot_2025-01-23-21-21-37-94_f6961eafad9dbeda59a672048c3bb4e1](https://github.com/user-attachments/assets/96cfabb5-4b86-432f-897c-7b1a8aa7bf08)

![Screenshot_2025-01-23-21-21-44-40_f6961eafad9dbeda59a672048c3bb4e1](https://github.com/user-attachments/assets/e41b0757-f1bd-4407-8b16-c4f4dedd795b)

![Screenshot_2025-01-23-21-21-51-28_f6961eafad9dbeda59a672048c3bb4e1](https://github.com/user-attachments/assets/d4da1868-1ac9-4da2-97bd-1419eeccef65)









Structure

    lib/main.dart: Entry point of the app, handles navigation and UI flow.
    lib/screens/quiz_screen.dart: Main screen for displaying the questions.
    lib/widgets/question_widget.dart: Custom widget for rendering individual questions.
    lib/services/api_service.dart: Service responsible for fetching quiz data from the API.

Contributing

Contributions are welcome! Feel free to open issues or submit pull requests. Please ensure that your changes are well-documented and include appropriate tests.
