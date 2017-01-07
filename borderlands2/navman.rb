#!/usr/bin/env ruby

require_relative 'route.rb'
require 'getoptlong'

def print_maps
  list_maps.sort.each do |name|
    puts name
  end
  exit 0
end

def print_help
  puts "Usage: #{File.basename(__FILE__)} [-h, --help] [-l, --list-maps] [-s, --start LOCATION] [-f, --finish LOCATION]"
  puts
  puts '  [-h, --help] Displays this message.'
  puts '  [-l, --list-maps] Displays a list of known maps in Borderlands 2.'
  puts '  [-s, --start] The name of the map you are currently on.'
  puts '  [-f, --finish] The name of the map you want routes to.'
  puts
  puts 'NOTE: When using start and finish arguments BOTH are required.'
  puts
  exit 0
end

start = nil
finish = nil

opts = GetoptLong.new(
  ["--start", "-s", GetoptLong::REQUIRED_ARGUMENT],
  ["--finish", "-f", GetoptLong::REQUIRED_ARGUMENT],
  ['--list-maps', '-l', GetoptLong::NO_ARGUMENT],
  ["--help", "-h", GetoptLong::NO_ARGUMENT]
)

opts.each do |opt,arg|
  case opt
  when '--help'
    print_help
  when '--list-maps'
    print_maps
  when '--start'
    start = arg
  when '--finish'
    finish = arg
  end
end

if start.nil? || finish.nil?
  puts 'Insufficient locations to find routes.'
  puts
  print_help
else
  find_route(start, finish)
end
