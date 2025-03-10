# frozen_string_literal: true

require "swe4r"

# Module for calculating planetary positions, house cusps, and planet-house placements using Swiss Ephemeris.
module Astrarium
  module Calculations
    SIGNS = %i[aries taurus gemini cancer leo virgo libra scorpio sagittarius capricorn aquarius pisces].freeze
    SWE4R_PLANETS = {
      sun: Swe4r::SE_SUN,
      moon: Swe4r::SE_MOON,
      mercury: Swe4r::SE_MERCURY,
      venus: Swe4r::SE_VENUS,
      mars: Swe4r::SE_MARS,
      jupiter: Swe4r::SE_JUPITER,
      saturn: Swe4r::SE_SATURN,
      uranus: Swe4r::SE_URANUS,
      neptune: Swe4r::SE_NEPTUNE,
      pluto: Swe4r::SE_PLUTO
    }.freeze

    def self.house_signs(year:, month:, day:, hour:, latitude:, longitude:)
      longitudes = house_longitudes(year:, month:, day:, hour:, latitude:, longitude:)

      longitudes.each_with_object({}) do |house_with_longitude, hash|
        hash[house_with_longitude[0]] = SIGNS[(house_with_longitude[1] / 30.0).to_i]
      end
    end

    def self.planet_signs(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
      longitudes = planet_longitudes(year:, month:, day:, hour:, latitude:, longitude:, altitude:)

      longitudes.each_with_object({}) do |planet_with_longitude, hash|
        hash[planet_with_longitude[0]] = SIGNS[(planet_with_longitude[1] / 30.0).to_i]
      end
    end

    def self.house_planets(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
      houses = house_signs(year:, month:, day:, hour:, latitude:, longitude:) # {1 => :libra, 2 => :scorpio, ...}
      house_planets = houses.keys.each_with_object({}) { |i, hash| hash[i] = [] }

      planet_signs(year:, month:, day:, hour:, latitude:, longitude:, altitude:).each do |planet, sign|
        house = houses.key(sign)
        house_planets[house] << planet if house
      end

      # Convert empty arrays to nil for empty houses
      house_planets.transform_values { |planets| planets.empty? ? nil : planets }
    end

    def self.house_longitudes(year:, month:, day:, hour:, latitude:, longitude:)
      jd = Swe4r.swe_julday(year, month, day, hour)
      houses = Swe4r.swe_houses(jd, latitude, longitude, "P")

      (1..12).each_with_object({}) do |i, hash|
        hash[i] = houses[i]
      end
    end

    def self.planet_longitudes(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
      jd = Swe4r.swe_julday(year, month, day, hour)

      # Set the geographic location for topocentric positions
      Swe4r.swe_set_topo(longitude, latitude, altitude)

      # Set the sidereal mode for sidereal positions
      Swe4r.swe_set_sid_mode(Swe4r::SE_SIDM_LAHIRI, 0, 0)

      SWE4R_PLANETS.each_with_object({}) do |item, hash|
        planet_name = item[0]
        swe4r_planet = item[1]
        body = Swe4r.swe_calc_ut(jd, swe4r_planet, Swe4r::SEFLG_MOSEPH)

        hash[planet_name] = body[0]
      end
    end
  end
end
