require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com" ,
                        password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:microposts) }
  
  it { should respond_to(:admin) }
  it { should respond_to(:microposts) }
  

  it { should be_valid }
  
  
  describe "when password is not present" do
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: " ", password_confirmation: " ")
  end
  it { should_not be_valid }
  end
  
  
  describe "when password doesn't match confirmation" do
  before { @user.password_confirmation = "mismatch" }
  it { should_not be_valid }
  end
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
    describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  
  
  
   describe "remember token" do
    before { @user.save }
   
    its(:remember_token) { should_not be_blank }
   end
   
  
  
  
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  
  
  
  describe "micropost associations" do

    before { @user.save }
    
    let!(:older_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_micropost) do
      FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
      expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
    end
  end
end
  

