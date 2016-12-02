require 'rails_helper'

describe "IinValidator" do
  subject { IinValidator.new }

  it "should not validate IIN with wrong length" do
    expect(subject.valid?('0000010007')).to be false
  end


  it "should not validate IIN with non digits" do
    expect(subject.valid?('000001000x7')).to be false
  end

  it "should not validate IIN with wrong birth date" do
    expect(subject.valid?('009900100004')).to be false
  end

  it "should validate valid IIN" do
    expect(subject.valid?('000000100007')).to be true
  end

end