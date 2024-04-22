require 'minitest/autorun'
require_relative 'frame'

class FrameTest < Minitest::Test
  def test_total
    frame = Frame.new(1, 4)
    assert_equal 5, frame.total
    strike_frame = Frame.new('X')
    assert_equal 10, strike_frame.total
    last_frame = Frame.new(4, 6, 8)
    assert_equal 18, last_frame.total
  end

  def test_stike?
    frame1 = Frame.new('X')
    assert frame1.strike?
    frame2 = Frame.new(2, 7)
    refute frame2.strike?
  end

  def test_spare?
    frame1 = Frame.new(2, 8)
    assert frame1.spare?
    frame2 = Frame.new('X')
    refute frame2.spare?
    frame3 = Frame.new(1, 1)
    refute frame3.spare?
  end
end
