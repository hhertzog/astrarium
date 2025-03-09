# frozen_string_literal: true

require_relative "astrarium/version"
require_relative "astrarium/calculations"  # Load calculations
require 'swe4r'

module Astrarium
  class Error < StandardError; end

  def self.hello
    "Welcome to Astrarium! 🌟"
  end
end

