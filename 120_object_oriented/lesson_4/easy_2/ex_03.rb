module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors
p HotSauce.ancestors

# To find the lookup path you can use the .ansestors method.
# lookup path for Orange:  Orange > Taste > Object > Kernal > BasicObject
# lookup path for HotSauce: HotSauce > Taste > Object > Kernal > BasicObject
