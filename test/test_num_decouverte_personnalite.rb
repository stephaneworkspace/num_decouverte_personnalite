# frozen_string_literal: true

require "test_helper"

class TestNumDecouvertePersonnalite < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::NumDecouvertePersonnalite::VERSION
  end

  # def test_it_does_something_useful
  #  assert false
  # end

  def test_octave
    octave = ::NumDecouvertePersonnalite::OCTAVE

    # Inclus : somme directe des chiffres = 1 à 9
    assert_equal "12/3",    octave[12]   # 1+2=3
    assert_equal "15/6",    octave[15]   # 1+5=6
    assert_equal "17/8",    octave[17]   # 1+7=8
    assert_equal "18/9",    octave[18]   # 1+8=9  (absent de l'ancien hash manuel)
    assert_equal "20/2",    octave[20]   # 2+0=2
    assert_equal "27/9",    octave[27]   # 2+7=9
    assert_equal "45/9",    octave[45]   # 4+5=9
    assert_equal "100/1",   octave[100]  # 1+0+0=1
    assert_equal "1000/1",  octave[1000] # 1+0+0+0=1
    assert_equal "10000/1", octave[10000] # 1+0+0+0+0=1

    # Exclus : somme > 9
    assert_nil octave[28]   # 2+8=10
    assert_nil octave[37]   # 3+7=10
    assert_nil octave[91]   # 9+1=10
    assert_nil octave[82]   # 8+2=10

    # Exclus : nombres maîtres
    assert_nil octave[22]
    assert_nil octave[33]

    # Exclus : nombres karmiques
    assert_nil octave[13]
    assert_nil octave[14]
    assert_nil octave[16]
    assert_nil octave[19]
  end

  def test_it_separates_correctly
    def separate(nom)
      ::NumDecouvertePersonnalite.send(:separate, nom)
    end
    assert_equal %w[Jean Henri], separate("Jean-Henri")
    assert_equal %w[Jean Henri], separate("Jean Henri")
    assert_equal %w[Jean Paul Henri], separate("Jean-Paul Henri")
  end

  def test_lettre
    def valeur_lettre(lettre)
      ::NumDecouvertePersonnalite.send(:valeur_lettre, lettre)
    end
    assert_equal 1, valeur_lettre("a")
    assert_equal 1, valeur_lettre("a")
    assert_equal 2, valeur_lettre("b")
    assert_equal 3, valeur_lettre("c")
    assert_equal 4, valeur_lettre("d")
    assert_equal 5, valeur_lettre("e")
    assert_equal 6, valeur_lettre("f")
    assert_equal 7, valeur_lettre("g")
    assert_equal 8, valeur_lettre("h")
    assert_equal 9, valeur_lettre("i")
    assert_equal 1, valeur_lettre("j")
    assert_equal 2, valeur_lettre("k")
    assert_equal 3, valeur_lettre("l")
    assert_equal 4, valeur_lettre("m")
    assert_equal 5, valeur_lettre("n")
    assert_equal 6, valeur_lettre("o")
    assert_equal 7, valeur_lettre("p")
    assert_equal 8, valeur_lettre("q")
    assert_equal 9, valeur_lettre("r")
    assert_equal 1, valeur_lettre("s")
    assert_equal 2, valeur_lettre("t")
    assert_equal 3, valeur_lettre("u")
    assert_equal 4, valeur_lettre("v")
    assert_equal 5, valeur_lettre("w")
    assert_equal 6, valeur_lettre("x")
    assert_equal 7, valeur_lettre("y")
    assert_equal 8, valeur_lettre("z")
    assert_equal 5, valeur_lettre("é")
    assert_equal 5, valeur_lettre("è")
    assert_equal 5, valeur_lettre("ë")
    assert_equal 5, valeur_lettre("ê")
    assert_equal 3, valeur_lettre("ç")
    assert_equal 3, valeur_lettre("û")
    assert_equal 3, valeur_lettre("ü")
    assert_equal 9, valeur_lettre("î")
    assert_equal 6, valeur_lettre("ô")
    assert_equal 6, valeur_lettre("ö")
    assert_equal 1, valeur_lettre("â")
    assert_equal 1, valeur_lettre("à")
    assert_equal 1, valeur_lettre("a".upcase)
    assert_equal 2, valeur_lettre("b".upcase)
    assert_equal 3, valeur_lettre("c".upcase)
    assert_equal 4, valeur_lettre("d".upcase)
    assert_equal 5, valeur_lettre("e".upcase)
    assert_equal 6, valeur_lettre("f".upcase)
    assert_equal 7, valeur_lettre("g".upcase)
    assert_equal 8, valeur_lettre("h".upcase)
    assert_equal 9, valeur_lettre("i".upcase)
    assert_equal 1, valeur_lettre("j".upcase)
    assert_equal 2, valeur_lettre("k".upcase)
    assert_equal 3, valeur_lettre("l".upcase)
    assert_equal 4, valeur_lettre("m".upcase)
    assert_equal 5, valeur_lettre("n".upcase)
    assert_equal 6, valeur_lettre("o".upcase)
    assert_equal 7, valeur_lettre("p".upcase)
    assert_equal 8, valeur_lettre("q".upcase)
    assert_equal 9, valeur_lettre("r".upcase)
    assert_equal 1, valeur_lettre("s".upcase)
    assert_equal 2, valeur_lettre("t".upcase)
    assert_equal 3, valeur_lettre("u".upcase)
    assert_equal 4, valeur_lettre("v".upcase)
    assert_equal 5, valeur_lettre("w".upcase)
    assert_equal 6, valeur_lettre("x".upcase)
    assert_equal 7, valeur_lettre("y".upcase)
    assert_equal 8, valeur_lettre("z".upcase)
    assert_equal 5, valeur_lettre("é".upcase)
    assert_equal 5, valeur_lettre("è".upcase)
    assert_equal 5, valeur_lettre("ë".upcase)
    assert_equal 5, valeur_lettre("ê".upcase)
    assert_equal 3, valeur_lettre("ç".upcase)
    assert_equal 3, valeur_lettre("û".upcase)
    assert_equal 3, valeur_lettre("ü".upcase)
    assert_equal 9, valeur_lettre("î".upcase)
    assert_equal 6, valeur_lettre("ô".upcase)
    assert_equal 6, valeur_lettre("ö".upcase)
    assert_equal 1, valeur_lettre("â".upcase)
    assert_equal 1, valeur_lettre("à".upcase)
  end

  def test_vibration_de_noms
    def chaine_de_caractere_individuelle(nom, symbol)
      ::NumDecouvertePersonnalite.send(:chaine_de_caractere_individuelle, nom, symbol)
    end
    nom = "Stéphane"
    # Voyelle  11/2
    # Consonne 23/5
    # Total    30/3
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 2, voyelle[:nombre_reduit]
    assert_equal "11/2", voyelle[:nombre_presentation]
    assert_equal "__5__1_5", voyelle[:ligne_caractere_vers_chiffre]
    assert_equal 5, consonne[:nombre_reduit]
    assert_equal "23/5", consonne[:nombre_presentation]
    assert_equal "12_78_5_", consonne[:ligne_caractere_vers_chiffre]
    assert_equal 7, total[:nombre_reduit]
    assert_equal "34/7", total[:nombre_presentation]
    assert_equal "12578155", total[:ligne_caractere_vers_chiffre]
    assert_equal "__5__1_5", voyelle[:resultat][0][0]
    assert_equal :base, voyelle[:resultat][0][1]
    assert_equal "11/2", voyelle[:resultat][1][0]
    assert_equal :final, voyelle[:resultat][1][1]
    assert_equal "12_78_5_", consonne[:resultat][0][0]
    assert_equal :base, consonne[:resultat][0][1]
    assert_equal "23/5", consonne[:resultat][1][0]
    assert_equal :final, consonne[:resultat][1][1]
    assert_equal "12578155", total[:resultat][0][0]
    assert_equal :base, total[:resultat][0][1]
    assert_equal "34/7", total[:resultat][1][0]
    assert_equal :final, total[:resultat][1][1]

    nom = "Thomas"
    # Voyelle  7
    # Consonne 15/6
    # Total    22/4
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 7, voyelle[:nombre_reduit]
    assert_equal "7", voyelle[:nombre_presentation]
    assert_equal 6, consonne[:nombre_reduit]
    assert_equal "15/6", consonne[:nombre_presentation]
    assert_equal 4, total[:nombre_reduit]
    assert_equal "22/4", total[:nombre_presentation]
    assert_equal "7", voyelle[:resultat][1][0]
    assert_equal :final, voyelle[:resultat][1][1]

    nom = "Bressani"
    # Voyelle  15/6
    # Consonne 18/9
    # Total    33/6
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 6, voyelle[:nombre_reduit]
    assert_equal "15/6", voyelle[:nombre_presentation]
    assert_equal 9, consonne[:nombre_reduit]
    assert_equal "18/9", consonne[:nombre_presentation]
    assert_equal 6, total[:nombre_reduit]
    assert_equal "33/6", total[:nombre_presentation]

    nom = "Pedroli"
    # Voyelle  20/2
    # Consonne 23/5
    # Total    43/7
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 2, voyelle[:nombre_reduit]
    assert_equal "20/2", voyelle[:nombre_presentation]
    assert_equal 5, consonne[:nombre_reduit]
    assert_equal "23/5", consonne[:nombre_presentation]
    assert_equal 7, total[:nombre_reduit]
    assert_equal "43/7", total[:nombre_presentation]

    nom = "Elvis"
    # Voyelle  14/5
    # Consonne 8
    # Total    22/4
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 5, voyelle[:nombre_reduit]
    assert_equal "14/5", voyelle[:nombre_presentation]
    assert_equal 8, consonne[:nombre_reduit]
    assert_equal "8", consonne[:nombre_presentation]
    assert_equal 4, total[:nombre_reduit]
    assert_equal "22/4", total[:nombre_presentation]

    nom = "Mario"
    # Voyelle  16/7
    # Consonne 13/4
    # Total    30/3
    voyelle = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::VOYELLE)
    consonne = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::CONSONNE)
    total = chaine_de_caractere_individuelle(nom, NumDecouvertePersonnalite::Nature::TOUT)
    assert_equal 7, voyelle[:nombre_reduit]
    assert_equal "16/7", voyelle[:nombre_presentation]
    assert_equal 4, consonne[:nombre_reduit]
    assert_equal "13/4", consonne[:nombre_presentation]
    assert_equal 2, total[:nombre_reduit]
    assert_equal "11/2", total[:nombre_presentation]
  end

  def test_triangle_cercle_carre
    # stat
    assert_equal "17/8", ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::VOYELLE)
    assert_equal "25/7", ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::CONSONNE)
    assert_equal "24/6", ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::TOUT)
    # stat2 pour recomposer les noms composés
    assert_equal "17/8", ::NumDecouvertePersonnalite.stat2("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::VOYELLE)
    assert_equal "16/7", ::NumDecouvertePersonnalite.stat2("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::CONSONNE)
    assert_equal "15/6", ::NumDecouvertePersonnalite.stat2("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::TOUT)
    # 29 -> 11/2
    assert_equal "11/2", ::NumDecouvertePersonnalite.stat("Stéphane", "Tho", "Bressani-Pef", NumDecouvertePersonnalite::Nature::TOUT)
  end

  def test_transform
    ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::VOYELLE)
    ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::CONSONNE)
    ::NumDecouvertePersonnalite.stat("Stéphane", "Thomas", "Bressani-Pedroli", NumDecouvertePersonnalite::Nature::TOUT)
  # assert_equal %w[Stéphane Thomas Bressani Pedroli],
  #              ::NumDecouvertePersonnalite.etat_civil("Stéphane",
  #                                                     "Thomas",
  #                                                     "Bressani-Pedroli")
  #             ::NumDecouvertePersonnalite.etat_civil("Stéphane",
  #                                                    "Thomas",
  #                                                    "Bressani-Pedroli")
    ::NumDecouvertePersonnalite.etat_civil("Stéphane", "Thomas", "Bressani-Pedroli")
    ::NumDecouvertePersonnalite.etat_civil2("Stéphane", "Thomas", "Bressani-Pedroli")
  end

  def test_date
    ::NumDecouvertePersonnalite.calcul_theme(3,4,1986)
  end
end
