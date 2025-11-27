# Pharmacy Application (Flutter + Firestore)

A lightweight, mobile-first pharmacy management app built with Flutter and Firebase (Firestore + Firebase Authentication). The app supports inventory, prescriptions, customers, sales, and includes an admin page to add and manage products.

## Table of contents

-   Summary
-   Features
-   Tech stack
-   Prerequisites
-   Installation
-   Firebase configuration
-   Firestore structure & security
-   Running
-   Admin page
-   Testing
-   Deployment

## Summary

This repository contains a Flutter client that uses Firestore to store data and Firebase Authentication for user accounts. Admin users can add or update products via a dedicated admin page. Designed for clinics, retail, or hospital use with role-based access.

## Features

-   Inventory management (stock levels, expirations, batch numbers)
-   Prescription intake and dispensing workflow
-   Customer profiles and medical notes
-   Sales/orders, receipts and returns
-   Admin page to add/edit products
-   Role-based access control (admin, pharmacist, assistant)
-   Basic analytics and audit logs (stored in Firestore)

## Tech stack

-   Frontend: Flutter (Dart)
-   Backend: Firebase Firestore (database), Firebase Authentication
-   Optional: Firebase Cloud Functions (server logic), Firebase Storage (images)

## Prerequisites

-   Flutter SDK (stable)
-   Firebase project with Firestore and Authentication enabled
-   Firebase CLI (for emulators/deployment)
-   Android/iOS device or emulator

## Installation

1. Clone the repo:
   git clone <repo-url> && cd <repo-directory>
2. Install dependencies:
   flutter pub get
3. Configure Firebase (see next section)
4. Run:
   flutter run

## Firebase configuration

-   Create a Firebase project and enable:
    -   Firestore (in native mode)
    -   Authentication (Email/Password or providers you need)
    -   (Optional) Cloud Functions, Storage
-   Download platform config files:
    -   Android: google-services.json
    -   iOS: GoogleService-Info.plist
-   Place files in respective platform folders and rebuild.

## Firestore structure (suggested)

-   collections:
    -   users/{userId} { role: "admin"|"pharmacist"|"assistant", name, email }
    -   products/{productId} { name, sku, price, stock, expiry, batch }
    -   prescriptions/{id} { patientId, items, status, issuedBy }
    -   sales/{id} { items, total, customerId, createdAt }
    -   audits/{id} { action, userId, timestamp, details }

## Security rules (high level)

-   Allow reads/writes based on user role.
-   Only admin role can create/update products.
-   Log sensitive changes to audits collection.
    Example: require request.auth != null and get(/databases/$(default)/documents/users/$(request.auth.uid)).data.role == 'admin' for product writes.

## Admin page

-   Access controlled by user role = admin.
-   Admin can:
    -   Add new products (name, SKU, price, stock, expiry, batch)
    -   Edit product details and stock levels
    -   View product list and search
-   UI: a dedicated route/screen in the Flutter app guarded by auth checks.

## Running & development tips

-   Use Firebase emulators for local development:
    firebase emulators:start
-   Hot reload with:
    flutter run --debug
-   Use environment configurations/flutter flavors for dev vs prod Firebase projects.

## Testing

-   Unit tests: flutter test
-   Widget/integration tests: flutter drive / flutter test integration_test
-   Linting: flutter analyze
-   Format: dart format .

## Deployment

-   Android: flutter build apk / appbundle
-   iOS: flutter build ios
-   Web: flutter build web
-   Use Firebase Hosting or CI pipelines as needed for ancillary web admin dashboards.
