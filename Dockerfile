# Use base image 
FROM python:alpine3.19

# Set the working directory in the container
WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

# Copy all files from the local ./analytics directory to the container's /app directory

COPY ./analytics .

# Install dependencies
RUN pip install -r requirements.txt


# Set Database environment variables
ARG DB_USERNAME=$DB_USERNAME
ARG DB_PASSWORD=$DB_PASSWORD

ENV DB_USERNAME $DB_USERNAME
ENV DB_PASSWORD $DB_PASSWORD

# Run the application
CMD ["python", "app.py"]



