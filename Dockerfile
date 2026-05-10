FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project
COPY . /app/

# Collect static files and run migrations during build (best-effort)
RUN python manage.py collectstatic --noinput || true
RUN python manage.py migrate --noinput || true

EXPOSE 8000

CMD ["sh","-c","python manage.py migrate --noinput && python manage.py collectstatic --noinput && gunicorn meal_buddy.wsgi:application --bind 0.0.0.0:${PORT:-8000} --workers 3"]
