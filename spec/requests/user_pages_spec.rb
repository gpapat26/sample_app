require 'spec_helper'
include ApplicationHelper

describe "UserPages" do
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject { page }
  
  describe "signup page" do
    
   before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_selector('p', text: 'Find me in') }
   # puts "#{full_title('Sign up')}"
     it { should have_title(full_title('Sign up')) }
    it { should have_title("#{base_title} | Sign up")}
    end
  end

