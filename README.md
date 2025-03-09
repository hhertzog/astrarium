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
Astrarium::Calculations.planet_signs(year, month, day, hour, latitude, longitude, altitude)

# House signs
Astrarium::Calculations.house_signs(year, month, day, hour, latitude, longitude)

# Planets in houses
Astrarium::Calculations.house_planets(year, month, day, hour, latitude, longitude, altitude)

# Planetary longitudes
Astrarium::Calculations.planet_longitudes(year, month, day, hour, latitude, longitude, altitude)

# House longitudes
Astrarium::Calculations.house_longitudes(year, month, day, hour, latitude, longitude)
```

## Notes
Uses Placidus houses and sidereal Lahiri mode.
Depends on swe4r gem (Swiss Ephemeris).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Astrarium project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hhertzog/astrarium/blob/main/CODE_OF_CONDUCT.md).
