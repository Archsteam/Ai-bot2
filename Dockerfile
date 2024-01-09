FROM nikolaik/python-nodejs:python3.9-nodejs18

# Exposing port 8000 for the application
EXPOSE 8000

# Upgrading and installing ffmpeg
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copying the application code to the '/app/' directory in the container
COPY . /app/

# Setting the working directory to '/app/'
WORKDIR /app/

# Installing the Python requirements
RUN pip install --no-cache-dir --upgrade --requirement requirements.txt

# Running the application
CMD python3 main.py
