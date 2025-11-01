# SQL Joins for Airbnb Clone

We have used three join operations:
* **INNER JOIN**
  (Used to link Bookings and Users) It only returns the people who successfully appear on both lists. It's an "Only if they Match" rule.
   You only include users who have actually made a booking. If a user hasn't booked anything, or if a booking doesn't belong to a user, it's ignored.
* **LEFT JOIN** (Used to link Properties and Reviews) It prioritizes the "left" list (in our case, Properties).
  It returns everything from the left list, and only what matches from the right (Reviews). It's a "Keep Everything from the Left" rule.

* **FULL OUTER JOIN** (Used to link Users and Bookings) It's the most inclusive. It returns everything from the left list and everything from the right list, trying to match them up when possible.
    It's a "Keep Everything, Matched or Not" rule.
