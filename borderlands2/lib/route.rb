require 'yaml'

# Router class is used to hold, find and list routes between
# maps in borderlands 2.
class Router
  def initialize(maps_file = (File.dirname(__FILE__) + '/maps.yaml'))
    @maps_file = maps_file
    @maps = read_yaml(@maps_file)
    @routes = []
  end

  def read_yaml(file)
    map_data = File.read(file)
    YAML.load(map_data)
  end

  def write_yaml
    yaml_data = YAML.dump(@maps)
    File.open(@maps_file, 'w') { |out_file| out_file.write(yaml_data) }
  end

  # loop over maps from start. On each map add each exit to the list
  # unless there are duplicates (to prevent doubling back). Sort the
  # routes by length and return the shortest three.
  def find_route(start, dest)
    @routes = []
    find_next([], start, dest)
    @routes
  end

  def add_route(map, route)
    # create route's map if it doesn't exist with
    # map as a route.
    unless list_maps.include?(route)
      @maps[route] = [map]
    end
    # add route to map's list.
    @maps[map].push(route)
    # write out the new yaml file.
    write_yaml
  end

  def print_routes(routes)
    puts 'Routes:'
    routes.each do |route|
      puts route.join(' -> ')
    end
  end

  def list_maps
    @maps.keys
  end

  def list_map(map)
    @maps[map]
  end

  # find the next route recursively
  # route: the maps visited so far
  # map: the map we are now on
  # dest: the map we are trying to get to.
  def find_next(route, map, dest)
    new_route = route.dup.push(map)
    if map == dest
      @routes.push(new_route)
    else
      @maps[map].each do |next_map|
        next if new_route.include?(next_map)
        find_next(new_route, next_map, dest)
      end
    end
  end

  def viable_maps(been, current)
    viable = []
    # extract possible routes
    @maps[current].each do |next_map|
      # route is not viable if it is already in the route
      next if been.include?(next_map)
      viable.push(next_map)
    end
    viable
  end
end
