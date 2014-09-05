<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="SpotifyPlaces.CloudService" generation="1" functional="0" release="0" Id="c21f667a-753a-4700-b29a-d898a662b645" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="SpotifyPlaces.CloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="SpotifyPlaces.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/LB:SpotifyPlaces.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:SpotifyPlaces.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="SpotifyPlaces.Web" generation="1" functional="0" release="0" software="C:\Projects\SpotifyPlaces\Azure\SpotifyPlaces.CloudService\csx\Release\roles\SpotifyPlaces.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SpotifyPlaces.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;SpotifyPlaces.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="SpotifyPlaces.WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="SpotifyPlaces.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="SpotifyPlaces.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="7d09f73e-fdaa-487a-ae42-a5de52bab9e2" ref="Microsoft.RedDog.Contract\ServiceContract\SpotifyPlaces.CloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="f939a800-2082-41d5-b421-d2e43a6ae967" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>