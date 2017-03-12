require 'cesar.rb'

describe "#num_check" do
  context "given n > 26" do
    it "returns 0 < n < 26" do
      expect(num_check(27)).to eql(1)
    end
  end
  context "given n < 26" do
    it "returns 0 < n < 26" do
      expect(num_check(-1)).to eql(25)
    end
  end
end

describe "#cesar_cipher" do
  context "given any string and any number" do
    it "returns string" do
      expect(cesar_cipher("string", 2).is_a?(String)).to eql(true)
    end
  end
  context "given 'abcdef' and '1'" do
    it "returns 'bcdefg'" do
      expect(cesar_cipher("abcdef", 1)).to eql("bcdefg")
    end
  end
  context "given 'abcdef' and '26'" do
    it "returns 'bcdefg'" do
      expect(cesar_cipher("abcdef", 26)).to eql("abcdef")
    end
  end
  context "given 'abcdef' and '27'" do
    it "returns 'bcdefg'" do
      expect(cesar_cipher("abcdef", 27)).to eql("bcdefg")
    end
  end
  context "given 'abcdef' and '-25'" do
    it "returns 'abcdef'" do
      expect(cesar_cipher("abcdef", -25)).to eql("bcdefg")
    end
  end
end
