#!/usr/bin/env bash
bundle install
bundle exec rake test
# bundle exec ruby -Ilib -e 'require "num_decouverte_personnalite"; puts NumDecouvertePersonnalite.transform("Stéphane", "Thomas", "Bressani-Pedroli")'
bundle exec ruby -Ilib -e 'require "num_decouverte_personnalite"; puts NumDecouvertePersonnalite.separeate("Jean-Henri")'