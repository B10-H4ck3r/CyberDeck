require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(fname: "Dr. Aubrey", lname: "Love II", uname: "B10 H4ck3r", tel: "254.221.3846", email: "b10-h4ck3r@protonmail.com", bio: "Hacker, coder, nerd, husband, father", job_title: "Lead Programmer", job_comp: "B10 H4z4rd Studios", job_bio: "I design & create new programs for websites, mobile, and desktop.", clg_degree: "Doctor of Computer Science", clg_name: "Ashley University", password: "P@s$w0Rd", password_confirmation: "P@s$w0Rd")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "First Name (fname) should be present" do
    @user.fname = "    "
    assert_not @user.valid?
  end

  test "First Name (fname) should not be too long" do
    @user.fname = "a" * 51
    assert_not @user.valid?
  end

  test "Last Name (lname) should be present" do
    @user.lname = "    "
    assert_not @user.valid?
  end

  test "Last Name (lname) should not be too long" do
    @user.lname = "a" * 51
    assert_not @user.valid?
  end

  test "Username (uname) should be present" do
    @user.uname = "    "
    assert_not @user.valid?
  end

  test "Username (uname) should not be too long" do
    @user.uname = "a" * 51
    assert_not @user.valid?
  end

  test "Telephone (tel) should be present" do
    @user.tel = "    "
    assert_not @user.valid?
  end

  test "Telephone (tel) should not be too long" do
    @user.tel = "a" * 15
    assert_not @user.valid?
  end

  test "Biography (bio) should be present" do
    @user.bio = "    "
    assert_not @user.valid?
  end

  test "Biography (bio) should not be too long" do
    @user.bio = "a" * 256
    assert_not @user.valid?
  end

  test "Job Title (job_title) should be present" do
    @user.job_title = "    "
    assert_not @user.valid?
  end

  test "Job Title (job_title) should not be too long" do
    @user.job_title = "a" * 256
    assert_not @user.valid?
  end

  test "Job Company (job_comp) should be present" do
    @user.job_comp = "    "
    assert_not @user.valid?
  end

  test "Job Company (job_comp) should not be too long" do
    @user.job_comp = "a" * 156
    assert_not @user.valid?
  end

  test "Job Description (job_bio) should be present" do
    @user.job_bio = "    "
    assert_not @user.valid?
  end

  test "Job Description (job_bio) should not be too long" do
    @user.job_bio = "a" * 256
    assert_not @user.valid?
  end

  test "College Degree (clg_degree) should be present" do
    @user.clg_degree = "    "
    assert_not @user.valid?
  end

  test "College Degree (clg_degree) should not be too long" do
    @user.clg_degree = "a" * 256
    assert_not @user.valid?
  end

  test "College Name (clg_name) should be present" do
    @user.clg_name = "    "
    assert_not @user.valid?
  end

  test "College Name (clg_name) should not be too long" do
    @user.clg_name = "a" * 256
  end

  test "Email (email) should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "Email (email) should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "Email (email) validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "Email (email) validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "Email (email) addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "Email (email) addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "Password (password) should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "Password (password) should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end
