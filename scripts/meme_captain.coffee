# Description:
#   Get a meme from http://memecaptain.com/
#
# Dependencies:
#   None
#
# Commands:
#   :meme Y U NO <text> - Generates the Y U NO GUY with the bottom caption of <text>
#   :meme I don't always <something> but when i do <text> - Generates The Most Interesting man in the World
#   :meme <text> (SUCCESS|NAILED IT) - Generates success kid with the top caption of <text>
#   :meme <text> ALL the <things> - Generates ALL THE THINGS
#   :meme <text> TOO DAMN <high> - Generates THE RENT IS TOO DAMN HIGH guy
#   :meme Yo dawg <text> so <text> - Generates Yo Dawg
#   :meme All your <text> are belong to <text> - All your <text> are belong to <text>
#   :meme If <text>, <word that can start a question> <text>? - Generates Philosoraptor
#   :meme <text>, BITCH PLEASE <text> - Generates Yao Ming
#   :meme <text>, COURAGE <text> - Generates Courage Wolf
#   :meme ONE DOES NOT SIMPLY <text> - Generates Boromir
#   :meme IF YOU <text> GONNA HAVE A BAD TIME - Ski Instructor
#   :meme IF YOU <text> TROLLFACE <text> - Troll Face
#   :meme Aliens guy <text> - Aliens guy weighs in on something
#   :meme Brace yourself <text> - Ned Stark braces for <text>
#   :meme Iron Price <text> - To get <text>? Pay the iron price!
#   :meme Not sure if <something> or <something else> - Generates a Futurama Fry meme
#   :meme <text>, AND IT'S GONE - Bank Teller
#   :meme WHAT IF I TOLD YOU <text> - Morpheus What if I told you
#
# Author:
#   bobanj

module.exports = (robot) ->
  robot.hear /:meme Y U NO (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/y_u_no.jpg', 'Y U NO', msg.match[1], (url) ->
      msg.send url

  robot.hear /:meme iron price (.+)/i, (msg) ->
    memeGenerator msg, 'http://imgur.com/nqVZQel.jpg', msg.match[1], 'Pay the iron price', (url) ->
      msg.send url

  robot.hear /:meme aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/aliens.jpg', msg.match[1], '', (url) ->
      msg.send url

  robot.hear /:meme brace yourself (.+)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/cOnPlV7.jpg', 'Brace Yourself', msg.match[1], (url) ->
      msg.send url

  robot.hear /:meme (.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/all_the_things.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/most_interesting.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/success_kid.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/too_damn_high.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/fry.png', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/xzibit.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/gzPiQ8R.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/yao_ming.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/courage_wolf.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/boromir.jpg', 'ONE DOES NOT SIMPLY', msg.match[1], (url) ->
      msg.send url

  robot.hear /:meme (IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/bad_time.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/troll_face.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme (IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/philosoraptor.jpg', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else ''), (url) ->
      msg.send url

  robot.hear /:meme (.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/uIZe3Q.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.hear /:meme WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/fWle1w.png', 'WHAT IF I TOLD YOU', msg.match[1], (url) ->
      msg.send url

memeGenerator = (msg, imageName, text1, text2, callback) ->
  imageUrl = imageName

  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 301
      msg.http(res.headers.location).get() processResult
      return
    if res.statusCode > 300
      msg.reply "Sorry, I couldn't generate that meme. Unexpected status from memecaption.com: #{res.statusCode}"
      return
    try
      result = JSON.parse(body)
    catch error
      msg.reply "Sorry, I couldn't generate that meme. Unexpected response from memecaptain.com: #{body}"
    if result? and result['imageUrl']?
      callback result['imageUrl']
    else
      msg.reply "Sorry, I couldn't generate that meme."

  msg.http("http://memecaptain.com/g")
  .query(
    u: imageUrl,
    t1: text1,
    t2: text2
  ).get() processResult
