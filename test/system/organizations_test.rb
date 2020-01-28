require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
  end

  test "ensuring organization name, email and password are required" do
    visit signup_url

    click_on id: "btn-signup"

    assert has_current_path?(organizations_path)

    assert page.has_selector?('#error_explanation ul li', count: 3)
    assert page.has_selector?('form .field_with_errors label', count: 3)

  end

  test "creating a Organization" do
    visit signup_url

    fill_in "Organization name", with: "New organization"
    fill_in "Description", with: "Some testing organization"
    fill_in "Email", with: "organization@gmail.com"
    fill_in "Password", with: "123"

    click_on id: "btn-signup"

    assert has_current_path?(root_path)

    organization = Organization.last
    assert_equal "New organization", organization.name
    assert_equal "Some testing organization", organization.description
    assert_equal "organization@gmail.com", organization.admin.email
    assert organization.admin.authenticate("123")
  end
end
