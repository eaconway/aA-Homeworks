class Stack

  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def push(el)
    # adds an element to the stack
    @ivar.push(el)
  end

  def pop
    # removes one element from the stack
    @ivar.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @ivar.last
  end
end

class Queue

  def initialize
    @jvar = []
  end

  def enqueue(el)
    @jvar.push(el)
  end

  def dequeue
    @jvar.shift
  end

  def peek
    @jvar.first
  end
end

class Map

  def initialize
    @kvar = []
  end

  def set(k,v)
    if @kvar.none?{|el| el.first == k}
      @kvar << [k,v]
    else
      @kvar.each {|el| el[1] = v if el.first == k}
    end
  end

  def get(k)
    @kvar.select {|el| el.first == k}
  end

  def delete(k)
    @kvar.select! {|el| el.first != k}
  end

  def show
    @kvar
  end
end
