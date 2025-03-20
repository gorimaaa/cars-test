# Technical test for Roadstr

This webapp is a car booking platform where users can book cars and manage reservations. Admins can view current bookings, send reminder emails for pending bookings, and send confirmation emails when a booking is paid. Users can customize their bookings with location and insurance options.

## Tech Stack

- **Backend**: Ruby on Rails
- **Database**: SQLite
- **Authentication**: Devise 
- **Mailing**: ActionMailer 
- **CSS**: Tailwindcss
## Setup

Follow these steps to get the project up and running on your local machine.

### 1. **Clone the repository**

```bash
git clone <repository_url>
cd cars-test
```

### 2. **Install dependencies**

Make sure you have Ruby and Rails installed. Then, run the following command to install the necessary gems:

```bash
bundle install
```

### 3. **Database Setup**

Run the following commands to set up your database:

```bash
rails db:create
rails db:migrate
rails db:seed
```

This will create the necessary tables and populate them with seed data.

### 4. **Start the Rails server**

Run the following command to start the Rails server:

```bash
rails server
```

You can now access the application at `http://localhost:3000`.

## Seed Data

The project includes sample seed data for users and car locations : 
- User account : 
	- email: user@roadstr.fr
	- password: 123456
- Admin account :
	- email: admin@roadtstr.fr
	- password: 123456

## How to Use

- **Admin Users** can log in to the dashboard and trigger emails for both reminders and confirmations.
- **Customers** can choose a car location, see his reservations, choose delivery locations, and select insurance types.

### Issues : 
- **Mailing system** : For the mailing system you have to go in `tmp/letter_opener` to see the new mails, I was not able to make them appear when received on the navigator
- **Models** : I didn't use the models because the logic and verification were quite small, so I did these things in the controllers 
- **CSS**: I mostly generated the tailwindcss code because I didn't got the time to do a nice frontend
- **Lack of verification on user input**: I didn't do a lot of verification on user inputs, we need to add a verification for the size, type of data etc
- **Database structure**: The database structure is quite bad, I wanted to add relations between the tables but since I seeded the car locations data it was quite difficult to make a good database structure, if a user could create a location offer I would have done :  UserTable 1 - * LocationTable && UserTable 1 - * ReservationTable && LocationTable 1 - 0..1 ReservationTable 
### **Comments**:
- I worked 16h~ on this technical test, I learned how ruby and ruby on rails worked during the development
- The code is not quite clean for the backend because I didn't got the time to learn how to do DTO's, proper Exception etc in Ruby on Rails