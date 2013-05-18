require 'test_helper'

class MDMagickRailsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test "engine" do
    assert_equal ::Rails::Engine, MDMagick::Rails::Engine.superclass
  end

  test "fonts" do
    get "/assets/icomoon.eot"
    assert_response :success
    get "/assets/icomoon.ttf"
    assert_response :success
    get "/assets/icomoon.woff"
    assert_response :success
    get "/assets/icomoon.svg"
    assert_response :success
  end

  test "stylesheets" do
    get "/assets/mdmagick.css"
    assert_response :success
    get "/assets/mdmagick/style.css"
    assert_mdmagick(response)
  end

  test "stylesheets contain asset pipeline references to fonts" do
    get "/assets/mdmagick/style.css"
    assert_match "/assets/icomoon.eot",  response.body
    assert_match "/assets/icomoon.eot?#iefix", response.body
    assert_match "/assets/icomoon.woff", response.body
    assert_match "/assets/icomoon.ttf",  response.body
  end


  test "javascripts are available" do
    get "/assets/mdmagick.js"
    assert_response :success
    get "/assets/mdmagick/a-tools.js"
    assert_response :success
    get "/assets/mdmagick/showdown.js"
    assert_response :success
    get "/assets/mdmagick/lte-ie7.js"
    assert_response :success
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end

  def assert_mdmagick(response)
    assert_response :success
    assert_match(/font-family:\s*'icomoon';/, response.body)
  end
end
