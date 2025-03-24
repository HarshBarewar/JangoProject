# # Use official Python image
# FROM python:3.9

# # Set the working directory inside the container
# WORKDIR /app

# # Copy project files into the container
# COPY . /app/

# # Install dependencies
# RUN pip install --no-cache-dir django gunicorn

# # Expose port 8000 for Django
# EXPOSE 8000

# # Start the Django server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


    # Use Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy the project files
COPY . /app/

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 8000

# Run migrations and start the Django server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
