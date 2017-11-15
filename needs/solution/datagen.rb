require 'json'
require 'encrypto_signo'
require "base64"
require 'digest'


fake_private_key = File.read("fake_private")
fake_public_key  = File.read("fake_public")
real_public_key  = File.read("real_public")
real_private_key = File.read("real_private")
ITERATION = 1000000
out = []
sample = {}

def sentence_builder(key)
  quotes = [
  "Another One.",
  "Congratulations. You played yourself",
  "Ride wit me through the pathway to more success",
  "Smh they get mad when u have joy.",
  "I can deal with everything. I got the answer for anything. This DJ Khaled.",
  "I didn’t want to be an artist in the same place I worked. You could always have people that might feel like you would do something more for yourself.",
  "When I made ‘Hold You Down,’ I was thinking Barry Gordy, Quincy Jones. I was saying to myself, ‘If they was in the studio, what was they thinking.’ So I started thinking DJ Khaled, but inspired by the greats.",
  "My fans expect me to be greater and keep being great.",
  "The 🔑 to more success is cocoa butter.",
  "Those that weather the storm r the great ones.",
  "They don’t want you to win. They don’t want you to have the No. 1 record in the country. They don’t want you get healthy. They don’t want you to exercise. And they don’t want you to have that view.",
  "I wanted to see what Jay Z was looking through his window, if he even had a window.",
  "I can deal with everything. I got the answer for anything. This DJ Khaled.",
  "I changed… a lot.",
  "It's so real out here right now, the only reason why you see anything is cause I got the flash on.",
  "Bless up.",
  "I be confused. Why they be mad?",
  "Enjoy life man, live it up",
  "Liooonnnn",
  "Almond milk + Cinamon Toast Crunch. Major 🔑 to success",
  "Some people can't handle success. I can.",
  "They don't want you to be on a jet ski doing 360s.",
  "Some people can't handle winning. I can.",
  "The 🔑 is not to drive your jetski in the dark",
  "Its important to shape up your hedges. Its like getting a haircut",
  "Cloth talk",
  "Let's see what Chef Dee got for breakfast",
  "Egg whites, chicken sausage, water. They don't want you to eat",
  "Don't play yourself",
  "You have to make it through the jungle to make it to paradise. That's the 🔑.",
  "The 🔑 to success is to have a hammock",
  "They wanna come stress me out. Heh, bye.",
  "All the great ones jetski",
  "They don't want you to have a rolls royce. I promise",
  "Do you see that bamboo? Ain't nothing like bamboo.",
  "We have to get money. We have no choice. It cost money to eat",
  "The 🔑 is to have every 🔑",
  "I got a starfruit tree. Star fruit is one of my favorite fruits"
]	
  sentences = [ 'the key to success', 'major key', 'minor key', 'special key', 'your key', 'my key', 'everyone\'s key' ]
  random_index = Random.rand(sentences.size)
  random_index_2 = Random.rand(quotes.size) 
  
  "> #{quotes[random_index_2]} #{key} #{sentences[random_index]}"
end
file = File.open('out.json','w')
file.puts('Verified by phpseclib.sourceforge.net/rsa/examples.html')

ITERATION.times do |id|
	data = sentence_builder(Digest::SHA256.base64digest('salting_-_-_-' + id.to_s).force_encoding('UTF-8'))
  signature = if (id == 12345)
		      EncryptoSigno.sign(real_private_key, data)
	      else
		      EncryptoSigno.sign(fake_private_key, data)
	      end 
  sample[:id] = id
  sample[:data]    = Base64.encode64(data + '--' + signature)
  sample[:time]    = Time.now
  
  file.puts(sample)
end
file.close
