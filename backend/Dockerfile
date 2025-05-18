# Stage 1: Dependencies
FROM python:3.11-slim AS base
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy application code explicitly
COPY manage.py /app/manage.py
COPY system /app/system

# Expose port and run the application
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
