require './config/environment'
require './app/controllers/application_controller'

use Rack::MethodOverride
run ApplicationController
use UsersController
use BooksController 
