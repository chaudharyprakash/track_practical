require 'test_helper'

class RegistryTest < ActiveSupport::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registries)
  end

  test "should get show" do
    registry = registries(:one)
    get :show, params: { id: registry.id }
    assert_response :success
    assert_equal registry, assigns(:registry)
  end
end
