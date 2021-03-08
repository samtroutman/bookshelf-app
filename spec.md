# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Sinatra is required and was used to build the app
- [x] Use ActiveRecord for storing information in a database
    ActiveRecord is required in the app and stores information
- [x] Include more than one model class (e.g. User, Post, Category)
    Two models used: user and book
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    User has_many books
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Books belong_to users
- [s] Include user accounts with unique login attribute (username or email)
    Users must login with username and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Books can be added, viewed, edited, and deleted
- [x] Ensure that users can't modify content created by other users
    Controllers make sure the user is logged in and what is shown is individual using current_user helper
- [x] Include user input validations
    Forms have required elements of username, password, book title and author
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
    Had some issues initially with Git commits but have updated them
- [x] Your commit messages are meaningful
    Commit messages succinctly describe commits
- [x] You made the changes in a commit that relate to the commit message
    Commits are relevant to updates
- [x] You don't include changes in a commit that aren't related to the commit message
