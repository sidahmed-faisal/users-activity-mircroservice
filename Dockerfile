# Use base image 
FROM python:3.10-slim-buster

# Set the working directory in the container
WORKDIR /src

copy ./analytics/requirements.txt requirements.txt

# Copy all files from the local ./analytics directory to the container's /app directory

# Install dependencies
RUN pip install -r requirements.txt

copy ./db .


# Set Database environment variables
ARG DB_USERNAME=$DB_USERNAME
ARG DB_PASSWORD=$DB_PASSWORD

ENV DB_USERNAME $DB_USERNAME
ENV DB_PASSWORD $DB_PASSWORD

# Run the application
CMD ["python", "analytics/app.py"]



