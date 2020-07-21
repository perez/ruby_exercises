require_relative '../lib/node'
require_relative '../lib/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })

puts "Balanced: #{tree.balanced?}"

puts "Level Order: #{tree.level_order}"

puts "Preorder: #{tree.depth_order(:preorder)}"

puts "Inorder: #{tree.depth_order(:inorder)}"

puts "Postorder: #{tree.depth_order(:postorder)}"

tree.insert(Node.new(115))

tree.insert(Node.new(137))

puts "Balanced: #{tree.balanced?}"

puts "Rebalancing tree..."

tree.rebalance

puts "Balanced: #{tree.balanced?}"

puts "Level Order: #{tree.level_order}"

puts "Preorder: #{tree.depth_order(:preorder)}"

puts "Inorder: #{tree.depth_order(:inorder)}"

puts "Postorder: #{tree.depth_order(:postorder)}"
