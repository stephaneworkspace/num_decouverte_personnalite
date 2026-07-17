# frozen_string_literal: true

require "test_helper"

class TestNumDecouvertePersonalite < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NumDecouvertePersonalite::VERSION
  end

  # def test_it_does_something_useful
  #  assert false
  # end

  def test_it_separates_correctly
    assert_equal %w[Jean Henri], ::NumDecouvertePersonalite.separe("Jean-Henri")
    assert_equal %w[Jean Henri], ::NumDecouvertePersonalite.separe("Jean Henri")
    assert_equal %w[Jean Paul Henri], ::NumDecouvertePersonalite.separe("Jean-Paul Henri")
  end
end
