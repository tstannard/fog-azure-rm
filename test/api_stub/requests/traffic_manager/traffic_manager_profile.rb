module ApiStub
  module Requests
    module TrafficManager
      # Mock class for Traffic Manager Profile Requests
      class TrafficManagerProfile
        def self.create_traffic_manager_profile_response(traffic_manager_client)
          body = '{
            "location": "global",
            "tags": {},
            "id": "/subscriptions/###/resourceGroups/fog-test-rg/Microsoft.Network/trafficManagerProfiles/fog-test-profile",
            "name": "fog-test-profile",
            "type": "Microsoft.Network/trafficManagerProfiles",
            "properties": {
              "profileStatus": "Enabled",
              "trafficRoutingMethod": "Performance",
              "dnsConfig": {
                "relativeName": "fog-test-app",
                "fqdn": "myapp.trafficmanager.net",
                "ttl": 30
              },
              "monitorConfig": {
                "profileMonitorStatus": "Online",
                "protocol": "http",
                "port": 80,
                "path": "/monitorpage.aspx"
              },
              "endpoints": [{
                "id": "{ARM resource ID of this endpoint}",
                "name": "{endpoint-name}",
                "type": "Microsoft.Network/trafficManagerProfiles/azureEndpoints",
                "properties": {
                  "endpointStatus": "Enabled",
                  "endpointMonitorStatus": "Online",
                  "targetResourceId": "{resource ID of target resource in Azure}",
                  "target": "myapp.azurewebsites.net",
                  "weight": 10,
                  "priority": 3,
                  "endpointLocation": "centralus"
                }
              }, {
                "id": "{ARM resource ID of this endpoint}",
                "name": "{endpoint-name}",
                "type": "Microsoft.Network/trafficManagerProfiles/externalEndpoints",
                "properties": {
                  "endpointStatus": "Enabled",
                  "endpointMonitorStatus": "Online",
                  "target": "myendpoint.contoso.com",
                  "weight": 10,
                  "priority": 5,
                  "endpointLocation": "northeurope"
                }
              }, {
                "id": "{ARM resource ID of this endpoint}",
                "name": "{endpoint-name}",
                "type": "Microsoft.Network/trafficManagerProfiles/nestedEndpoints",
                "properties": {
                  "endpointStatus": "Enabled",
                  "endpointMonitorStatus": "Online",
                  "targetResourceId": "{resource ID of child Traffic Manager profile}",
                  "weight": 10,
                  "priority": 1,
                  "endpointLocation": "westeurope",
                  "minChildEndpoints": 1
                }
              }]
            }
          }'
          profile_mapper = Azure::TrafficManager::Mgmt::V2018_04_01::Models::Profile.mapper
          traffic_manager_client.deserialize(profile_mapper, Fog::JSON.decode(body))
        end

        def self.list_traffic_manager_profiles_response(traffic_manager_client)
          body = '{
            "values": [{
              "location": "global",
              "tags": {},
              "id": "/subscriptions/###/resourceGroups/fog-test-rg/Microsoft.Network/trafficManagerProfiles/fog-test-profile",
              "name": "fog-test-profile",
              "type": "Microsoft.Network/trafficManagerProfiles",
              "properties": {
                "profileStatus": "Enabled",
                "trafficRoutingMethod": "Performance",
                "dnsConfig": {
                  "relativeName": "fog-test-app",
                  "fqdn": "myapp.trafficmanager.net",
                  "ttl": 30
                },
                "monitorConfig": {
                  "profileMonitorStatus": "Online",
                  "protocol": "http",
                  "port": 80,
                  "path": "/monitorpage.aspx"
                },
                "endpoints": [{
                  "id": "{ARM resource ID of this endpoint}",
                  "name": "{endpoint-name}",
                  "type": "Microsoft.Network/trafficManagerProfiles/azureEndpoints",
                  "properties": {
                    "endpointStatus": "Enabled",
                    "endpointMonitorStatus": "Online",
                    "targetResourceId": "{resource ID of target resource in Azure}",
                    "target": "myapp.azurewebsites.net",
                    "weight": 10,
                    "priority": 3,
                    "endpointLocation": "centralus"
                  }
                }, {
                  "id": "{ARM resource ID of this endpoint}",
                  "name": "{endpoint-name}",
                  "type": "Microsoft.Network/trafficManagerProfiles/externalEndpoints",
                  "properties": {
                    "endpointStatus": "Enabled",
                    "endpointMonitorStatus": "Online",
                    "target": "myendpoint.contoso.com",
                    "weight": 10,
                    "priority": 5,
                    "endpointLocation": "northeurope"
                  }
                }, {
                  "id": "{ARM resource ID of this endpoint}",
                  "name": "{endpoint-name}",
                  "type": "Microsoft.Network/trafficManagerProfiles/nestedEndpoints",
                  "properties": {
                    "endpointStatus": "Enabled",
                    "endpointMonitorStatus": "Online",
                    "targetResourceId": "{resource ID of child Traffic Manager profile}",
                    "weight": 10,
                    "priority": 1,
                    "endpointLocation": "westeurope",
                    "minChildEndpoints": 1
                  }
                }]
              }
            }]
          }'
          profile_mapper = Azure::TrafficManager::Mgmt::V2018_04_01::Models::ProfileListResult.mapper
          traffic_manager_client.deserialize(profile_mapper, Fog::JSON.decode(body))
        end

        def self.profile_hash
          {
            resource_group: 'resource_group',
            name: 'name',
            traffic_routing_method: 'traffic_routing_method',
            relative_name: 'relative_name',
            ttl: 'ttl',
            protocol: 'protocol',
            port: 'port',
            path: 'path',
            endpoints: [{
              name: 'endpoint2',
              traffic_manager_profile_name: 'test-tmp',
              resource_group: 'TestRG-TM',
              type: 'externalEndpoints',
              target: 'test-app.com',
              endpoint_location: 'eastus',
              endpoint_status: 'Enabled',
              priority: 5,
              weight: 10
            }]
          }
        end
      end
    end
  end
end
