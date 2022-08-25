# frozen_string_literal: true

require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test '名前付きルートに遷移できる' do
    get reviews_show_url
    assert_response :success
  end
end
