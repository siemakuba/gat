require 'rails_helper'

describe 'Database seeds', slow: true do

  describe 'Country' do
    let(:countries) { Country.all }

    specify '3 Countries' do
      expect(countries.count).to eql(3)
    end

    specify 'each with different panel provider' do
      expect(countries.pluck(:panel_provider_id).uniq.count).to eql(3)
    end
  end

  describe 'PanelProvider' do
    specify '3 Panel Providers' do
      expect(PanelProvider.count).to eql(3)
    end
  end

  describe 'Location' do
    specify '20 Locations of any type (city, region, state, etc.)' do
      expect(Location.count).to eql(20)
    end
  end

  describe 'LocationGroup' do
    let(:location_groups) { LocationGroup.all }

    specify '4 Location Groups' do
      expect(location_groups.count).to eql(4)
    end

    specify '3 of them with different provider (== 3 unique providers)' do
      expect(location_groups.pluck(:panel_provider_id).uniq.count).to eql(3)
    end

    specify 'and 1 would belong to any of them (== one provider is used twice)' do
      expect(location_groups.group(:panel_provider_id).count.values.max).to eql(2)
    end
  end

  describe 'TargetGroup' do
    let(:target_groups) { TargetGroup.all }

    specify '4 root Target Groups' do
      expect(target_groups.root_nodes.count).to eql(4)
    end

    specify 'each root should start a tree which is minimium 3 levels deep' do

      target_groups.root_nodes.each do |root_node|
        tree = []

        begin
          tree << root_node
        end while root_node = root_node.children.first

        expect(tree.size).to be >= 3
      end
    end
  end
end
