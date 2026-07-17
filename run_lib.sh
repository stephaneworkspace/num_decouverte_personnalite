#!/usr/bin/env bash
# bundle install
bundle exec ruby -Ilib -e 'require "num_decouverte_personalite"; puts NumDecouvertePersonalite.transform("Stéphane", "Thomas", "Bressani-Pedroli")'