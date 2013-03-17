describe "engine" do
  before do
    @engine = Engine.new
  end

  it "runs javascript" do
    @engine.run("1 + 1").should == "2"
  end

  it "returns nil if an exception ocurred" do
    @engine.run("foo() + bar()").should == nil
  end
end
