require "yaml"
require "pry"

def load_library(emotion)
file  = YAML.load_file(emotion)

main_hash = {
get_meaning: {},
get_emoticon: {}
}

file.each do |meaning, emotion|


  main_hash[:get_meaning][emotion[1]] = meaning
  main_hash[:get_emoticon][emotion[0]] = emotion[1]

end
main_hash
end

file_call = YAML.load_file(File.open(File.join(File.dirname(__FILE__),'emoticons.yml')))



def get_japanese_emoticon(file, emotion)



library =  load_library(file)

library.each  do |keys, mean_emo|

  mean_emo.map do |list|

   list.each do |emo|
 found = list.any?(emotion)

 if found === true
   return library[keys][emo]
        end
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
library = load_library(file)

library.each do |keys, hashes|
  hashes.map do |list|
list.each do |eng|

found = list.any?(emoticon)

if found === true
  return library[keys][eng]
end

end
end
end
return "Sorry, that emoticon was not found"
end
