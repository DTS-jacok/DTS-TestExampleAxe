rem Convert QTP TSR to Axe format XML (QTP 8.2 only)
rem "C:\Program Files\Odin Technology\Axe\AxeIntQTP" "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP.tsr" "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP.xml"

rem Export QTP TSR to QTP XML (from QTP 9.1)
"C:\Program Files\Odin Technology\Axe\AxeIntQTP" /export "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP.tsr" "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP.xml"

rem Convert exported QTP XML to Axe format XML
rem "C:\Program Files\Odin Technology\Axe\AxeIntQTP" "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP.xml" "c:\program files\odin technology\axe\samples\odinportal\objectmap\OdinPortalQTP(Axe).xml"