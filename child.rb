#!/usr/bin/env ruby

puts "[#{Process.pid}] : #{__FILE__} launched."

spawn('ruby', 'grandchild.rb')

puts "[#{Process.pid}] : #{__FILE__} exit."
