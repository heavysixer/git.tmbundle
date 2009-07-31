      @results.map{|r| r[:left][:file_path]}.should == ["Support/lib/commands/diff.rb", "Support/lib/formatters/diff.rb"]
      @results.map{|r| r[:right][:file_path]}.should == ["Support/lib/commands/diff.rb", "Support/lib/formatters/diff.rb"]
    
    it "should parse the file mode" do
      @results.first[:mode].should == "100644"
    end
  
  describe "parsing new and deleted files" do
    before(:each) do
      @results = @diff.parse_diff(fixture_file("submodules.diff"))
    end
    
    it "should be status :new for new files" do
      @results[0][:status].should == :new
    end
    
    it "should pick up the mode from the 'new file mode 160000' line" do
      @results[0][:mode].should == "160000"
    end
    
    it "should be status :deleted for deleted files" do
      @results[1][:status].should == :deleted
    end
    
    it "should pick up the mode from the 'deleted file mode 160000' line" do
      @results[1][:mode].should == "160000"
    end
  end