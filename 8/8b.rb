def print_grid(grid)
  grid.each do |line|
    puts line.join
  end
end
grid = File.read('input.txt').split(/\r?\n/).map { |line| line.split(//).map(&:to_i) }

DIR_X = [1, 0, 0, -1]
DIR_Y = [0, 1, -1, 0]

def count_visible_trees(grid, tree_height, dir, x, y)
  new_x = x
  new_y = y
  dx = DIR_X[dir]
  dy = DIR_Y[dir]
  count = 0

  loop do
    new_x = new_x + dx
    new_y = new_y + dy
    break if new_x < 0 || new_x >= grid.length || new_y < 0 || new_y >= grid[x].length

    count = count + 1

    break if grid[new_x][new_y] >= grid[x][y] # view is blocked
  end

  count
end

def compute_scenic_score(grid, x, y)
  tree_height = grid[x][y]
  scenic_score = 1
  0.upto(3) do |dir|
    visible_trees = count_visible_trees(grid, tree_height, dir, x, y)

    scenic_score *= visible_trees
  end

  scenic_score
end

number_visible = 0

max_scenic_score = -1

grid.each.with_index do |row, row_idx|
  row.each_with_index do |tree_height, col_idx|
    scenic_score = compute_scenic_score(grid, row_idx, col_idx)

    max_scenic_score = scenic_score if scenic_score > max_scenic_score
  end
end

puts max_scenic_score