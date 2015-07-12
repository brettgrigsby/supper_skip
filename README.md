# SUPPER SKIP

## Multitenancy -- Iteration 1

### Registering a Restaurant:

* As a registered user, I see an option to "register a new restaurant/store"

* When registering a restaurant, user must enter name, and description, slug (optional)

* If no slug is entered, generate one for them using the dash-er-ized-lower-cased version of the restaurant name

* No 2 restaurants should be able to have the same slug or name

### Viewing a Restaurant:

* After registering a restaurant, I should be taken to its "homepage", which should have a unique URL using the restaurant's slug. 
  (This could be done via a path, e.g. /restaurants/woraces-jerky-shop or via subdomains, e.g. woraces-jerky-shop.mysite.com)
  
* On the restaurant home page, I should see a list of all items associated with my restaurant.

### Item/Order/User Relationships:

* The restaurant's main page should show all those items that are attached to it.
  (Indirectly, we can also think of a restaurant having its own collection of orders and customers via the items it sells, but we will leave it up to you to determine how this is modeled.)

### Managing a Restaurant

* As an owner of a restaurant I can edit/manage it by changing its basic info. Other users (including other owners of different restaurants) should not be able to modify my restaurant's info.

* As an owner, I can create/edit/destroy items for my restaurant. These items should be attached to my specific restaurant, and should not appear on other restaurants' pages. They should appear on the main page for my restaurant.

(Note that we'll be re-purposing the existing Admin functionality to work for individual restaurants. So whenver we talk about features for managing a restaurant from a store owner perspective, this should take place somewhere within the "admin" portion of the site.)

### Browsing Restaurants

* A list of restaurants is  displayed on the user home page.

## Ordering -- Iteration 2

* As a logged-in user, I can browse restaurants on the site and browse items sold by those restaurants. I can add items from multiple stores to my cart.

* With items in my cart, when checking out, I should see the existing dinner dash order flow, with my items divided by the store to which they belong.

* Once I complete my order, I should land on an order display page showing my items ordered by restaurant, as well as total spent and order status.

(One question to consider is whether we model orders as a single record attached to multiple businesses via multiple items, or as individual records to separate items ordered for each business.)

## Browsing and Categorization -- Iteration 3

* As a restaurant owner, I should be able to CRUD categories for my restaurant. My categories should be independent of those from other restaurants.

* When users browse my shop, they should see the items organized by categories and have the ability to filter on category.

## Order Flow and Processing -- Iteration 4

* Customer order status should update as it changes.

Status suggestions:
Paid
Ready for Preparation
Cancelled
In Preparation
Ready for Delivery
Out for Delivery
Delivered / Completed
  
* Once preparation begins for an order, it can no longer be cancelled.

* As a store owner, I can see a list of existing orders organized by current status (just as in Dinner Dash, but now for my specific store).

### New Restaurant Roles -- Cooks and Delivery People:

* As a restaurant owner, I have an option in my admin panel to add users as cooks or delivery people, and is done using their email addresses to prevent name duplication
* If a user with the supplied email address already exists in the system, they should be added to my store with the specified role
* If the user does not exist in the system, they should receive an email inviting them to register on the platform. Once they have done so, they should automatically be added to my store.
* Cooks and Delivery People (user classification is "staff") should also be able to see the order status breakdown for restaurants to which they are attached.

### Order Delivery Pipeline:

* Once an order is paid, it's status should become "ready for preparation". As a cook, when viewing an order in this status, I should see an option to "prepare this order".
  Clicking this should:
    * Assign it to me as the preparer/cook
    * Move its status to "in preparation"
    
* As the cook preparing a given order, I should see an option to mark it "ready for delivery". Doing this should update its status to "ready for delivery".

* As a delivery person viewing a list of orders marked "ready for delivery", I should have an option to "deliver this order". Clicking this should assign the order to me as its deliverer and should mark it "out for delivery".

* As the delivery person for an out-for-delivery order, I should have the option to "mark as delivered". This should make the order "completed"

### Supporting Features -- Iterations 5+

Your team needs to complete at least 2 of these. The instructors will work with you to identify which features we want to tackle in a later checkin.

1. Where's My Order / Magic 8-ball

You can't place a pickup order and expect it ready immediately. Predict the pickup time when an order is submitted:

Each item in the store has a preparation time, defaulting to 12 minutes. Items can be edited to take longer.
If an order has more than six items, add 10 minutes for every additional six items.
Each already "paid" order in the system which is not "complete" delays the production start of this new order by 4 minutes.
This information should be displayed to a user on their order page
2. Deals! Deals! Deals!

Store owners may put items or entire categories of items on sale. They can:

Create a "sale" and connect it with individual items or entire categories
Sales are created as a percentage off the normal price
View a list of all active sales
End a sale
On the order "dashboard" they can:

View details of an individual order, including:
If purchased on sale, original price, sale percentage and adjusted price
Subtotal for the order
Discount for the order
Total for the order reflecting any discounts from applicable sales
As a browsing User:

Sale prices are displayed in item listings alongside normal price and percentage savings
3. What's Good Here?

On any item I can, as an Unauthenticated User:

See the posted reviews including:
title, body, and a star rating 0-5
the display name of the reviewer
See an average of the ratings broken down to half-stars
On items I've purchased, as an Authenticated User I can:

Add a rating including:
Star rating 0-5
Title
Body text
4. The Machine Knows What You Like

Implement simple recommendations including:

The ability to easily see your last order and add the same items to the current order
When browsing an item, recommend 3 other items from that store that were ordered by customers who also ordered the item I'm viewing
If 3 other items can't be found, pull the most popular overall items from that store
5. Where Is It?

Implement full-text search for both the consumer and administrator:

Consumer

Search for items in the whole site
Search through "My Orders" for matches in the item name or description
Store Owner

Search orders using a builder-style interface (like Google's "Advanced Search") allowing them to specify any of these:

Status (drop-down)
Order total (drop-down for >, <, = and a text field for dollar-with-cents)
Order date (drop-down for >, <, = and a text field for a date)
Email address of purchaser
6. Transaction Processor

Implement a "checkout" procedure using Stripe, Paypal or another service to handle credit card transactions in a "sandboxed" developer environment.

You may need to add an additional "pending" order status to relect orders that are placed but not yet paid.

When the card is processed, update the order to "paid" and send a confirmation email to the user. Emails should only be sent when the appis in production mode. Don't spam people while you're getting it working.

7. Phone Updates

As a customer, give me the option to add a contact number to my account. Whenever one of my orders changes its status, send me a text including information about the order and its current status.

Additionally, include in the texts a contact number for the restaurant. If I text this number and include the ID for an order, I should receive info about that order including current status, items ordered, etc.

Make sure, however, that I can only receive updates about my own orders.

8. Theming / Custom CSS per Restaurant

Provide a mechanism for store owners to customize the display of their site by:

selecting from a few pre-built themes
provde their own CSS that will be added to the page
For the included themes, focus on the basics like font style and color scheme.

## Evaluation Rubric

Feature Delivery

You'll be graded on each of the criteria below with a score of (1) well below expectations, (2) below expectations, (3) as expected, (4) better than expected.

Completion: Did you complete all base features as well as 2 supporting features?
Organization: did you use your project management tool to keep the project organized?
Technical Quality

Test-Driven Development: (1) disregard for testing, (2) gaps in test usage/coverage/design, (3) adequate testing, (4) exceptional use of testing
Code Quality: (1) poor factoring and understanding of MVC, (2) some gaps in code quality / application of MVC, (3) solid code quality and pushing logic down the stack, (4) exceptionally well factored code
User Experience: (1) inattention to the user experience, (2) some gaps in the UX, (3) UX is clear and makes it easy to navigate around the site (4) UX is especially polished and intuitive
