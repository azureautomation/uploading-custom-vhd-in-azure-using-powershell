#=======================================
# Define your variables in below
#=======================================
$StorageAccountName = "NameYourStorageAccount"
$Location = "Australia East...mentioned your own"
$ContainerName = "NameOfyourContainer"
$LocalVHD = "Drive\Location of your folder having custom VHD\VHD_Name.vhd"
$AzureVHD = "https://NameYourStorageAccount.blob.core.windows.net/NameOfyourContainer/VHD_Name.vhd"
$DiskName = "MyCustomDisk"
$LabelName = "MyCustomDiskLable"
$VMImageName = "MyCustomImage"
#=======================================


New-AzureStorageAccount –StorageAccountName $StorageAccountName -Location $Location
Set-AzureSubscription -CurrentStorageAccountName $StorageAccountName -SubscriptionName $Subscription
New-AzureStorageContainer -Name $ContainerName -Permission Off
Get-AzureStorageAccount | Format-Table -Property Label
Add-AzureVhd -LocalFilePath $LocalVHD -Destination $AzureVHD
Add-AzureDisk -DiskName $DiskName -MediaLocation $AzureVHD -Label $LabelName -OS Windows
Add-AzureVMImage -ImageName $VMImageName -MediaLocation $AzureVHD -OS Windows