# Tiny Blog
* List all posts but limit up to 3 posts can read before sign in
* Must sign in to create/comment a post 
* Only the creator can delete the post

### User model
username :string
password :password_digest
---
has_many :posts
has_many :comments through :posts

### Post model 
title :string
content :text
likes :integer
user_id :integer
----
belongs_to :user

### Comment model 
user_id :integer
post_id :integer
content :text
------
belongs_to :user 
belongs_to :post


# features may add
* Admin role has permission to see Users role and change their roles 
* Admin and the creator of the post can edit/delete the post

## Routes 
* /home - /posts#index - list all posts
* /post_detail - /posts#show - this is only for logged in user
* /write - post /posts#create - this is only for logged in user
* /login - post /session#create - apply to all
* /signup - post /users#create - apply to all
* /logout - post /session#destroy - apply to all

### Configure Cookies and Session
In config/application.rb add following 
```
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActiceDispatch::Session::CookieStore

    config.action_dispatch_cookies_same_site_protection = :strict
```
Then add following line in App/application_controller.rb to active the Cookies/Session in the App
```
    include ActionController::Cookies
```