class Triangle
  
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid_triangle
    sides_array = [@side1, @side2, @side3]
    if sides_array.any? { |side| side <= 0 }
      raise TriangleError
    elsif @side1 >= @side2 + @side3 || @side2 >= @side1 + @side3 || @side3 >= @side1 + @side2
      raise TriangleError
    end
  end

  def kind
    valid_triangle
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else :scalene
    end
  end

  class TriangleError < StandardError
  end
end