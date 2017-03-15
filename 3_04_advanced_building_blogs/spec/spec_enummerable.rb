require 'enumerable.rb'

describe "#my_each" do
  context "given '[1,2,3]' and '{|x| puts x}'" do
    it "prints to stdout" do
      expect{[1,2,3].my_each{|x| puts x}}.to output.to_stdout
    end
    it "prints '123' to stdout" do
      expect{[1,2,3].my_each{|x| puts x}}.to output("1\n2\n3\n").to_stdout
    end
  end
  context "given '1' and {|x| puts x}" do
    it "calls error" do
      expect{1.my_each{|x| puts x}}.to raise_error(NoMethodError)
    end
  end
  context "given 'abc' and {|x| puts x}" do
    it "ptint 'abc' to stdout" do
      expect{"a".my_each{|x| print x}}.to raise_error(NoMethodError)
    end
  end
end

describe "my_each_with_index" do
  context "given '[1,2,3]' and '{|x, y| puts x,y}'" do
    it "prints to stdout" do
      expect{[1,2,3].my_each_with_index{|x, y| puts x, y}}.to output.to_stdout
    end
    it "prints '123' to stdout" do
      expect{[1,2,3].my_each_with_index{|x, y| puts x, y}}.to output("1\n0\n2\n1\n3\n2\n").to_stdout
    end
  end
  context "given '1' and {|x| puts x}" do
    it "calls error" do
      expect{1.my_each_with_index{|x, y| puts x, y}}.to raise_error(NoMethodError)
    end
  end
  context "given 'abc' and {|x| puts x}" do
    it "ptint 'abc' to stdout" do
      expect{"a".my_each_with_index{|x, y| print x, y}}.to raise_error(NoMethodError)
    end
  end
end

describe "#my_map" do
  context "given '[1,2,3,4]' and {|i| i * 10}" do
    it "returns [10,20,30,40]" do
      expect([1,2,3,4].my_map{|i| i * 10}).to eql([10,20,30,40])
    end
  end
  context "given 'abc' and {|i| i}" do
    it "raises error" do
      expect{"abc".my_map{|i| i}}.to raise_error(NoMethodError)
    end
  end
  context "given empty block" do
    it "returns nil" do
      expect([1,2,3,4].my_map{}).to eql([nil, nil, nil, nil])
    end
  end
end

describe "#my_select" do
  context "given '[1,2,3,4]' and {|i| i == 3}" do
    it "returns '[3]'" do
      expect([1,2,3,4].my_select{|i| i == 3}).to eql([3])
    end
  end
  context "given '[1,2,3,4]' and {|i| i == 5}" do
    it "returns empty array" do
      expect([1,2,3,4].my_select{|i| i == 5}).to eql([])
    end
  end
  context "given [1,2,3,4] and {}" do
    it "return empty array" do
      expect([1,2,3,4].my_select{}).to eql([])
    end
  end
end
