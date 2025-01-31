module ApiStub
  module Models
    module Network
      # Mock class for Express Route Service Provider Model
      class ExpressRouteServiceProvider
        def self.list_express_route_service_provider_response(network_client)
          service_provider = '{
              "value": [
              {
                "name": "providername",
                "peeringLocations": [
                  "location1",
                  "location2"
                ],
                "bandwidthsOffered": [
                  {
                    "offerName": "100Mbps",
                    "valueInMbps": 100
                  }
                ]
              }
            ]}'
          express_route_servcie_provider_mapper = Azure::Network::Mgmt::V2020_05_01::Models::ExpressRouteServiceProviderListResult.mapper
          network_client.deserialize(express_route_servcie_provider_mapper, Fog::JSON.decode(service_provider)).value
        end
      end
    end
  end
end
