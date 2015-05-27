#!/usr/bin/env ruby

puts "[#{Process.pid}] : #{__FILE__} launched."

can_exit = false

[:SIGINT, :SIGTERM].each do |signal|
  Signal.trap(signal) do
    puts "[#{Process.pid}] : #{signal} sent."
    can_exit = true
  end
end

sleep 1 until can_exit

puts "[#{Process.pid}] : #{__FILE__} exit."
