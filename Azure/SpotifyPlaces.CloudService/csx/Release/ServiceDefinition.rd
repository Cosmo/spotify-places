<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="SpotifyPlaces.CloudService" generation="1" functional="0" release="0" Id="4923b04a-7ddd-468c-94d8-4eb342c2d071" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="SpotifyPlaces.CloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="SpotifyPlaces.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/LB:SpotifyPlaces.Web:Endpoint1" />
          </inToChannel>
        </inPort>
        <inPort name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/LB:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inToChannel>
        </inPort>
        <inPort name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint" protocol="tcp">
          <inToChannel>
            <lBChannelMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/LB:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Certificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapCertificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </maps>
        </aCS>
        <aCS name="Certificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapCertificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ClientThumbprint" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ClientThumbprint" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Enabled" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Version" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Version" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ServerThumbprint" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ServerThumbprint" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
          </maps>
        </aCS>
        <aCS name="SpotifyPlaces.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapSpotifyPlaces.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <sFSwitchChannel name="IE:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector" />
          </toPorts>
        </sFSwitchChannel>
        <sFSwitchChannel name="IE:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Forwarder">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.Forwarder" />
          </toPorts>
        </sFSwitchChannel>
        <lBChannel name="LB:SpotifyPlaces.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </toPorts>
        </lBChannel>
        <lBChannel name="LB:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp">
          <toPorts>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapCertificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" kind="Identity">
          <certificate>
            <certificateMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
          </certificate>
        </map>
        <map name="MapCertificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" kind="Identity">
          <certificate>
            <certificateMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" />
          </certificate>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ClientThumbprint" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.ClientThumbprint" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Enabled" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Version" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Version" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteDebugger.ServerThumbprint" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.ServerThumbprint" />
          </setting>
        </map>
        <map name="MapSpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" kind="Identity">
          <setting>
            <aCSMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" />
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
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" protocol="tcp" />
              <inPort name="Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint" protocol="tcp" portRanges="8172" />
              <inPort name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp" portRanges="3389" />
              <outPort name="SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SW:SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountEncryptedPassword" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountExpiration" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.AccountUsername" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteAccess.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteDebugger.ClientThumbprint" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Enabled" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector.Version" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteDebugger.ServerThumbprint" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SpotifyPlaces.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;SpotifyPlaces.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteDebugger.Connector&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteDebugger.Forwarder&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
            <storedcertificates>
              <storedCertificate name="Stored0Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
                </certificate>
              </storedCertificate>
              <storedCertificate name="Stored1Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" certificateStore="My" certificateLocation="System">
                <certificate>
                  <certificateMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web/Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" />
                </certificate>
              </storedCertificate>
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteDebugger.TransportValidation" />
            </certificates>
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
    <implementation Id="57c1ffa1-1ab3-459f-8299-f3cd3678ac91" ref="Microsoft.RedDog.Contract\ServiceContract\SpotifyPlaces.CloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="16b8eedb-1690-4d96-8849-594bb21581e4" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="cae77db7-7017-4377-83ce-e6c0acfe6c56" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="cd949483-b5f4-4291-98d5-db07343f08df" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.WebDeploy.InputEndpoint" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>