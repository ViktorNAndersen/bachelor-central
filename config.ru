# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server


use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
            /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/

    resource '/file/list_all/', :headers => 'x-domain-token'
    resource '/file/at/*',
             :methods => [:get, :post, :put, :delete, :options],
             :headers => 'x-domain-token',
             :expose  => ['Some-Custom-Response-Header'],
             :max_age => 600
    # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end
