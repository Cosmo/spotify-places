﻿<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="SpotifyPlaces.CloudService" generation="1" functional="0" release="0" Id="94951871-3d4e-415a-acb1-2525f300d4ea" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
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
      </componentports>
      <settings>
        <aCS name="Certificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" defaultValue="">
          <maps>
            <mapMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/MapCertificate|SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
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
              <aCS name="Microsoft.WindowsAzure.Plugins.RemoteForwarder.Enabled" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SpotifyPlaces.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;SpotifyPlaces.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteAccess.Rdp&quot; /&gt;&lt;e name=&quot;Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
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
            </storedcertificates>
            <certificates>
              <certificate name="Microsoft.WindowsAzure.Plugins.RemoteAccess.PasswordEncryption" />
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
    <implementation Id="7c08ecd6-639e-40a6-8c9c-bd518d870d2a" ref="Microsoft.RedDog.Contract\ServiceContract\SpotifyPlaces.CloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="f574ffe2-8784-49c0-a935-26c44b0f1494" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
        <interfaceReference Id="72ad3aad-204a-485c-8daf-8a0501b7b39f" ref="Microsoft.RedDog.Contract\Interface\SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/SpotifyPlaces.CloudService/SpotifyPlaces.CloudServiceGroup/SpotifyPlaces.Web:Microsoft.WindowsAzure.Plugins.RemoteForwarder.RdpInput" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>