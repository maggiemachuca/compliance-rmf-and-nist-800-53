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





