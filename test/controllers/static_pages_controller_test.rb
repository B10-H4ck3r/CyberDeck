require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "CyberDeck"
  end


  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get connect" do
    get connect_path
    assert_response :success
    assert_select "title", "Connect | #{@base_title}"
  end

  test "should get donate" do
    get donate_path
    assert_response :success
    assert_select "title", "Donate | #{@base_title}"
  end

  test "should get devlogs" do
    get devlogs_path
    assert_response :success
    assert_select "title", "DevLogs | #{@base_title}"
  end

end
