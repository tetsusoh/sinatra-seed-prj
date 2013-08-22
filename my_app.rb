require 'sinatra'
require 'logger'
require 'haml'

class ::Logger; alias_method :write, :<<; end

class MyApp < Sinatra::Application

    configure :production do
        # disable sinatra logging. use self defiend logger
        disable :logging

        $log = ::Logger.new("log/app.log", "daily")
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

    # start the server if ruby file executed directly
    run! if __FILE__ == $0
end
