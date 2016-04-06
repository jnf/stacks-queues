require './Stack.rb'
require './Queue.rb'

class Company
  MAX_EMPLOYEES = 6

  attr_reader :waiting, :working

  def initialize
    @waiting = Queue.new
    10.times { |i| wait! i+1 }

    @working = Stack.new

    end_of_the_month
  end

  def end_of_the_month
    fire!
    hire!
  end

  private

  def hire!
    until working.size >= MAX_EMPLOYEES
      new_hire = waiting.dequeue
      working.push new_hire
    end
  end

  def fire!
    return if working.empty?
    number_to_fire.times do
      fired_person = working.pop
      wait! fired_person
    end
  end

  def wait!(person)
    waiting.enqueue person
  end

  def number_to_fire
    rand(6) + 1
  end
end
