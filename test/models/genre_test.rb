require 'test_helper' #An added required file which contains components that are needed for testing

class GenreTest < ActiveSupport::TestCase
   #Whatever you do here is not going to hit your real database rather it will hit your temporary database. So any changes
   # made here won't affect your original data. As it is temporary, so the data in this database will automatically get destroyed.

    def setup #This method runs first before any other below testing methods
       @genre=Genre.new(name: "fiction")
    end

    test "genre should be valid" do
        assert @genre.valid?
    end

    test "name should be present" do
        @genre.name=" "
        assert_not @genre.valid?
    end

    test "name should be unique" do
         @genre.save
         genre2=Genre.new(name: "fiction")
         assert_not genre2.valid?
    end

    test "name should not be too long" do
        @genre.name="a"*26
        assert_not @genre.valid?
    end

    test "name should not be too short" do
        @genre.name="aa"
        assert_not @genre.valid?
    end

end