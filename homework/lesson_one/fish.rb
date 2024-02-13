module FishSize
  SIZE_DELIMITER = 10

  def determine_size_group(weight)
    if weight > SIZE_DELIMITER
      return 'Big'
    end
    return 'Small'
  end
end

class Fish
  include FishSize

  class InvalidColorError < StandardError; end
  class InvalidNameError < StandardError; end
  class InvalidWaightError < StandardError; end 

  NAMES = [:carp, :tuna, :walleye, :barracuda, :dorado, :tilapia]
  COLORS = [:black, :white, :yellow, :red, :gold, :green]
  SALTWATER_FISH = [:tuna, :barracuda, :dorado]
  FRESHWATER_FISH = [:carp, :walleye, :tilapia]

  def initialize(name, color, weight)
    @name = name
    @color = color
    @weight = weight
    @size_group = determine_size_group(weight)

    raise InvalidNameError unless valid_name?
    raise InvalidColorError unless valid_color?
    raise InvalidWaightError unless valid_weight?
  end

  attr_accessor :name, :color, :weight, :size_group

  def is_saltwater_fish?
    SALTWATER_FISH.include?(name)
  end

  def is_freshwater_fish?
    FRESHWATER_FISH.include?(name)
  end

  private

  def valid_name?
    NAMES.include?(name)
  end

  def valid_color?
    COLORS.include?(color)
  end

  def valid_weight?
    weight.is_a? Numeric
  end
end

class Carp < Fish
  COLORS = [:gold, :white, :red]

  def initialize(color, weight)
    super(:carp, color, weight)
  end

  private

  def valid_color?
    COLORS.include?(color)
  end
end

class Dorado < Fish
  COLORS = [:green, :yellow, :black]

  def initialize(color, weight)
    super(:dorado, color, weight)
  end

  private

  def valid_color?
    COLORS.include?(color)
  end
end
