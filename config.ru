root = ::File.dirname __FILE__
require ::File.join(root, 'my_app')

require 'sprockets'
map '/assets' do
    assets = Sprockets::Environment.new
    assets.append_path 'build/js'
    assets.append_path 'build/css'
    assets.append_path 'build/lib'
    run assets
end

map '/' do
    run MyApp.new
end
