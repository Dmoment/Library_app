require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
     def setup
      @genre = Genre.create(name: "fiction")
      @user= User.create(username: "john", email: "john@example.com", password:"password", admin: true)
      #we are doing this to create an admin user
     end
    

     test "should get genre index" do
        get genres_url
        assert_response :success
     end

     test "should get new" do
      sign_in_as(@user,"password")
        get new_genre_url
        assert_response :success
     end

     test "should get show" do
      get genre_path(@genre)
      assert_response :success
     end

     test "should redirect create when admin not logged in" do
      assert_no_difference 'Genre.count' do
         post genres_path, params:{genre:{name:"fiction"}}
      end
      assert_redirected_to genres_path
     end

end
