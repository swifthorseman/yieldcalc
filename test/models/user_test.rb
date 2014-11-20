require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  #should have_many(:calculators).dependent(:destroy)

  # Test cases for full_name
  test "that the user entered full_name" do
    user = User.new
    assert !user.save
    assert !user.errors[:full_name].empty?
  end

  test "that a user has a valid full name" do
    user = users(:primary_test_user)
    user.full_name = 'Invalid_full_name.'
    assert !user.save
    assert !user.errors[:full_name].empty?
    assert user.errors[:full_name].include?("must start with an alphabet, may contain only alphabets, apostrophes, hyphens and spaces.")
  end

  test "that full_name is at least of the minimum characters allowed" do
    user = User.new
    user.full_name = 'a'
    assert !user.save
    assert !user.errors[:full_name].empty?
    assert user.errors[:full_name].include?("must be between 3 and 255 characters inclusive.")
  end

  test "that full_name is at most of the maximum characters allowed" do
    user = User.new
    user.full_name = 'a' * 256
    assert !user.save
    assert !user.errors[:full_name].empty?
    assert user.errors[:full_name].include?("must be between 3 and 255 characters inclusive.")
  end

  test "that full_name is titleised when saved" do
    full_name = "tinky winky"
    user = User.new
    user.full_name = full_name
    user.telephone = "0123456789"    
    user.email = "tinkywinky@tellytubbies.com"
    user.password = 'password'
    user.encrypted_password = "$2a$10$Fh/Hm8RxDsuPTeBUr6864.GARlcmt7zF2WspaXGr3BIv2C27N.osq"
    assert user.valid?
    assert user.save
    user.reload
    assert_equal full_name.titlecase, user.full_name
  end

  # Test cases for telephone
  test "that the user entered telephone" do
    user = User.new
    assert !user.save
    assert !user.errors[:telephone].empty?
  end

  test "that a user has a valid telephone" do
    user = users(:primary_test_user)
    user.telephone = '00123456789'
    assert !user.save
    assert !user.errors[:telephone].empty?
    assert user.errors[:telephone].include?("must start with a single zero and may contain only numbers.")
  end

  test "that telephone is at least of the minimum characters allowed" do
    user = User.new
    user.telephone = '01'
    assert !user.save
    assert !user.errors[:telephone].empty?
    assert user.errors[:telephone].include?("must be between 10 and 15 characters inclusive.")
  end

  test "that telephone is at most of the maximum characters allowed" do
    user = User.new
    user.telephone = '01' * 8
    assert !user.save
    assert !user.errors[:telephone].empty?
    assert user.errors[:telephone].include?("must be between 10 and 15 characters inclusive.")
  end

  test "that white space within the telephone number is removed" do
    telephone = "01 23 45 67 89"
    user = User.new
    user.full_name = "Tinky Winky"
    user.telephone = telephone
    user.email = "tinkywinky@tellytubbies.com"
    user.password = 'password'
    user.encrypted_password = "$2a$10$Fh/Hm8RxDsuPTeBUr6864.GARlcmt7zF2WspaXGr3BIv2C27N.osq"
    assert user.valid?
    assert user.save
    user.reload
    assert_equal telephone.gsub(/\s+/, ""), user.telephone
  end

  # Valid user
  test "that a valid user can be saved" do
    user = users(:primary_test_user)
    assert user.valid?
    assert user.save
    assert user.errors.empty?
  end

end
