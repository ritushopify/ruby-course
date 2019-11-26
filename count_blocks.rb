# This solves the Advent Code 2016 problem with directions needing simplifying.
route_filename = './route.txt'
file = File.open(route_filename, 'r') # route.txt downloaded from Advent site
route = file.read
blocks = route.split(', ') # blocks is a collection of "L5", "R6", etc.
x_blocks = 0 # tracking how many blocks they have gone n each direction
y_blocks = 0
dirs = [:N, :E, :S, :W] # Always keep the direction they're facing at the front
blocks.each do |a_dir|
  turn = a_dir[0] # this is the L or R
  num_blocks = a_dir.slice(1..-1).to_i # this is how many blocks they need to go

  # rotate R or L by making the proper direcction go in front N->E->S->W
  # for Right turn, and other way for left
  rotate = turn == 'R' ? 1 : -1
  dirs.rotate!(rotate)

  new_dir = dirs[0] # the new direction is the first one

  # it's like an x or y axis, so W or S means negative direction.
  (num_blocks = -num_blocks) if (new_dir == :W) || (new_dir == :S)

  # now just incrementing the total blocks
  if (new_dir == :W) || (new_dir == :E)
    x_blocks += num_blocks
  else
    y_blocks += num_blocks
  end
end
puts x_blocks.abs + y_blocks.abs
