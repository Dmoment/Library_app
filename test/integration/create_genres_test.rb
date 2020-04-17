require 'test_helper'

class CreateGenresTest < ActionDispatch::IntegrationTest
     
       def setup
        @user= User.create(username: "john", email: "john@example.com", password:"password", admin: true)
       end

    test "get new genre form and create genre" do
        sign_in_as(@user,"password")
        get new_genre_path #1. It will send get request to the path 
        assert_template 'genres/new' #2.from that path it will fetch this template
        assert_difference 'Genre.count', 1 do #3.assert_difference verifies that the result of evaluating its first argument (a String which can be passed to eval) changes by a certain amount after calling the block it was passed
         #the submission of new form is handeled by create action which is post request 
         post genres_path ,params:{ genre:{name: "fiction"}} 
         follow_redirect!
        end
        assert_template 'genres/index' #5.After creating the Genre it will redirect you to the index page
        assert_match 'fiction', response.body #6. This will just display a message body.

    end

   
end