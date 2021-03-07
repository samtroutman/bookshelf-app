require './config/environment'
require './app/controllers/application_controller'
require 'sinatra/flash'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride
run ApplicationController
use UsersController
use BooksController 
