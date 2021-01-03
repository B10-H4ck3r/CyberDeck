require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { fname:  "",
                                         lname: "",
                                         uname: "",
                                         tel: "",
                                         bio: "",
                                         job_title: "",
                                         job_comp: "",
                                         job_bio: "",
                                         clg_degree: "",
                                         clg_name: "",
                                         email: "b10-h4ck3r@protonmail",
                                         password:              "P@s$",
                                         password_confirmation: "w0Rd" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { fname:  "Dr. Aubrey",
                                         lname: "Love II",
                                         uname: "B10 H4ck3r",
                                         tel: "(254) 221-3846",
                                         bio: "Hacker | Coder | Nerd | Husband | Father!",
                                         job_title: "Programmer",
                                         job_comp: "B10 H4z4rd Studios",
                                         job_bio: "Design & Build websites, web-based apps, android apps, C++ Programs!",
                                         clg_degree: "Doctor of Computer Science",
                                         clg_name: "Ashley University",
                                         email: "b10-h4ck3r@protonmail.com",
                                         password:              "P@s$w0Rd",
                                         password_confirmation: "P@s$w0Rd" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

end
