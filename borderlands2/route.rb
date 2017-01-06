#!/usr/bin/env/ruby

$maps = { 
  "Caustic Caverns" => ["Sanctuary"],
  "Sanctuary" => ["Caustic Caverns"],
}

# loop over maps from start. On each map add each exit to the list
# unless there are duplicates (to prevent doubling back). Sort the
# routes by length and return the shortest three.
def find_route(start,dest)
  all_routes = []
  find_next([],start,dest,all_routes)
  puts "Routes:"
  all_routes.each do |route|
    puts route.join(" -> ")
  end
end

# sort the routes by shortest first
def sort_routes(routes)

end

# find the next route recursively
def find_next(route,map,dest,all_routes)
  puts "1: route: #{route} map: #{map.to_s} dest: #{dest}"
  new_route = route.dup
  new_route.push(map)
  if $maps[map].include?(dest)
    new_route.push(dest)
    all_routes.push(new_route)
  else
    # store of possible routes
    viable_maps = []
    # extract possible routes
    $maps[map].each do |next_map|
      # route is not viable if it is already in the route
      next if new_route.include(next_map)
      viable_maps.push(next_map)
    end
    # No viable routes jump out.
    return if viable_maps.length == 0
    # Time for recursion...
    viable_maps.each do |map|
      find_next(new_route,map,dest)
    end
  end
end

find_route("Caustic Caverns", "Sanctuary")
