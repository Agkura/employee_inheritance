require "byebug"
class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
  end

  def to_s
    @name
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    employees_total * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end

  def employees_total
    sums = 0
    employees.each do |emp|
      if emp.is_a?(Manager)
        sums += emp.employees_total + emp.salary
      else
        sums += emp.salary
      end
    end
    sums
  end

end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", "F", 1_000_000, nil)
  darren = Manager.new("Darren", "TA M", 78000, ned)
  shawna = Employee.new("Shawna", "TA", 12000, darren)
  david = Employee.new("David", "TA", 10000, darren)
  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
