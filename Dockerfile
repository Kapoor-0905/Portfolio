# Use the official Flutter image as the base image
FROM cirrusci/flutter:latest

# Set the working directory in the container
WORKDIR /app

# Copy the app source code to the container
COPY . .

# Install Flutter dependencies (if you have any additional dependencies)
RUN flutter pub get

# Build the Flutter app for release (change the --release flag to --debug for debugging)
RUN flutter build apk --release

# Optionally, you can run the app with "flutter run" command if you want to test it within the container
# RUN flutter run

# Set the entry point for the container to the built Flutter app
ENTRYPOINT ["flutter", "run", "--release"]

# If you prefer running the Flutter app in a web environment, you can use the following instead:
# ENTRYPOINT ["flutter", "run", "-d", "web-server", "--release"]
