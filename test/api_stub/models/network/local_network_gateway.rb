module ApiStub
  module Models
    module Network
      # Mock class for Local Network Gateway Model
      class LocalNetworkGateway
        def self.create_local_network_gateway_response(network_client)
          local_network_gateway = {
            'id' => '/subscriptions/<Subscription_id>/resourceGroups/learn_fog/providers/Microsoft.Network/localNetworkGateways/testLocalNetworkGateway',
            'name' => 'testLocalNetworkGateway',
            'type' => 'Microsoft.Network/localNetworkGateways',
            'location' => 'eastus',
            'properties' =>
              {
                'local_network_address_space' => {
                  'address_prefixes' => []
                },
                'gateway_ip_address' => '192.168.1.1',
                'bgp_settings' => {
                  'asn' => 100,
                  'bgp_peering_address' => '192.168.1.2',
                  'peer_weight' => 3
                }
              }
          }
          local_network_gateway_mapper = Azure::Network::Mgmt::V2020_05_01::Models::LocalNetworkGateway.mapper
          network_client.deserialize(local_network_gateway_mapper, local_network_gateway)
        end
      end
    end
  end
end
