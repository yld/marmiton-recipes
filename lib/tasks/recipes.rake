# frozen_string_literal: true

require 'net/http'
require 'tempfile'
require 'uri'

RECIPES_PATH = Rails.root.join('recipes.json')

namespace :recipes do
  desc 'import recipes'
  task import: :environment do
    json_lines = []
    File.foreach(RECIPES_PATH) { |line| json_lines << line }
    tmp_json = JSON.parse("[#{json_lines.join(',')}]")
    Recipe.upsert_all(tmp_json)
  end
end
