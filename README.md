# Retro Techs - A two-sided marketplace application

## A link (URL) to your published App

## A link to your GitHub repository

# Problems Discovered, Target audience and Application Purpose

For the past 40 years, the landscape of technologies have changed massively. Specifically, the evolution of electronic gadgets has grown much faster than people can ever imagine. In this day and age, we are definitely enjoying the benefits and convenience that the devices bring with them.

Perhaps it is worth looking at the problems found from another perspective. Reminiscence is something human beings share with each other, and it is a symbol of collective memories and emotions that give us comfort and a sense of contentment. 

Given such intensive technological developments, it is believed a large number of consumers are keen to own at least a piece or two of retro electronic devices, even just from a one or two years ago. Nevertheless, such items are very rarely seen in common marketplaces, and in light of this there is a potential niche market for retro techno gadgets. A two-sided marketplace targeting this may very well be a good candidate to tap into the unknown.

# User stories

As a user, I need authentication before I am allowed to proceed to further actions.
As a user, I must be authenticated through a certain means of communication, such as phone or email.

Specifically:

As a seller, I can sell my items in the item index page.
As a seller, I can manage my items ads, such as adjusting the price of my items and modifying the description.
As a seller, I can communicate with the buyer as soon as an order is produced.

As a buyer, I can see the listing of items in the item index page.
As a buyer, I can see the details of the listed items show page
As a buyer, I can communicate with the seller as soon as an order is produced.

As an admin, I can manage all the actions performed on the platform/application.

# Functionality / features

A basic two-sided marketplace application usually has a registration management micro-system to manage users. In terms of security, a sign-up/sign-out interface is set up for users to register. Meanwhile, returning users are required to pass user authentication before they are allowed to make further actions through a sign-in interface. Certainly, users are enabled to edit/update their account details, such as their username, email address and password. In addition, users are able to retrieve their account in case they forget certain details.

With regards to authorisatoin, there is an assignment of roles to three types of users. The admin is in control of the entire application, who will be given the power to manipulate the entire application. For example. they can edit any item information, such as their name, in-stock status and price as well as delete them if necessary. Sellers are allowed to promote their items putting them up for sale at the marketplace by uploading related information, such as item images, yet they are limited to only modifying their own items. Surely, they are buyers at the same time and therefore they are also be able to make purchases. Regular users, namely buyers, are only allowed to make purchases and manage their orders. Finally, unregistered users are not able to do anything but browsing through the items.

In relation to real-time purchase, whenever a buyer finds an item they fancy they can temporarily put it in the shopping cart, and continue with other purchases. Before they decide to make an order, they are able review the items in the shopping cart. Whenever they feel ready, they can proceed to the order page where then can make further payment.

For item management, even though there is not a tree-structure category type of system, customers can still easily check out the imagery. As soon as a customer detects an ideal item, he/she is able to find out more details the item by clicking on the button, and then will be directed to a detail page to learn more about the name, status, price and description. 

# Screenshots

# Sitemap

# Tech Stack

The tech stack for the development of Retro Techs includes a variety of technologies. 

For website styling, basic HTML and CSS alongside a handy framework Bootstrap with its particular grid system are utilised for the overall layout and colour scheme.

Several Ruby Gems are applied in the application:

 Devise is used for user authentication with the immense convenience that comes with it

 Cancancan is used for user authorisation implementation, with which the assignment of different user roles is easily achieved.
 
 AWS S3 is included for item uploading with the combination of cloud services and one of the most distinctive Rails feature ActiveStorage.
 
 SimpleForm is applied for a better user information submission experience.


# Wireframes


# High-level components

A noticeable navigation bar is set up to guide the users for different actions with regards to their purchase experience. 

# Third Party Services

Amazon S3 bucket is applied in the application as a cloud storage service that provides non-stop support which users have access to anywhere at any time along with the functionality of  ActiveStorage.

Stripe is a potential candidate to be added into the application for payment management in the future.

# Description of ActiveRecord Associations

The most obvious association is the one between users and orders. It is a one-to-many association where a user may or may not have an order yet an order exists on the condition a user exists.

Another association is the three-way multi-relations between Orders, OrderItems and Items. In this, an order-item belongs to an order, and an Order has multiple order-items. Meanwhile, an order-item also belongs to the Item collection, and the the order-items come from this collection source.

Nevertheless, an fourth model is introduced in the application called Cart, which acts as a middle-man between order-items and an order before the latter is produced. This is a highly similar model to Order, but at the same time it is temporarily linked to User, because it is to provide users with opportunity to manipulate their decisions before actually making final purchases and can be thrown away after use.Also it will later execute the order-item transfer.

That is why a cart instance is generated by using a session hash. But note an order-item instance is stored in the cart instance and gets 'carried away', and therefore the actual association between an order-item and an cart is that an order-item is dependent on it. Note that at this point an order-item instance has to be created without the existence of an order instance which will be executed later, and therefore the association is set to be optional.

Finally, the id of a cart instance will be set to nil, meaning the the instance is deleted, as soon as the transfer is finished. Although all the order-items from the cart instance are eventually attached to an order instance, they can exist with even the order instance being deleted, and this is for case-scenarios such that an order is canceled by the user or an invoice is generated where there can be potential Invoice model and further transfer. Therefore, an order instance's id can be null on an order-item instance.

In conclusion, Model#order_items are frequently appearing in both controllers and models but data can be accurately delivered because of these associations between the above parties.

# Database Relations

The actual database relations only include the one between users table and orders table, and the three-way multi-related tables because they are the only entities to store and keep track of database changes. Note that the foreign keys of item_id and cart_id on order_item_id are nullable in case of database NotNull Violation over the course of an temporary instance, in this case, being created and deleted.

In short, there is a one-to-many relations between users and orders. The many-to-many between orders and items can be broken down to two one-to-many relations where order-items is a join table. 

