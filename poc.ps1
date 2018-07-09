$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2("shady\shady.cer")
$rootStore = Get-Item cert:\LocalMachine\Root
$rootStore.Open("ReadWrite")
$rootStore.Add($cert)
$rootStore.Close()
$rootStore = Get-Item cert:\LocalMachine\TrustedPublisher
$rootStore.Open("ReadWrite")
$rootStore.Add($cert)
$rootStore.Close()

Invoke-Expression "InfDefaultInstall.exe shady\shady.inf" 
