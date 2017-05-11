require 'test_helper'

class DocumentSearchTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_search_type = document_search_types(:one)
  end

  test "should get index" do
    get document_search_types_url
    assert_response :success
  end

  test "should get new" do
    get new_document_search_type_url
    assert_response :success
  end

  test "should create document_search_type" do
    assert_difference('DocumentSearchType.count') do
      post document_search_types_url, params: { document_search_type: { name: @document_search_type.name } }
    end

    assert_redirected_to document_search_type_url(DocumentSearchType.last)
  end

  test "should show document_search_type" do
    get document_search_type_url(@document_search_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_search_type_url(@document_search_type)
    assert_response :success
  end

  test "should update document_search_type" do
    patch document_search_type_url(@document_search_type), params: { document_search_type: { name: @document_search_type.name } }
    assert_redirected_to document_search_type_url(@document_search_type)
  end

  test "should destroy document_search_type" do
    assert_difference('DocumentSearchType.count', -1) do
      delete document_search_type_url(@document_search_type)
    end

    assert_redirected_to document_search_types_url
  end
end
