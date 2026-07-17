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

  def test_lettre
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("a")
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("b")
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("c")
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("d")
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("e")
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("f")
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("g")
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("h")
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("i")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("j")
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("k")
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("l")
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("m")
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("n")
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("o")
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("p")
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("q")
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("r")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("s")
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("t")
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("u")
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("v")
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("w")
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("x")
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("y")
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("z")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("é")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("è")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ë")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ê")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ç")
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("û")
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("ü")
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("î")
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("ô")
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("ö")
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("â")
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("à")
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("a".upcase)
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("b".upcase)
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("c".upcase)
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("d".upcase)
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("e".upcase)
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("f".upcase)
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("g".upcase)
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("h".upcase)
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("i".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("j".upcase)
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("k".upcase)
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("l".upcase)
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("m".upcase)
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("n".upcase)
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("o".upcase)
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("p".upcase)
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("q".upcase)
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("r".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("s".upcase)
    assert_equal 2, ::NumDecouvertePersonnalite.valeur_lettre("t".upcase)
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("u".upcase)
    assert_equal 4, ::NumDecouvertePersonnalite.valeur_lettre("v".upcase)
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("w".upcase)
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("x".upcase)
    assert_equal 7, ::NumDecouvertePersonnalite.valeur_lettre("y".upcase)
    assert_equal 8, ::NumDecouvertePersonnalite.valeur_lettre("z".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("é".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("è".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ë".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ê".upcase)
    assert_equal 1, ::NumDecouvertePersonnalite.valeur_lettre("ç".upcase)
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("û".upcase)
    assert_equal 3, ::NumDecouvertePersonnalite.valeur_lettre("ü".upcase)
    assert_equal 5, ::NumDecouvertePersonnalite.valeur_lettre("î".upcase)
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("ô".upcase)
    assert_equal 6, ::NumDecouvertePersonnalite.valeur_lettre("ö".upcase)
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("â".upcase)
    assert_equal 9, ::NumDecouvertePersonnalite.valeur_lettre("à".upcase)
  end
end
