FROM python:3.9-slim

# Set up /app as our runtime directory
RUN mkdir /app
WORKDIR /app

# Install dependency
COPY requirements.txt .
RUN pip install -r requirements.txt

# Run as non-root user
RUN useradd -M app
USER app

# Add and run python app
COPY meraki_api_exporter.py .
ENTRYPOINT ["python", "meraki_api_exporter.py"]
CMD []
