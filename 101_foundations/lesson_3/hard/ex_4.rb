HEX_CHARACTERS = [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f'].freeze

def display_uuid
  uuid = []
  32.times do uuid
    uuid.push(HEX_CHARACTERS.sample)
  end
  final = ''
  final << uuid[0..7].join + '-' + uuid[8..11].join + '-' + uuid[12..15].join + '-' + uuid[16..19].join + '-' + uuid[20..32].join
  # puts final
end

display_uuid

# launschool answer much more consice
# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }
# 
#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end
#
#   uuid
# end
