class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
	@name = name
	@calories = calories
  end
  def healthy?
	true if calories < 200
  end
  def delicious?
	true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
	@calories = 5
	@name = "#{flavor} jelly bean"
	@flavor = flavor
  end
  def delicious?
	return false if @flavor == 'licorice'
	return true
  end
end
