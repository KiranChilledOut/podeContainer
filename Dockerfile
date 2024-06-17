# Use the PowerShell image
FROM mcr.microsoft.com/powershell

# Set the working directory
WORKDIR /app

SHELL ["pwsh", "-Command"]

# Copy the PowerShell script into the container

COPY podeConf.ps1 .

# Install Pode and required modules
RUN Install-Module -Name Pode -Scope AllUsers -Force -AllowClobber

# Expose port 8003
EXPOSE 80

# Start the Pode server
CMD ["pwsh", "-File", "./podeConf.ps1"]