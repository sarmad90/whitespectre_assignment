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

  it "has event duration" do
    some_group_event = GroupEvent.create!(start_date: 3.days.ago, end_date: 1.days.ago)
    expect(some_group_event.duration).to eq("2.0 days")
  end

  it "isn't actually destroyed from DB" do
    some_group_event = GroupEvent.create!
    count = GroupEvent.unscoped.count
    expect {
      some_group_event.destroy
    }.to change(GroupEvent, :count).by(-1)
    expect(GroupEvent.unscoped.count).to eq(count)
  end

  it "can be published" do
    some_group_event = GroupEvent.create!(start_date: 3.days.ago, end_date: 1.days.ago,
      name: "Some event", description: "some description")
    expect(some_group_event.publish).to be true
    expect(some_group_event.published).to be true
  end

  it "is not valid without a name if published" do
    expect(GroupEvent.new(description: "A description", start_date: 3.days.ago,
      end_date: DateTime.now, published: true)).not_to be_valid
  end

  it "is not valid without a description if published" do
    expect(GroupEvent.new(name: "A title", start_date: 3.days.ago,
      end_date: DateTime.now, published: true)).not_to be_valid
  end

  it "is not valid without a start_date if published" do
    expect(GroupEvent.new(name: "A title", description: "some description",
      end_date: DateTime.now, published: true)).not_to be_valid
  end

  it "is not valid without a end_date if published" do
    expect(GroupEvent.new(name: "A title", description: "some description",
      start_date: 3.days.ago, published: true)).not_to be_valid
  end

end
