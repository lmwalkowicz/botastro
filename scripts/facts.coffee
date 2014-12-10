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
  "There’s more water on Europa than there is on Earth",
  "Io smells like rotten eggs because of the sulphur volcanoes. Stinkiest place in the Solar System?",
  "The giant planets have likely moved since they formed, and Neptune and Uranus might have switched places",
  "You could float Saturn in the bath. If you had a Saturn-sized bath.",
  "If the Sun is a big beach ball, then the Earth is a small marble about a football field away",
  "There’s Red helium-neon rain on Jupiter and metallic snow/frost on Venus",
  "The rain on Saturn’s moon Titan is flammable (but there’s no oxygen there so it never burns)"
]

module.exports = (robot) ->
  robot.respond /fun fact/i, (msg) ->
    msg.send msg.random funfacts