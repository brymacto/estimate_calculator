class Job

  attr_accessor :base_price, :people, :type
  def initialize(base_price, people, type)
    @base_price = base_price.to_f
    @people = people
    @type = type
  end

  def flat_markup
    @base_price * 0.05
  end

  def price_with_flat_markup
    @base_price + flat_markup
  end

  def people_markup
    price_with_flat_markup * @people * 0.012
  end

  def type_markup
    case @type
    when 'drugs'
      price_with_flat_markup * 0.075
    when 'food'
      price_with_flat_markup * 0.13
    when 'electronics'
      price_with_flat_markup * 0.02
    else
      0
    end

  end

  def total_price
    (@base_price + flat_markup + people_markup + type_markup).round(2)
  end

end