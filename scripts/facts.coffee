# Description:
#   Returns a random space fact
#
# Dependencies:
#   None
#
# Commands:
#   fun fact - returns a cool fact about space
#
# Author:
#   ttfnrob

funfacts = [
  "You can fit over 1,300 Earth-sized things inside Jupiter but over 1,300,000 Earth sized things inside our Sun!",
  "If you drove to the Sun it would take 152 years.",
  "There’s more water on Europa than there is on Earth.",
  "Io smells like rotten eggs because of the sulphur volcanoes. Stinkiest place in the Solar System?",
  "The giant planets have likely moved since they formed, and Neptune and Uranus might have switched places",
  "You could float Saturn in the bath. If you had a Saturn-sized bath.",
  "If the Sun is a big beach ball, then the Earth is a small marble about a football field away",
  "There’s Red helium-neon rain on Jupiter and metallic snow/frost on Venus.",
  "The rain on Saturn’s moon Titan is flammable (but there’s no oxygen there so it never burns).",
  "During a Martian sunset, the Sun looks blue and the rest of the sky turns red.",
  "If you want to visit our nearest spiral galaxy, wait a couple billion years: it's on a collision course with us.",
  "If Saturn's rings shrunk to the thickness of 1 sheet of paper, the paper would be 500 meters wide.",
  "The Sun is rounder than it should be.",
  "During a collision of galaxies made of hundreds of billions of stars, the number of stars that collide is usually 0.",
  "The full Moon takes up the same space in the sky as our nearest spiral galaxy neighbor (which is very faint).",
  "Dust in galaxies smells like fried chicken.",
  "All of the gold in the Universe was made in the explosions of dying stars.",
  "All of the planets in the solar system lined end-to-end would just fit between the Earth and the Moon.",
  "We think there are as many planets in the galaxy as there are stars. We just haven't found most of them (yet).",
  "If you would place a pinhead sized piece of the Sun on the Earth you would die from standing within 145 km (90 miles) from it.",
  "Space is not a complete vacuum, there are about 3 atoms per cubic meter of space.",
  "Only 5% of the universe is made up of normal matter, 25% is dark matter and 70% is dark energy.",
  "Neutron stars are so dense that a teaspoon of them would be equal to the weight of the entire Earth’s population.",
  "The Sun is 400 times larger than the Moon but is 400 times further away from Earth making them appear the same size.",
  "The star Lucy in the constellation Centaurus is a huge cosmic diamond of 10 billion trillion trillion carats.",
  "Seasons last 21 years on Uranus while each pole has 42 years of sunlight followed by 42 years of darkness.",
  "Venus,on the other hand, does not have any seasons at all.",
  "1 year on Mercury consists of less than 2 days on Mercury.",
  "There are as many oxygen atoms in a breath as breaths of air in the atmosphere.",
  "Helium is the only substance in the universe that cannot be in solid form.It can’t be cold enough.",
  "The coldest place in the universe is on Earth. In Wolfgang Ketterles lab in Massachusetts. 0.000000000001 degrees Kelvin.",
  "The pistol star is the most luminous star known 10 million times the brightness of the Sun.",
  "Saturn’s moon Titan has liquid oceans of natural gas.",
  "All the planets are the same age: 4.544 billion years.",
  "Earths moon was most likely formed after an early planet named Theia crashed into Earth.",
  "8000 stars are visible with naked eye from Earth. 4000 in each hemisphere, 2000 at daylight and 2000 at night.",
  "90-99% of all normal matter in the universe is hydrogen.",
  "Only 55% of all Americans knows that the Sun is a star.",
  "Because of the speed the Sun moves at, solar eclipses can last at most 7 minutes and 58 seconds.",
  "Lunar eclipses, however, can last 1 hour and 40 minutes.",
  "All the coal, oil, gas, wood and fuel on Earth would only keep the Sun burning for few days.",
  "A full moon is nine times brighter than a half moon.",
  "When the Moon is directly above your head or if you stand at the equator, you weight slightly less.",
  "A single Quasar produce the same amount of energy as 1 trillion suns.",
  "Just after the Big Bang, everything in the universe was in liquid form.",
  "A planet nicknamed “The Genesis Planet” has been found to be 12.7 billion years old making it the oldest planet found.",
  "Every year, the Moon is moving away from Earth by 3.8 centimeters.",
  "The Moon spins around its axis in the same time it goes one lap around the Earth which makes us always see the same side of it.",
  "Upsilon Andromeda B also only face one side to its star. One side is hot as lava while the other one is cold below freezing.",
  "The average galaxy contains “only” 40 billion stars.",
  "While in space astronomers can get taller, but at the same time their hearts can get smaller.",
  "Mars surface is cowered with iron oxide (rust).",
  "Only half a billionth of the energy released by the Sun reaches Earth.",
  "Rogue planets are not bound by any star, brown dwarf or another planet which makes them free-float around the galaxy.",
  "Sweeps 10 is the planet with the shortest orbital period found. It orbits its star in only 10 hours.",
  "85% of all stars in our galaxy are part of multiple-star systems.",
  "Some brown dwarfs have liquid iron rain falling down on them.",
  "The light emitting from the Sun is actually 30.000 years old.",
  "Of the over 20 million meteors that are observable every day only one or two reach the surface of Earth.",
  "The United States have approximately 3.500 astronomers, but over 15.000 astrologers.",
  "The closest black hole to Earth is only 1.600 light-years away.",
  "There are at least 10,000,000,000,000,000,000 stars in the universe.",
  "Any free-moving liquid in outer space will form itself into a sphere due to surface tension.",
  "The odds of being killed by falling space debris is 1 in 5 billion.",
  "Neutron stars can rotate up to 500 times in 1 second.",
  "The largest structure found in the universe is the Sloan Great Wall, a super cluster of galaxies 1.37 billion light-years wide."
]

module.exports = (robot) ->
  robot.respond /fun fact/i, (msg) ->
    msg.send msg.random funfacts