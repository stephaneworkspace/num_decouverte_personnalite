# frozen_string_literal: true

require_relative "num_decouverte_personnalite/version"

module NumDecouvertePersonnalite
  class Error < StandardError; end
  VALEURS = {
    "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9,
    "J" => 1, "K" => 2, "L" => 3, "M" => 4, "N" => 5, "O" => 6, "P" => 7, "Q" => 8, "R" => 9,
    "S" => 1, "T" => 2, "U" => 3, "V" => 4, "W" => 5, "X" => 6, "Y" => 7, "Z" => 8,
    # Accents
    "É" => 1, "È" => 1, "Ê" => 1, "Ë" => 1, "Ç" => 1,
    "Û" => 3, "Ü" => 3,
    "Î" => 5,
    "Ô" => 6, "Ö" => 6,
    "Â" => 9, "À" => 9
  }.freeze

  module Nature
    Voyelle = :voyelle
    Consonne = :consonne
    Tout = :tout
  end
  # gem "num_decouverte_personalite", path: "/chemin/vers/num_decouverte_personalite"
  #---
  # bundle install
  #---
  # require "num_decouverte_personalite"
  #
  # puts HelloLib.transform("Stéphane")
  #---
  # publier: gem build num_decouverte_personalite.gemspec
  # puis:    gem push num_decouverte_personalite-0.1.0.gem
  def self.transform(prenom_actif, prenom_secondaire, nom_de_famille)
    "#{prenom_actif} #{prenom_secondaire} #{nom_de_famille}"
  end

  # Divise une entrée en plusieurs parties en utilisant des espaces et des tirets comme séparateurs.
  def self.separate(string)
    string.split(/[\s-]+/)
  end

  def self.valeur_lettre(lettre)
    VALEURS[lettre.upcase]
  end

  def self.niveau_1(string, nature = Nature::Voyelle)
    string.chars.map do |lettre|
      est_voyelle = %w[A E I O U Y É È Ê Ë Â À].include?(lettre.upcase)
      if nature == Nature::Voyelle && est_voyelle
        valeur_lettre(lettre) || "_"
      elsif nature == Nature::Consonne && !est_voyelle
        valeur_lettre(lettre) || "_"
      else
        "_"
      end
    end.join
  end
end
