#!/usr/bin/env ruby

require_relative 'lib/route.rb'
require 'getoptlong'
require 'erb'
require 'pry'

def print_help
  proc_name = File.basename(__FILE__)
  renderer = ERB.new(File.read(File.dirname(__FILE__) + '/lib/help.erb'))
  res = renderer.result(binding)
  puts res
  exit 0
end

def print_maps(router, map)
  if map.nil? || map == ''
    router.list_maps.sort.each do |name|
      puts name
    end
  else
    puts "#{map} has exits:"
    router.list_map(map).sort.each do |exit|
      puts "\t-#{exit}"
    end
  end
end

def find_route(router, start, finish)
  if start.nil? || finish.nil?
    puts 'Insufficient locations to find routes.'
    puts
    print_help
  else
    routes = router.find_route(start, finish)
    router.print_routes(routes)
  end
end

def add_route(router, start, finish)
  if start.nil? || finish.nil?
    puts 'Insufficient locations to add new route.'
    puts "start: #{start} | finish: #{finish}"
    puts
    print_help
  else
    router.add_route(start, finish)
  end
end

#
# Main code starts here
#
router = Router.new
next_step = nil
start = nil
finish = nil

opts = GetoptLong.new(
  ['--start', '-s', GetoptLong::REQUIRED_ARGUMENT],
  ['--finish', '-f', GetoptLong::REQUIRED_ARGUMENT],
  ['--list-maps', '-l', GetoptLong::OPTIONAL_ARGUMENT],
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--add', '-a', GetoptLong::NO_ARGUMENT],
  ['--route', '-r', GetoptLong::NO_ARGUMENT]
)

opts.each do |opt, arg|
  case opt
  when '--help'
    print_help
  when '--start'
    start = arg
  when '--finish'
    finish = arg
  when '--add'
    next_step = 'add_route'
  when '--route'
    next_step = 'find_route'
  when '--list-maps'
    next_step = 'print_maps'
    start = arg
  end
end

if next_step == 'add_route'
  add_route(router, start, finish)
elsif next_step == 'find_route'
  find_route(router, start, finish)
elsif next_step == 'print_maps'
  print_maps(router, start)
else
  print_help
end
