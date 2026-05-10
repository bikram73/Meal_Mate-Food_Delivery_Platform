# Meal Mate - Food Delivery Platform

A comprehensive Django-based food delivery web application that connects customers with restaurants and enables seamless ordering and payment processing.

## 📋 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Project](#running-the-project)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Database Models](#database-models)
- [API Endpoints](#api-endpoints)
- [Troubleshooting](#troubleshooting)
- [Future Enhancements](#future-enhancements)

## ✨ Features

### Customer Features
- **User Authentication**: Sign up and sign in functionality
- **Restaurant Discovery**: Browse and view restaurants with ratings and cuisine types
- **Menu Browsing**: View detailed menu items with descriptions, prices, and dietary information
- **Shopping Cart**: Add items to cart with real-time price calculation
- **Checkout**: Secure checkout process
- **Payment Integration**: Razorpay integration for payment processing
- **Order Tracking**: View order history

### Restaurant Admin Features
- **Restaurant Management**: Add, update, and delete restaurant information
- **Menu Management**: Add and manage menu items
- **Restaurant Profile**: Update restaurant details like name, cuisine, and rating

## 🛠️ Tech Stack

- **Backend**: Django 5.2.14
- **Database**: SQLite3
- **Frontend**: HTML, CSS, Django Templates
- **Payment Gateway**: Razorpay API
- **Python Version**: 3.10+

### Dependencies
- Django==5.2.14
- razorpay==2.0.1

## 📦 Prerequisites

- Python 3.10 or higher
- pip (Python package manager)
- Git (for version control)

## 🚀 Installation

### 1. Clone the Repository
```bash
cd d:\real_projects\Meal_mate
```

### 2. Create a Virtual Environment (Optional but Recommended)
```bash
python -m venv venv
venv\Scripts\activate  # On Windows
source venv/bin/activate  # On macOS/Linux
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

Or install packages individually:
```bash
pip install Django==5.2.14
pip install razorpay==2.0.1
```

### 4. Apply Database Migrations
```bash
python manage.py migrate
```

### 5. Create a Superuser (Admin Account)
```bash
python manage.py createsuperuser
```
Follow the prompts to create your admin account.

## ⚙️ Configuration

### settings.py Configuration

The following settings have been configured in `meal_buddy/settings.py`:

- **DEBUG**: Set to `True` for development (disable in production)
- **ALLOWED_HOSTS**: Includes `127.0.0.1` and `localhost` for local development
- **INSTALLED_APPS**: Includes Django built-in apps and the `delivery` app
- **DATABASES**: SQLite3 database configured at `db.sqlite3`

### Razorpay Configuration (Optional)

If you plan to use Razorpay payment gateway:

1. Sign up at [Razorpay](https://razorpay.com)
2. Get your API keys from the dashboard
3. Uncomment and update in `meal_buddy/settings.py`:
```python
RAZORPAY_KEY_ID = 'your_key_id_here'
RAZORPAY_KEY_SECRET = 'your_key_secret_here'
```

## 🏃 Running the Project

### Start the Development Server
```bash
python manage.py runserver
```

The server will start at `http://127.0.0.1:8000/`

### Access the Application
- **Homepage**: http://127.0.0.1:8000/
- **Admin Panel**: http://127.0.0.1:8000/admin/

## 📁 Project Structure

```
Meal_mate/
├── manage.py                    # Django management script
├── db.sqlite3                   # SQLite database
├── requirements.txt             # Python dependencies
├── README.md                    # Project documentation
│
├── meal_buddy/                  # Main project folder
│   ├── __init__.py
│   ├── settings.py             # Project settings
│   ├── urls.py                 # URL routing configuration
│   ├── asgi.py                 # ASGI configuration
│   └── wsgi.py                 # WSGI configuration
│
└── delivery/                    # Main Django app
    ├── __init__.py
    ├── admin.py                # Admin panel configuration
    ├── apps.py                 # App configuration
    ├── models.py               # Database models
    ├── views.py                # Request handlers
    ├── urls.py                 # App-level URL routing
    ├── tests.py                # Test cases
    │
    ├── migrations/             # Database migrations
    │   ├── 0001_initial.py
    │   ├── 0002_restaurant.py
    │   ├── 0003_item.py
    │   ├── 0004_alter_item_vegeterian.py
    │   └── 0005_cart.py
    │
    └── templates/delivery/     # HTML templates
        ├── add_restaurant.html
        ├── admin_home.html
        ├── cart.html
        ├── checkout.html
        ├── customer_home.html
        ├── customer_menu.html
        ├── fail.html
        ├── index.html
        ├── orders.html
        ├── show_restaurants.html
        ├── signin.html
        ├── signup.html
        ├── success.html
        └── update_menu.html
```

## 💾 Database Models

### Customer
- `username`: Customer's username (max 20 characters)
- `password`: Customer's password (max 20 characters)
- `email`: Customer's email (max 20 characters)
- `mobile`: Customer's phone number (max 10 digits)
- `address`: Customer's delivery address (max 50 characters)

### Restaurant
- `name`: Restaurant name (max 20 characters)
- `picture`: Restaurant logo URL
- `cuisine`: Type of cuisine offered (max 200 characters)
- `rating`: Restaurant rating (float value)

### Item
- `restaurant`: Foreign key reference to Restaurant
- `name`: Item name (max 20 characters)
- `description`: Item description (max 200 characters)
- `price`: Item price (float value)
- `vegeterian`: Boolean flag for vegetarian items
- `picture`: Item image URL

### Cart
- `customer`: Foreign key reference to Customer
- `items`: Many-to-many relationship with Items
- `total_price()`: Method to calculate cart total

## 🔗 API Endpoints

### Authentication
- `GET /open_signin` - Display sign-in form
- `GET /open_signup` - Display sign-up form
- `POST /signin` - Process sign-in
- `POST /signup` - Process sign-up

### Restaurant Management
- `GET /open_show_restaurant` - Display all restaurants
- `GET /open_add_restaurant` - Display restaurant creation form
- `POST /add_restaurant` - Create new restaurant
- `GET /open_update_restaurant/<restaurant_id>` - Display restaurant update form
- `POST /update_restaurant/<restaurant_id>` - Update restaurant
- `GET /delete_restaurant/<restaurant_id>` - Delete restaurant

### Menu Management
- `GET /open_update_menu/<restaurant_id>` - Display menu update form
- `POST /update_menu/<restaurant_id>` - Update menu items

### Customer Features
- `GET /view_menu/<restaurant_id>/<username>` - View restaurant menu
- `GET /add_to_cart/<item_id>/<username>` - Add item to cart
- `GET /show_cart/<username>` - View shopping cart
- `GET /checkout/<username>/` - Display checkout page
- `POST /checkout/<username>/` - Process checkout
- `GET /orders/<username>/` - View order history

## 🐛 Troubleshooting

### Server Returns 400 Errors
**Solution**: Make sure `DEBUG = True` and `ALLOWED_HOSTS` includes `127.0.0.1` in `settings.py`

### Database Errors
**Solution**: Run migrations
```bash
python manage.py migrate
```

### Static Files Not Loading
**Solution**: Collect static files
```bash
python manage.py collectstatic
```

### Port Already in Use
**Solution**: Run on a different port
```bash
python manage.py runserver 8080
```

## 🔮 Future Enhancements

- [ ] Real-time order tracking with maps integration
- [ ] Email notifications for orders
- [ ] User ratings and reviews
- [ ] Advanced search and filtering
- [ ] Multiple payment gateway options
- [ ] Restaurant analytics dashboard
- [ ] Mobile app (React Native/Flutter)
- [ ] Promotional codes and discounts
- [ ] Push notifications
- [ ] Restaurant rating and recommendation system
- [ ] Integration with real delivery partners
- [ ] Admin dashboard with detailed analytics

## 📝 Notes

- This is a development version. For production deployment:
  - Set `DEBUG = False`
  - Use a production database (PostgreSQL recommended)
  - Set up proper environment variables
  - Use a production web server (Gunicorn, uWSGI)
  - Enable HTTPS
  - Set up proper security headers

## 📧 Support

For issues or questions, please refer to the code structure and Django documentation at [Django Docs](https://docs.djangoproject.com/)

## 📄 License

This project is open source and available for educational purposes.

---

**Happy coding! 🚀**
