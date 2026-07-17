# frozen_string_literal: true

require "test_helper"

class TestNumDecouvertePersonnalite < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NumDecouvertePersonnalite::VERSION
  end

  # def test_it_does_something_useful
  #  assert false
  # end

  def test_it_separates_correctly
    assert_equal %w[Jean Henri], ::NumDecouvertePersonnalite.separeate("Jean-Henri")
    assert_equal %w[Jean Henri], ::NumDecouvertePersonnalite.separeate("Jean Henri")
    assert_equal %w[Jean Paul Henri], ::NumDecouvertePersonnalite.separeate("Jean-Paul Henri")
  end
end
