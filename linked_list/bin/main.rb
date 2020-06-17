require_relative '../lib/linked_list'
require_relative '../lib/node'

list = LinkedList.new

list.append(20)
list.append(30)
list.append(40)
list.prepend(10)

puts list

# puts list.size

# puts list.head
# puts list.tail

# puts list.at(0)
# puts list.at(2)
# puts list.at(100)

# list.pop

# puts list.contain?(40)
# puts list.contain?(1000)

# puts list.find(30)
# puts list.find(55)

# list.insert_at(5, 0)
# puts list
# list.insert_at(25, 3)
# puts list
# list.insert_at(75, 6)
# puts list

# puts list.remove_at(0)
# puts list.remove_at(2)
# puts list.remove_at(8)
