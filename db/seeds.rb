panel_providers = PanelProvider.create([
  { code: 'provider1' },
  { code: 'provider2' },
  { code: 'provider3' }
])

Country.create([
  { country_code: 'pl', panel_provider: panel_providers[0] },
  { country_code: 'de', panel_provider: panel_providers[1] },
  { country_code: 'uk', panel_provider: panel_providers[2] }
])

cities = %w{
  Tirana Minsk Zagreb Copenhagen Talinn
  Helsinki Paris Berlin Warsaw London
  Athens Budapest Lisbon Rome Amsterdam
  Madrid Ankara Moscow Dublin Reykjavik
}

Location.create(cities.map { |city| { name: city } })

target_groups = []

Array(panel_providers << panel_providers.sample).each do |panel_provider|
  LocationGroup.create(
    name: "Group for PanelProvider##{panel_provider.id}",
    country: panel_provider.countries.sample,
    panel_provider: panel_provider
  )

  target_groups << TargetGroup.create(
    name: "Group for PanelProvider##{panel_provider.id}",
    panel_provider: panel_provider
  )
end

target_groups.map.with_index do |target_group, qty|
  levels = 3 + qty
  node = target_group

  while levels > 0 do
    node = node.children.create(
      name: "Child of #{node.class.name}##{node.id}",
      panel_provider: node.panel_provider
    )
    levels = levels - 1
  end
end
