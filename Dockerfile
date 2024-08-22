FROM python:3.12

# Set variable for the path
ENV APP_HOME=/app

# Set the working directory in the container using variable
WORKDIR ${APP_HOME}

# Install pipenv
RUN pip install pipenv

# Set the Python version for pipenv 
RUN pipenv --python $(which python3.12)

# Copy the Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock ./

# Install the dependencies using pipenv
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application will listen on
EXPOSE 5000

# Set the default command to run the application
CMD ["pipenv", "run", "python", "main.py"]