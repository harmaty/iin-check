class IinValidator < ActiveModel::Validator
  def validate(record)
    unless valid?(record.iin.to_s)
      record.errors[:base] << "BAD FORMAT."
    end
  end

  def valid?(iin)
    return false unless iin
    return false unless iin.size == 12
    return false unless iin =~ /^\d+$/
    return false if iin[2,2].to_i > 12
    return false if iin[4,2].to_i > 31
    return false if iin[6].to_i > 6

    control = control_digit(iin, 1..11)
    control = control_digit(iin, (1..11).to_a.rotate(2)) if control == 10
    control == iin[11].to_i
  end

  private

  def control_digit(iin, weights)
    iin_array = iin[0,11].split('').map(&:to_i)
    iin_array.zip(weights).map{|v, w| v*w}.sum % 11
  end

end