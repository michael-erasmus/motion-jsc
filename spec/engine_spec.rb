describe "engine" do
  before do
    @engine = Engine.new
  end

  it "returns numbers" do
    @engine.run("1 + 1").should == 2
  end

  it "returns strings" do
    @engine.run("(1).toString()").should == '1'
  end

  it "returns nil if an exception ocurred" do
    @engine.run("foo() + bar()").should == nil
  end
end
