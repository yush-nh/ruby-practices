# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'frame'

class FrameTest < Minitest::Test
  def test_score
    frame = Frame.new(1, 4)
    assert_equal 5, frame.score
  end

  def test_stike?
    frame1 = Frame.new(10, 0)
    assert frame1.strike?
    frame2 = Frame.new(2, 7)
    refute frame2.strike?
  end

  def test_spare?
    frame1 = Frame.new(2, 8)
    assert frame1.spare?
    frame2 = Frame.new(10, 0)
    refute frame2.spare?
    frame3 = Frame.new(1, 1)
    refute frame3.spare?
  end
end
