require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "signup" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    #describe "with invalid information" do
    #  before do
    #    fill_in "Name",           with: "Example User"
    #    fill_in "Email",          with: "user+example.com"
    #    fill_in "Password",       with: "foo"
    #    fill_in "Confirmation",   with: "foo"
    #  end
    #  it "should have the error messages" do
    #    click_button
    #    it { should have_selector(text: 'Email is invalid') }
    #    it { should have_selector(text: "Password is too short (minimum is 6 characters)") }
    #  end
    #end

    describe "with vaild information" do
      before do
        fill_in "Name",           with: "Example User"
        fill_in "Email",          with: "user@example.com"
        fill_in "Password",       with: "foobar"
        fill_in "Confirmation",   with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

    #describe "with vaild information" do
    #  before let(:user) { FactoryGirl.create(:user)}
    #  it "should flash the success message" do
    #    it { should have_selector('div',    text: 'Welcome to the Sample App!') }
    #  end
    #end

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user)}
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

end
