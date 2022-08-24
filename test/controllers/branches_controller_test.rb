# frozen_string_literal: true

require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch = branches(:one)
  end

  test 'should get branches page' do
    get branch_url(@branch.id)
    assert_response :success
  end
end
