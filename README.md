## Windows Server 2022 Compliance: Implementing Microsoft Security Baselines Aligned with NIST 800-53 and RMF

Scenario: “Harden a Windows Server 2022 in Azure using Microsoft Security Compliance Toolkit (SCT) baselines; map to NIST 800‑53 controls; produce POA&M.”

Controls used from NIST 800-53:

SC-7: 

## Steps Taken

## Step 1: Provision Azure VM

A Windows Server 2022 virtual machine was provisioned in Azure for the compliance hardening lab.

### Inbound Port Restriction (SC-7)
I created the VM with the image of a Windows Server 2022 Edition. 
Initially, the RDP rule allowed traffic from any IP. After deployment, I edited the NSG to restrict RDP to my public IP only, reducing exposure and aligning with NIST SC-7 (Boundary Protection).

- **Public Inbound Ports**: RDP (TCP 3389) only
**NSG Rule Modified**:
  - Original: Allowed RDP from any source IP
  - Hardened: Modified to allow **only my personal IP** for RDP (inbound)
  - **Description**: "Inbound RDP access limited to analyst’s trusted IP address for secure remote administration."
- **Other Inbound Traffic**: Denied by default


Before:
<img width="1132" height="350" alt="Screenshot 2025-09-30 at 4 05 34 PM" src="https://github.com/user-attachments/assets/d1b3beed-6bc8-45e0-8806-277204dcd1bd" />

After:
<img width="1129" height="355" alt="Screenshot 2025-09-30 at 4 09 40 PM" src="https://github.com/user-attachments/assets/34b14900-fd9e-49bc-b0e3-02153ac63d78" />


## Step 2: Pre-Baseline Evidence Collection

Before applying any Microsoft Security Baseline, I collected evidence of the system’s existing state. I did this through running a script on PowerShell as an admin.

### Collected Files:
- systeminfo.txt — OS and environment details
- gpresult.html — Group Policy applied to the system
- secpol.inf — Local Security Policy export

### Screenshot:
- C:\evidence folder view
- Group Policy export file in browser

C:\evidence contents: 
<img width="688" height="141" alt="Screenshot 2025-09-30 at 4 32 26 PM" src="https://github.com/user-attachments/assets/50e2f9c7-3051-40a9-9a0a-80b6bf656983" />
Group Policy export file in browser:

<img width="1415" height="778" alt="Screenshot 2025-09-30 at 4 39 48 PM" src="https://github.com/user-attachments/assets/fdaf9582-905f-4b24-abfc-ed01521911cf" />
<img width="1401" height="744" alt="Screenshot 2025-09-30 at 4 40 10 PM" src="https://github.com/user-attachments/assets/da905641-eb2a-439c-b970-eb8578817f19" />
<img width="1414" height="397" alt="Screenshot 2025-09-30 at 4 40 21 PM" src="https://github.com/user-attachments/assets/ee487f01-e109-4ca9-99ea-90edbe1d4780" />

secpol.inf contents:
<img width="851" height="820" alt="Screenshot 2025-09-30 at 4 42 03 PM" src="https://github.com/user-attachments/assets/fcd527f3-7976-4894-8922-3e8bae377ad9" />

Scripts used:
- [collect-baseline-evidence.ps1](scripts/collect-baseline-evidence.ps1)


## Step 3: Downloading Microsoft Security Compliance Toolkit (SCT)

I downloaded the following components from the official Microsoft Security Compliance Toolkit page:
- `Windows Server-2022-Security-Baseline.zip`
- `LGPO.zip`
- `PolicyAnalyzer.zip`

Extracted and organized in C:\baselines\SCT


📸 Screenshots:
- Folder view of extracted baselines:
<img width="595" height="92" alt="Screenshot 2025-09-30 at 5 00 27 PM" src="https://github.com/user-attachments/assets/517d0a5b-9ba3-4b87-a6bd-71250be210ff" />

- `LGPO.exe` and `PolicyAnalyzer.exe` file locations
<img width="632" height="118" alt="Screenshot 2025-09-30 at 5 02 21 PM" src="https://github.com/user-attachments/assets/1eb4302e-014c-4cc5-963a-96eb45839253" />
<img width="657" height="233" alt="Screenshot 2025-09-30 at 5 02 58 PM" src="https://github.com/user-attachments/assets/0545f2cf-faa4-4e9e-9c6f-d763ed82029d" />

GPOs` folder showing raw Group Policy backups:
<img width="570" height="223" alt="Screenshot 2025-09-30 at 5 04 27 PM" src="https://github.com/user-attachments/assets/ad0afc3b-5442-4ce0-ab08-bf47bb20edfe" />


## Step 4: Applying the Microsoft Security Baseline Using LGPO.exe

I applied Microsoft’s official security baseline for Windows Server 2022 using the LGPO tool. This imported and enforced local security policies in alignment with NIST 800-53 control families (AC, IA, AU, CM, SC). I restarted the VM to make sure the changes are applied correctly.

- After applying baseline
<img width="978" height="510" alt="Screenshot 2025-09-30 at 5 23 06 PM" src="https://github.com/user-attachments/assets/8f609fcf-ebc2-4ed1-9899-497ee8496a11" />


---- in progress ----








