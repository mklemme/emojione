require 'json'
require 'find'

file = File.read('emoji_data.json')
data_hash = JSON.parse(file)

Find.find('./svg') do |f|
  next if f.include?(".DS_Store") || f == "./svg"
  file = f.split("./svg/").last
  code = file.split(".svg").last
  emoji_data = data_hash[code]
  next unless emoji_data
  new_name = "./svg/#{emoji_data["alpha_code"].split(":").last}.svg"
  File.rename(f, new_name)
end
