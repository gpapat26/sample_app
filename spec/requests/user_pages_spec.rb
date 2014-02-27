require 'spec_helper'
include ApplicationHelper

describe "UserPages" do
  
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
  end
  
 

  
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  let(:user) { FactoryGirl.create(:user) }
  
  subject { page }
  
  describe "signup page" do
    
   before { visit signup_path }

    it { should have_content('Sign up') }
#    it { should have_selector('p', text: 'Find me in') }
   # puts "#{full_title('Sign up')}"
     it { should have_title(full_title('Sign up')) }
    it { should have_title("#{base_title} | Sign up")}
    end
    
  
  
  describe "profile page" do
  # Replace with code to make a user variable
  before { visit user_path(user) }

  it { should have_content(user.name) }
  it { should have_title(user.name) }
end

  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
        describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
      
    end
  end
  
  
#   describe "edit" do
#    let(:user) { FactoryGirl.create(:user) }
#    before { visit edit_user_path(user) }
#
#    describe "page" do
#      it { should have_content("Update your profile") }
#      it { should have_title("Edit user") }
#      it { should have_link('change', href: 'http://gravatar.com/emails') }
#    end
#
#    describe "with invalid information" do
#      before { click_button "Save changes" }
#
#      it { should have_content('error') }
#    end
#  end
  
  end

