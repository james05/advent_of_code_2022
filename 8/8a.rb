def print_grid(grid)
  grid.each do |line|
    puts line.join
  end
end
grid = File.read('input.txt').split(/\r?\n/).map { |line| line.split(//).map(&:to_i) }

DIR_X = [1, 0, 0, -1]
DIR_Y = [0, 1, -1, 0]

def visible_direction?(grid, tree_height, dir, x, y)
  new_x = x
  new_y = y
  dx = DIR_X[dir]
  dy = DIR_Y[dir]

  loop do
    new_x = new_x + dx
    new_y = new_y + dy
    return true if new_x < 0 || new_x >= grid.length || new_y < 0 || new_y >= grid[x].length

    return false if grid[new_x][new_y] >= grid[x][y]
  end
end

def is_visible?(grid, x, y)
  tree_height = grid[x][y]
  0.upto(3) do |dir|
    return true if visible_direction?(grid, tree_height, dir, x, y)
  end

  false
end

number_visible = 0

grid.each.with_index do |row, row_idx|
  row.each_with_index do |tree_height, col_idx|
    number_visible = number_visible + 1 if is_visible?(grid, row_idx, col_idx)
  end
end

puts number_visible