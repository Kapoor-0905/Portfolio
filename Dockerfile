# Use a custom base image with Flutter dependencies
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies for Flutter
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl git unzip xz-utils libglu1-mesa

# Download and install Flutter SDK
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=$FLUTTER_HOME/bin:$PATH
RUN curl -L https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.2.3-stable.tar.xz | tar xJ -C /usr/local/

# Run Flutter doctor to download Flutter dependencies
RUN flutter doctor

# Copy the Flutter application to the container
COPY . .

# Build the Flutter application
RUN flutter build apk

# (Optional) If you need to run the app during the build, uncomment the following line
# RUN flutter run

# (Optional) If you need to specify additional Flutter environment variables, uncomment and set them here
# ENV FLUTTER_ENV=production

# (Optional) If you want to expose a port, uncomment and set it here
# EXPOSE 8080

# (Optional) If you want to specify a command to run the Flutter app when the container starts, uncomment and set it here
# CMD ["flutter", "run", "--release", "-d", "web-server", "--web-port", "8080"]
