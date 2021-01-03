require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:aubrey)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { fname:  "",
                                              lname: "",
                                              uname: "",
                                              bio: "",
                                              tel: "",
                                              job_bio: "",
                                              job_comp: "",
                                              job_title: "",
                                              clg_name: "",
                                              clg_degree: "",
                                              email: "b10-h4ck3r@protonmail",
                                              password:              "P@s$",
                                              password_confirmation: "W0Rd" } }

    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    fname  = "Dr. Aubrey"
    lname  = "Love II"
    uname  = "B10 H4ck3r"
    bio    = "Hacker | Coder | Nerd | Father | Husband"
    tel    = "(254) 221-3846"
    job_bio = "Build websites & web-based applications"
    job_title = "Programmer"
    job_comp = "B10 H4z4rd Studios"
    clg_name = "Ashley University"
    clg_degree = "Doctor of Computer Science"
    email = "b10-h4ck3r@protonmail.com"
    patch user_path(@user), params: { user: { fname:  fname,
                                              lname: lname,
                                              uname: uname,
                                              bio: bio,
                                              tel: tel,
                                              job_bio: job_bio,
                                              job_title: job_title,
                                              job_comp: job_comp,
                                              clg_name: clg_name,
                                              clg_degree: clg_degree,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal fname,  @user.fname
    assert_equal lname,  @user.lname
    assert_equal uname, @user.uname
    assert_equal bio, @user.bio
    assert_equal tel, @user.tel
    assert_equal job_bio @user.job_bio
    assert_equal job_title @user.job_title
    assert_equal job_comp @user.job_comp
    assert_equal clg_name @user.clg_name
    assert_equal clg_degree @user.clg_degree
    assert_equal email, @user.email
  end

end
