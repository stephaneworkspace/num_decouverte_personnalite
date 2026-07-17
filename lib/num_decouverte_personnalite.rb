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

  MAITRE_NOMBRE = {
    11 => "11/2", # "\e[34m#{nombre}\e[0m" bleu
    22 => "22/4",
    33 => "33/6",
  }

  NOMBRE_KARMIQUE = {
    13 => "13/4",  # "\e[31m#{nombre}\e[0m" # rouge
    14 => "14/5",
    16 => "16/7",
    19 => "19/1"
  }

  OCTAVE = {
    12 => "12/3",
    15 => "15/6",
    17 => "17/8",
    20 => "20/2",
    21 => "21/3",
    23 => "23/5",
    24 => "24/6",
    25 => "25/7",
    26 => "26/8",
    27 => "27/9",
    30 => "30/3",
    31 => "31/4",
    32 => "32/5",
    34 => "34/7",
    35 => "35/8",
    36 => "36/9",
    40 => "40/4",
    41 => "41/5",
    42 => "42/6",
    43 => "43/7",
    44 => "44/8",
    45 => "45/9",
    50 => "50/5",
    51 => "51/6",
    52 => "52/7",
    53 => "53/8",
    54 => "54/9",
    60 => "60/6",
    61 => "61/7",
    62 => "62/8",
    63 => "63/9",
    70 => "70/7",
    71 => "71/8",
    72 => "72/9",
    80 => "80/8",
    81 => "81/9",
    90 => "90/9",
    100 => "100/1"
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
