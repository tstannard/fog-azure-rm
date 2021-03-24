module Fog
  module Network
    class AzureRM
      # Real class for Network Request
      class Real
        def add_dns_servers_in_virtual_network(resource_group_name, virtual_network_name, dns_servers)
          Fog::Logger.debug "Adding DNS Servers: #{dns_servers.join(', ')} in Virtual Network: #{virtual_network_name}"
          virtual_network = get_virtual_network_object_for_add_dns!(resource_group_name, virtual_network_name, dns_servers)
          virtual_network = create_or_update_vnet(resource_group_name, virtual_network_name, virtual_network)
          Fog::Logger.debug "DNS Servers: #{dns_servers.join(', ')} added successfully."
          virtual_network
        end

        private

        def get_virtual_network_object_for_add_dns!(resource_group_name, virtual_network_name, dns_servers)
          virtual_network = get_vnet(resource_group_name, virtual_network_name)
          if virtual_network.dhcp_options.nil?
            dhcp_options = Azure::Network::Mgmt::V2020_05_01::Models::DhcpOptions.new
            dhcp_options.dns_servers = dns_servers
            virtual_network.dhcp_options = dhcp_options
          else
            attached_servers = virtual_network.dhcp_options.dns_servers
            virtual_network.dhcp_options.dns_servers = attached_servers | dns_servers
          end
          virtual_network
        end
      end

      # Mock class for Network Request
      class Mock
        def add_dns_servers_in_virtual_network(*)
          virtual_network = {
            'id' => '/subscriptions/########-####-####-####-############/resourceGroups/fog-rg/providers/Microsoft.Network/virtualNetworks/fog-vnet',
            'name' => 'fog-vnet',
            'type' => 'Microsoft.Network/virtualNetworks',
            'location' => 'westus',
            'properties' =>
              {
                'addressSpace' =>
                  {
                    'addressPrefixes' =>
                      [
                        '10.1.0.0/16',
                        '10.2.0.0/16'
                      ]
                  },
                'dhcpOptions' => {
                  'dnsServers' => [
                    '10.1.0.5',
                    '10.1.0.6'
                  ]
                },
                'subnets' =>
                  [
                    {
                      'id' => '/subscriptions/########-####-####-####-############/resourceGroups/fog-rg/providers/Microsoft.Network/virtualNetworks/fog-vnet/subnets/fog-subnet',
                      'properties' =>
                        {
                          'addressPrefix' => '10.1.0.0/24',
                          'provisioningState' => 'Succeeded'
                        },
                      'name' => 'fog-subnet'
                    }
                  ],
                'resourceGuid' => 'c573f8e2-d916-493f-8b25-a681c31269ef',
                'provisioningState' => 'Succeeded'
              }
          }
          vnet_mapper = Azure::Network::Mgmt::V2020_05_01::Models::VirtualNetwork.mapper
          @network_client.deserialize(vnet_mapper, virtual_network)
        end
      end
    end
  end
end
