describe "engine" do
  before do
    @engine = Engine.new
  end

  it 'runs javascript' do
    result = @engine.run("1 + 1")
    result.should.be.successful
  end

  it "returns numbers" do
    result = @engine.run("1 + 1")
    result.value.should == 2
  end

  it "returns strings" do
    result = @engine.run("(1).toString()")
    result.value.should == '1'
  end

  it "is unsucessfull if an exception ocurred" do
    @engine.run("foo() + bar()").should.not.be.successful
  end

  it "has an exception if one is thrown" do
    @engine.run('throw "oh crap!"').exception.should == 'oh crap!'
  end
end
