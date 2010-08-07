require 'haar'

describe Haar, "#calculate" do
  before(:each) do
    @haar = Haar.new
  end

  it "wavelet of [8,5]" do 
    @haar.calculate([8,5]).should == [6.5, 1.5]
  end

  it "wavelet of [8,5,7,3]" do 
    @haar.calculate([8,5,7,3]).should == [5.75,1.75,0.75,-0.25]
  end

  it "an odd length array" do 
    lambda { @haar.calculate([8,5,1]) }.should raise_exception(ArgumentError)
  end

  it "an empty array" do 
    lambda { @haar.calculate([]) }.should raise_exception(ArgumentError)
  end
end
