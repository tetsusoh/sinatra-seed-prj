require 'sinatra'
require 'logger'
require 'tilt/haml'
require 'haml'

class ::Logger; alias_method :write, :<<; end

class MyApp < Sinatra::Application

    set :root, File.dirname(__FILE__)
    set :public_folder, settings.root + '/static'
    set :views, settings.root + "/app/views"
    set :static_cache_control, [:public, :must_revalidate, :max_age => 300]

    configure :production do
        # disable sinatra logging. use self defiend logger
        disable :logging

        $log = ::Logger.new("log/app.log")
        $log.level = Logger::INFO
        use Rack::CommonLogger, $log
    end

    configure :testing do
        # disable sinatra logging. use self defiend logger
        disable :logging

        $log = ::Logger.new(STDOUT)
        $log.level = Logger::INFO
        use Rack::CommonLogger, $log
    end

    configure :development do
        # disable sinatra logging. use self defiend logger
        disable :logging

        $log = ::Logger.new(STDOUT)
        $log.level = Logger::DEBUG
        use Rack::CommonLogger, $log
    end

    get('/') do 
        $log.debug {"debg log"} 
        $log.info {"info log"}
        $log.warn {"info log"}
        "Hello, sinatra!"
    end

    get('/login') do 
        haml :login, :format => :html5
    end

    # start the server if ruby file executed directly
    run! if __FILE__ == $0
end
