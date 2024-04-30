# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../game'

class GameTest < Minitest::Test
  def test_game1
    game1 = Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5')
    assert_equal 139, game1.point
  end

  def test_game2
    game2 = Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X')
    assert_equal 164, game2.point
  end

  def test_game3
    game3 = Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4')
    assert_equal 107, game3.point
  end

  def test_game4
    game4 = Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0')
    assert_equal 134, game4.point
  end

  def test_game5
    game5 = Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,1,8')
    assert_equal 144, game5.point
  end

  def test_game6
    game6 = Game.new('X,X,X,X,X,X,X,X,X,X,X,X')
    assert_equal 300, game6.point
  end

  def test_game7
    game7 = Game.new('X,X,X,X,X,X,X,X,X,X,X,2')
    assert_equal 292, game7.point
  end

  def test_game8
    game8 = Game.new('X,0,0,X,0,0,X,0,0,X,0,0,X,0,0')
    assert_equal 50, game8.point
  end
end
