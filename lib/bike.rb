class Bike
  attr_accessor :broken

  def working?
    if @broken
      false
    else
      true
    end
  end

  def broken
    @broken = false
  end
end