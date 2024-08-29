# Use an official Python runtime as a parent image
FROM python:3.11

# Set environment variables
ENV FLASK_APP=backend
ENV FLASK_RUN_HOST=0.0.0.0

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app/

# Expose port 5000 for the app
EXPOSE 5000

# Define environment variable for Flask
ENV FLASK_ENV=production

# Run the Flask application using gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "backend:app"]
