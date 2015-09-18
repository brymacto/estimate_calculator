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

  def people_markup

  end

  def type_markup

  end

  def total_price

  end

end