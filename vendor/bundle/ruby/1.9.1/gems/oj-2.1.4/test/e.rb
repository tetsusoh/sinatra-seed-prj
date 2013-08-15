#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), "../lib")
$: << File.join(File.dirname(__FILE__), "../ext")

require 'oj'

json = %{"\xc2\xa9\xc3\x98"}
puts "original:\n#{json}"

str = Oj.load(json)
puts "out: #{str}"
