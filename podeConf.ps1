# Install Pode if not already installed
if (-not (Get-Module -ListAvailable -Name Pode)) {
    Install-Module -Name Pode -Scope CurrentUser -Force -AllowClobber
}

# Import Pode
Import-Module Pode

# Create a Pode server
Start-PodeServer {
    # Add a route to serve the HTML file
    Add-PodeEndpoint -Address * -Port 80 -Protocol Http
    Add-PodeRoute -Method Get -Path '/' -ScriptBlock {
        Write-PodeJsonResponse -Value @{ 'value' = 'Hello, world!' }
    }
}
