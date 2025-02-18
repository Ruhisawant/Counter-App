# Counter App

A simple Flutter application that allows users to increment, decrement, reset, undo changes, and maintain a history of counter values. The app also provides a slider to adjust the counter value and a text field to input custom increment values.

## Features

- **Increment & Decrement**: Allows the user to increase or decrease the counter by a specified value.
- **Undo**: Undo the last action made on the counter.
- **Reset**: Resets the counter value and history to the initial state.
- **Custom Increment**: Enter a custom value to increment or decrement the counter.
- **Slider**: Adjust the counter value using a slider.
- **History**: View the history of counter values, displayed horizontally.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/counter-app.git
   ```
   
2. Navigate to the project directory:
   ```bash
   cd counter-app
   ```

3. Install the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

- **Increment**: Press the "Add X" button to increase the counter by the specified value.
- **Decrement**: Press the "Delete X" button to decrease the counter by the specified value.
- **Undo**: Press the "Undo" button to revert the last change.
- **Reset**: Press the "Reset" button to reset the counter to 0 and clear the history.
- **Custom Increment**: Enter a custom increment value in the text field and press "Enter" to use it for the next increment or decrement.
- **Slider**: Adjust the counter using the slider, which updates the counter value in real-time.

## Limitations

- The app prevents the counter from exceeding the maximum (100) or going below the minimum (0) values.
- If the counter reaches the maximum or minimum limit, a message will be displayed.

## Technologies Used

- Flutter
- Dart

Thank you for visiting my app!