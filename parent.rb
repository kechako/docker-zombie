#!/usr/bin/env ruby

puts "[#{Process.pid}] : #{__FILE__} launched."

if ARGV[0] == '-c'
  Signal.trap(:SIGCHLD) do
    begin
      while pid = Process.wait(-1, Process::WNOHANG)
        puts "[#{Process.pid}] : SIGCHLD sent. [#{pid}] dead."
      end
    rescue Errno::ECHILD
    end
  end
end

spawn('ruby', 'child.rb')

can_exit = false

[:INT, :TERM].each do |signal|
  Signal.trap(signal) do
    puts "[#{Process.pid}] : #{signal} sent."
    can_exit = true
  end
end

sleep 1 until can_exit

puts "[#{Process.pid}] : #{__FILE__} exit."
