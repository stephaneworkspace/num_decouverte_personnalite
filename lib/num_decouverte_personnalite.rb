# frozen_string_literal: true

require_relative "num_decouverte_personnalite/version"

module NumDecouvertePersonnalite
  class Error < StandardError; end

  EtatCivil = Struct.new(
    :valeur,
    :voyelle,
    :consonne,
    :tout,
    keyword_init: true
  )
  ChaineCaractere = Struct.new(
    :nombre_presentation,
    :nombre_reduit,
    :ligne_caractere_vers_chiffre,
    :valeur,
    :resultat,
    keyword_init: true
  )

  # Génération des caractères unicode, sauf ce qui n'est pas associable à l'alphabet
  def self.generate_unicode_valeurs
    hash = {}

    (0..0x10FFFF).each do |code|
      lettre = code.chr(Encoding::UTF_8) rescue next

      normalise = lettre
                    .unicode_normalize(:nfkd)
                    .gsub(/\p{Mn}/, "")
                    .upcase

      next unless normalise.match?(/\A[A-Z]\z/)

      hash[lettre] = VALEURS[normalise]
    end

    hash
  end

  VALEURS = {
    "A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9,
    "J" => 1, "K" => 2, "L" => 3, "M" => 4, "N" => 5, "O" => 6, "P" => 7, "Q" => 8, "R" => 9,
    "S" => 1, "T" => 2, "U" => 3, "V" => 4, "W" => 5, "X" => 6, "Y" => 7, "Z" => 8
    # Accents
    # "É" => 1, "È" => 1, "Ê" => 1, "Ë" => 1, "Ç" => 1,
    # "Û" => 3, "Ü" => 3,
    # "Î" => 5,
    # "Ô" => 6, "Ö" => 6,
    # "Â" => 9, "À" => 9
  }.freeze

  TOUS_LES_VALEURS = generate_unicode_valeurs.freeze

  NOMBRE = {
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9"
  }.freeze

  MAITRE_NOMBRE = {
    11 => "11/2", # "\e[34m#{nombre}\e[0m" bleu
    22 => "22/4",
    33 => "33/6"
  }.freeze

  NOMBRE_KARMIQUE = {
    13 => "13/4", # "\e[31m#{nombre}\e[0m" # rouge
    14 => "14/5",
    16 => "16/7",
    19 => "19/1",
  }.freeze

  # Génère tous les nombres de 12 à max dont la réduction théosophique directe (somme des chiffres)
  # donne un résultat entre 1 et 9, en excluant les nombres maîtres et karmiques.
  # Les nombres comme 28 (2+8=10), 91 (9+1=10), etc. sont ignorés, car leur première
  # réduction ne donne pas directement 1 à 9 !
  def self.generate_octave(max = 10_000)
    exclus = MAITRE_NOMBRE.keys + NOMBRE_KARMIQUE.keys
    (12..max).each_with_object({}) do |n, hash|
      next if exclus.include?(n)
      somme = n.digits.sum
      next if somme > 9
      hash[n] = "#{n}/#{somme}"
    end
  end

  OCTAVE = generate_octave.freeze

  TOUS_LES_NOMBRES = {
    **NOMBRE,
    **MAITRE_NOMBRE,
    **NOMBRE_KARMIQUE,
    **OCTAVE
  }.freeze

  module Nature
    VOYELLE   = :voyelle
    CONSONNE  = :consonne
    TOUT      = :tout
    ALL = [VOYELLE, CONSONNE, TOUT].freeze
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
  def self.etat_civil(prenom_actif, prenom_secondaire, nom_de_famille)
    result = [
      *self.separate(prenom_actif),
      *self.separate(prenom_secondaire),
      *self.separate(nom_de_famille)
    ]
    etat_civil = []
    result.each { |x|
      etat_civil.push(
        EtatCivil.new(
          valeur: x,
          voyelle: self.chaine_de_caractere_individuelle(x, :voyelle).resultat,
          consonne: self.chaine_de_caractere_individuelle(x, :consonne).resultat,
          tout: self.chaine_de_caractere_individuelle(x, :tout).resultat
        )
      )
    }
    puts etat_civil
    etat_civil
  end

  # Divise une entrée en plusieurs parties en utilisant des espaces et des tirets comme séparateurs.
  def self.separate(string)
    string.split(/[\s-]+/)
  end

  def self.valeur_lettre(lettre)
    TOUS_LES_VALEURS[lettre.upcase]
  end

  def self.niveau_1(string, nature)
    raise ArgumentError unless Nature::ALL.include?(nature)
    string.chars.map do |lettre|
      est_voyelle = %w[A E I O U Y É È Ê Ë Â À].include?(lettre.upcase)
      if nature == Nature::VOYELLE && est_voyelle
        valeur_lettre(lettre) || "_"
      elsif nature == Nature::CONSONNE && !est_voyelle
        valeur_lettre(lettre) || "_"
      elsif nature == Nature::TOUT
        valeur_lettre(lettre) || "_"
      else
        "_"
      end
    end.join
  end

  def self.extract_niveau(niveau_precedant)
    if niveau_precedant.match?(/[A-Za-zÀ-ÿ]/)
      niveau_precedant.scan(/\d+/).map(&:to_i)
    else
      if niveau_precedant.include?("/")
        niveau_precedant.split("/").map(&:to_i)
      else
        niveau_precedant.scan(/\d/).map(&:to_i)
      end
    end
  end

  def self.theosophique(nombre)
    while nombre > 9
      nombre = nombre.digits.sum
    end

    nombre
  end

  def self.niveau_superieur(niveau_precedant)
    all = self::TOUS_LES_NOMBRES
    sum = self.extract_niveau(niveau_precedant).sum

    if MAITRE_NOMBRE.key?(sum) || NOMBRE_KARMIQUE.key?(sum) || OCTAVE.key?(sum)
      {
        sum: sum,
        last: self.theosophique(sum),
        octave: all[sum],
        final: true
      }
    elsif sum >= 1 && sum <= 9
      {
        sum: sum,
        last: sum,
        octave: all[sum],
        final: true
      }
    else
      {
        sum: sum,
        last: nil,
        octave: sum.to_s,
        final: false
      }
    end
  end

  def self.chaine_de_caractere_individuelle(string, nature)
    hash = {
      presentation: nil,
      nombre_reduit: 0,
      ligne_caractere_vers_chiffre: ""
    }
    niveau = self.niveau_1(
      string,
      nature
    )

    niveaux = [niveau]
    loop do
      resultat = self.niveau_superieur(niveau)
      niveaux << resultat
      hash[:presentation] = resultat[:octave]
      hash[:nombre_reduit] = resultat[:last]
      break if resultat[:final]
      niveau = resultat[:sum].to_s
    end

    resultat = []
    niveaux.each_with_index do | n, index|
      if index == 0
        line = []
        line.push(n)
        puts "#{index} - #{n}"
        line.push(:base)
      else
        puts "#{index} - #{n}"
        line = []
        line.push(n[:octave])
        if n.is_a?(Hash) && n.key?(:last)
          line.push(:final)
        else
          line.push(:intermediate)
        end
      end
      resultat.push(line)
    end

    ChaineCaractere.new(
      nombre_presentation: hash[:presentation],
      nombre_reduit: hash[:nombre_reduit],
      ligne_caractere_vers_chiffre: niveaux.first,
      valeur: string,
      resultat: resultat
    )
  end
end
