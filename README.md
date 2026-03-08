# flutter_user_ecomm_app

#### Flutter E-Commerce App with Stripe Payment & Firebase Backend

## Project Overview

A full-stack mobile e-commerce application built with Flutter, implementing a scalable architecture with BLoC state management, Firebase Firestore backend, and Stripe payment integration with webhook verification.

This project demonstrates real-world mobile commerce architecture including product browsing, cart management, checkout, secure payment processing, and backend-driven order confirmation.

Key Features
Product Catalog
- Products stored in Firebase Firestore
- Dynamic product loading using BLoC state management
- Product details view with images, price, and stock information

Shopping Cart
- Add/remove products to cart
- Quantity management
- Real-time total price calculation

Checkout & Orders
- Create orders stored in Firestore
- Transaction record created for each payment attempt
- Order lifecycle management (PENDING → PAID / FAILED)

Stripe Payment Integration
- Secure payment using Stripe PaymentSheet
- PaymentIntent created via Firebase Cloud Functions
- Stripe metadata includes orderId and transactionId for traceability

Webhook-Based Payment Confirmation
- Stripe Webhooks handled via Firebase Functions
- Server verifies webhook signature using STRIPE_WEBHOOK_SECRET

Backend updates:
- Payment transaction status
- Order status (PAID / FAILED)

## Project Architecture
📱 Presentation Layer

* Screens
* Providers
* UI state
* Calls application services

🧠 Application Layer

* OrderService
* PaymentService
* CartProvider
* Handles use cases

🏛 Domain Layer

* Product
* CartItem
* Order
* PaymentTransaction
* Enums

🌐 Infrastructure Layer

* Firebase repositories
* Stripe backend API
* Webhook handling

## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

