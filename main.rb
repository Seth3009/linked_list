class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    return 0 if @head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    return nil if index >= size || @head.nil?

    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_node = @head
      @head = nil
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.next_node.nil?
      popped_node = current_node.next_node
      current_node.next_node = nil
    end
    popped_node
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?

    current_node = @head
    index = 0
    until current_node.nil?
      return index if current_node.value == value

      index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    return 'nil' if @head.nil?

    str = ''
    current_node = @head
    until current_node.nil?
      str += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    str + 'nil'
  end

  attr_reader :head

  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def insert_at(value, index)
    index = index.to_i
    if index == 0
      prepend(value)
    elsif index == size
      append(value)
    elsif index < size
      new_node = Node.new(value)
      prev_node = at(index - 1)
      new_node.next_node = prev_node.next_node
      prev_node.next_node = new_node
    end
  end
  
  def remove_at(index)
    if index.zero?
      @head = @head.next_node
    elsif index < size
      prev_node = at(index - 1)
      prev_node.next_node = prev_node.next_node.next_node
    end
  end
end
