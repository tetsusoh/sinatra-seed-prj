#!/usr/bin/env ruby
# encoding: UTF-8

# Ubuntu does not accept arguments to ruby when called using env. To get warnings to show up the -w options is
# required. That can be set in the RUBYOPT environment variable.
# export RUBYOPT=-w

$VERBOSE = true

$: << File.join(File.dirname(__FILE__), "../lib")
$: << File.join(File.dirname(__FILE__), "../ext")

require 'oj'

reltypes={}
Oj::Doc.open_file('foo.json') do |doc|
  doc.each_child do |target|
    puts "#{target.local_key} is #{target.local_key.class}"
    target.each_leaf do |score|
      reltype=score.local_key
      reltypes[reltype] = (reltypes[reltype] || 0) + 1
    end
  end
end
