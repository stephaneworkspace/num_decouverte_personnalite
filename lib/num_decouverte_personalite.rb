# frozen_string_literal: true

require_relative "num_decouverte_personalite/version"

module NumDecouvertePersonalite
  class Error < StandardError; end
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
  def self.separe(string)
    string.split(/[\s-]+/)
  end
end
