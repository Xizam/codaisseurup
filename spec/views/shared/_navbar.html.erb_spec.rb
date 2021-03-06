require "rails_helper"

describe "shared/_navbar.html.erb" do
  before { sign_in user }

  context "without profile" do
    let (:user) { create :user }
    it "renders email" do
      render
      expect(rendered).to have_content(user.email)
    end
  end

  context "with profile" do
    let (:profile) { build :profile}
    let (:user) { create :user, profile: profile }

    it "render firt and last name" do
      render
      expect(rendered).to have_content(profile.first_name)
      expect(rendered).to have_content(profile.last_name)
    end
  end
end

describe "shared/_navbar.html.erb" do
  it "show sign up and log in links" do
    render
    expect(rendered).to have_link("Log In", href: new_user_session_path)
    expect(rendered).to have_link("Sign Up", href: new_user_registration_path)
  end
end
