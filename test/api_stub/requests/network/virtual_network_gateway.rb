module ApiStub
  module Requests
    module Network
      class VirtualNetworkGateway
        def self.create_virtual_network_gateway_response(network_client)
          network_gateway = '{
            "name": "myvirtualgateway1",
            "location": "West US",
            "tags": { "key1": "value1" },
            "properties": {
              "gatewayType": "DynamicRouting",
              "gatewaySize": "Default",
              "bgpEnabled": true,
              "vpnClientAddressPool": [ "{vpnClientAddressPoolPrefix}" ],
              "defaultSites": [ "mysite1" ]
            }
          }'
          gateway_mapper = Azure::Network::Mgmt::V2020_05_01::Models::VirtualNetworkGateway.mapper
          network_client.deserialize(gateway_mapper, Fog::JSON.decode(network_gateway))
        end

        def self.list_virtual_network_gateway_response(network_client)
          network_gateway = '{
            "value": [
              {
                "name": "myvirtualgateway1",
                "location": "West US",
                "tags": { "key1": "value1" },
                "properties": {
                  "gatewayType": "DynamicRouting",
                  "gatewaySize": "Default",
                  "bgpEnabled": true,
                  "vpnClientAddressPool": [ "{vpnClientAddressPoolPrefix}" ],
                  "defaultSites": [ "mysite1" ]
                }
              }
            ]
          }'
          gateway_mapper = Azure::Network::Mgmt::V2020_05_01::Models::VirtualNetworkGatewayListResult.mapper
          network_client.deserialize(gateway_mapper, Fog::JSON.decode(network_gateway))
        end

        def self.delete_virtual_network_gateway_response
          MsRestAzure::AzureOperationResponse.new(MsRest::HttpOperationRequest.new('', '', ''), Faraday::Response.new)
        end
      end
    end
  end
end
