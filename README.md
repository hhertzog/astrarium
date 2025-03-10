# Astrarium

**Astrarium** is a Ruby gem for calculating planetary positions, house cusps, and planet-house placements using Swiss Ephemeris (`swe4r`).

---

## Installation

Add to Gemfile:

```ruby
gem 'astrarium', github: 'hhertzog/astrarium'
```

Or install manually:

```ruby
gem install astrarium
```

## Usage
```ruby
require 'astrarium'

## Inputs
# UTC year, month, day, & hour (decimal)
year, month, day = 1995, 7, 31
hour = 11.75

latitude, longitude, altitude = 51.510357, -0.116773, 0

# Planetary signs
Astrarium::Calculations.planet_signs(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
# => {sun: :leo, moon: :virgo, mercury: :leo, venus: :leo, mars: :libra, jupiter: :sagittarius, saturn: :pisces, uranus: :capricorn, neptune: :capricorn, pluto: :scorpio}

# House signs
Astrarium::Calculations.house_signs(year:, month:, day:, hour:, latitude:, longitude:)
# => {1 => :libra, 2 => :scorpio, 3 => :sagittarius, 4 => :aquarius, 5 => :pisces, 6 => :aries, 7 => :aries, 8 => :taurus, 9 => :gemini, 10 => :leo, 11 => :virgo, 12 => :libra}

# Planets in houses
Astrarium::Calculations.house_planets(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
# =>  {1 => [:mars], 2 => [:pluto], 3 => [:jupiter], 4 => nil, 5 => [:saturn], 6 => nil, 7 => nil, 8 => nil, 9 => nil, 10 => [:sun, :mercury, :venus], 11 => [:moon], 12 => nil}

# Planetary longitudes
Astrarium::Calculations.planet_longitudes(year:, month:, day:, hour:, latitude:, longitude:, altitude:)
# {sun: 127.81613632199489,
# moon: 172.62039351828767,
# mercury: 131.62305715461554,
# venus: 122.16608200772731,
# mars: 186.03619605599349,
# jupiter: 245.53788529884716,
# saturn: 354.2357533987427,
# uranus: 298.1066290394672,
# neptune: 293.7808251300739,
# pluto: 237.83460568847772}

# House longitudes
Astrarium::Calculations.house_longitudes(year:, month:, day:, hour:, latitude:, longitude:)
# {1 => 204.45338105169472,
# 2 => 231.08774091483386,
# 3 => 264.3306909469843,
# 4 => 302.49141171785953,
# 5 => 336.86229357157436,
# 6 => 3.8091046239379693,
# 7 => 24.45338105169469,
# 8 => 51.08774091483383,
# 9 => 84.3306909469843,
# 10 => 122.49141171785953,
# 11 => 156.86229357157433,
# 12 => 183.80910462393794}
```

## Notes
Uses Placidus houses and sidereal Lahiri mode.
Depends on swe4r gem (Swiss Ephemeris).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Astrarium project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hhertzog/astrarium/blob/main/CODE_OF_CONDUCT.md).
