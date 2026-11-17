# Microsoft Entra ID user provisioning

param(
    [Parameter(Mandatory = $true)]
    [string]$Domain
)

# Verify Microsoft Graph permissions
$context = Get-MgContext

if (-not $context -or
    $context.Scopes -notcontains "User.ReadWrite.All") {
    throw "Connect to Microsoft Graph with User.ReadWrite.All first."
}

# Employee details
$upn = "taylor.lab@$Domain"

# Prevent duplicate creation
$existing = Get-MgUser `
    -Filter "userPrincipalName eq '$upn'" `
    -ErrorAction Stop

if ($existing) {
    Write-Host "User already exists: $upn"
    return
}

# Generate a temporary password
$password = [guid]::NewGuid().ToString("N") + "aA1!"

# Provision the employee
$newUser = New-MgUser `
    -DisplayName "Taylor IT" `
    -GivenName "Taylor" `
    -Surname "IT" `
    -Department "IT" `
    -UserPrincipalName $upn `
    -MailNickname "taylor.it" `
    -AccountEnabled:$true `
    -PasswordProfile @{
        Password = $password
        ForceChangePasswordNextSignIn = $true
    } `
    -ErrorAction Stop

Write-Host "Created: $($newUser.UserPrincipalName)"
Write-Host "Temporary password (keep private): $password"
