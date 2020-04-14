require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
     def setup
      @genre = Genre.create(name: "fiction")
     end
    

     test "should get genre index" do
        get genres_url
        assert_response :success
     end

     test "should get new" do
        get new_genre_url
        assert_response :success
     end

     test "should get show" do
      get genre_path(@genre)
      assert_response :success
     end
end
