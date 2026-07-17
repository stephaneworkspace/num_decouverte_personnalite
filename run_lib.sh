#!/usr/bin/env bash
set -e
bundle install
bundle exec rake test
bundle exec ruby -Ilib -e 'require "num_decouverte_personnalite"; puts NumDecouvertePersonnalite.niveau_1("Stéphane", NumDecouvertePersonnalite::Nature::VOYELLE)'