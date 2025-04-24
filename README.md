# Online-Education-Platform-with-PostgreSql

This project contains the SQL schema for an **Online Education Platform**, designed using PostgreSQL. It includes the core structure required to manage users, courses, enrollments, certificates, and blog content within the platform.

## 📦 Features

- **User Management:** Register and manage platform members.
- **Course Management:** Define courses with instructors, categories, and timelines.
- **Category Management:** Assign courses to educational categories.
- **Enrollments:** Track which users are enrolled in which courses.
- **Certificates:** Store and assign certificates for completed courses.
- **Blog System:** Allow users to write and publish blog posts.

## 🗃️ Database Schema Overview

### Tables & Relationships

| Table Name             | Description                                      |
|------------------------|--------------------------------------------------|
| `members`              | Stores member information                       |
| `courses`              | Stores course details                           |
| `categories`           | Defines course categories                       |
| `enrollments`          | Manages user-course many-to-many relationship   |
| `certificates`         | Stores certificate details per enrollment       |
| `certificate_assignments` | Assigns certificates to users                 |
| `blog_posts`           | Stores user-written blog posts                  |


