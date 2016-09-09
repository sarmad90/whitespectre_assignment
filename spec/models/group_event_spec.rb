require 'rails_helper'

RSpec.describe GroupEvent, type: :model do

  # This should return the minimal set of attributes required to create a valid
  # GroupEvent. As you add validations to GroupEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { }
  }

  let(:invalid_attributes) {
    { published: true }
  }
  
  it "is valid with valid attributes" do
    expect(GroupEvent.new(valid_attributes)).to be_valid
  end

  # it "is not valid without a title" do
  #   expect(GroupEvent.new(description: "A description", user: non_admin_user)).not_to be_valid
  # end

  # it "is not valid without a description" do
  #   expect(GroupEvent.new(title: "A title", user: non_admin_user)).not_to be_valid
  # end

  # it "is not valid without a user" do
  #   expect(GroupEvent.new(title: "A title", description: "A description")).not_to be_valid
  # end

  # it "should be able to close from an opened state" do
  #   support_case = GroupEvent.create!(valid_attributes)
  #   expect(support_case.status).to eq("opened")
  #   support_case.close
  #   expect(support_case.status).to eq("closed")
  # end

  # it "should be able to close from a reopened state" do
  #   support_case = GroupEvent.create!(valid_attributes.merge({ status: 2 }))
  #   expect(support_case.status).to eq("reopened")
  #   support_case.close
  #   expect(support_case.status).to eq("closed")
  # end

  # it "should be able to reopen from a closed state" do
  #   support_case = GroupEvent.create!(valid_attributes.merge({ status: 1 }))
  #   expect(support_case.status).to eq("closed")
  #   support_case.reopen
  #   expect(support_case.status).to eq("reopened")
  # end

  # it "should be able to archive from a closed state" do
  #   support_case = GroupEvent.create!(valid_attributes.merge({ status: 1 }))
  #   expect(support_case.status).to eq("closed")
  #   support_case.archive
  #   expect(support_case.status).to eq("archived")
  # end

  # describe "Associations" do
  #   it "belongs_to a user" do
  #     assc = described_class.reflect_on_association(:user)
  #     expect(assc.macro).to eq :belongs_to
  #   end
  # end

end
