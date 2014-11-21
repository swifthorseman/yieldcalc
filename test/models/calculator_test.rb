require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase

  # Test cases for post_code
  test "that the user entered post code" do
    calculator = Calculator.new
    assert !calculator.save
    assert !calculator.errors[:post_code].empty?
  end

  test "that post code is valid" do
    calculator = calculators(:primary_calculator)
    calculator.post_code = 'Invalid post code'
    assert !calculator.save
    assert !calculator.errors[:post_code].empty?
    assert calculator.errors[:post_code].include?("Invalid post code.")
  end

  test "that post code is at least of the minimum characters allowed" do
    calculator = Calculator.new
    calculator.post_code = 'SW1X 8'
    assert !calculator.save
    assert !calculator.errors[:post_code].empty?
    assert calculator.errors[:post_code].include?("Invalid post code.")
  end

  test "that post code is at most of the maximum characters allowed" do
    calculator = Calculator.new
    calculator.post_code = 'SW1X 18ER'
    assert !calculator.save
    assert !calculator.errors[:post_code].empty?
    assert calculator.errors[:post_code].include?("Invalid post code.")
  end

  test "that post code is upcased when saved" do
    post_code = "sw1a 1aa"
    calculator = Calculator.new
    calculator.post_code = post_code
    calculator.current_rent = 0.01
    calculator.initial_cost = 1.00
    calculator.user_id = users(:primary_test_user).id
    assert calculator.valid?
    assert calculator.save
    calculator.reload
    assert_equal post_code.upcase, calculator.post_code
  end

  test "that a calculator can have a correctly formatted post code" do
    calculator = calculators(:primary_calculator)
    assert calculator.valid?
    assert calculator.save
    assert calculator.errors.empty?
  end

  # Test cases for current_rent
  test "that the user entered current_rent" do
    calculator = Calculator.new
    assert !calculator.save
    assert !calculator.errors[:current_rent].empty?
  end

  test "that current_rent is valid" do
    calculator = calculators(:primary_calculator)
    calculator.current_rent = 'Invalid rent'
    assert !calculator.save
    assert !calculator.errors[:current_rent].empty?
    assert calculator.errors[:current_rent].include?("is not a number")
  end

  test "that current_rent is greater than zero" do
    calculator = Calculator.new
    calculator.current_rent = 0.00
    assert !calculator.save
    assert !calculator.errors[:current_rent].empty?
    assert calculator.errors[:current_rent].include?("must be greater than 0")
  end

  test "that a calculator saves valid current_rent" do
    calculator = calculators(:primary_calculator)
    assert calculator.valid?
    assert calculator.save
    assert calculator.errors.empty?
  end

 # Test cases for initial_cost
  test "that the user entered initial_cost" do
    calculator = Calculator.new
    assert !calculator.save
    assert !calculator.errors[:initial_cost].empty?
  end

  test "that initial_cost is valid" do
    calculator = calculators(:primary_calculator)
    calculator.initial_cost = 'Invalid initial_cost'
    assert !calculator.save
    assert !calculator.errors[:initial_cost].empty?
    assert calculator.errors[:initial_cost].include?("is not a number")
  end

  test "that initial_cost is greater than zero" do
    calculator = Calculator.new
    calculator.initial_cost = 0.00
    assert !calculator.save
    assert !calculator.errors[:initial_cost].empty?
    assert calculator.errors[:initial_cost].include?("must be greater than 0")
  end

  test "that a calculator saves valid initial_cost" do
    calculator = calculators(:primary_calculator)
    assert calculator.valid?
    assert calculator.save
    assert calculator.errors.empty?
  end


end
