## Ubuntu

[https://docs.mcafee.com/bundle/agent-5.7.0-installation-guide/page/GUID-AD61E9B0-5ABF-4B27-B070-3AC25AD06BE4.html](https://docs.mcafee.com/bundle/agent-5.7.0-installation-guide/page/GUID-AD61E9B0-5ABF-4B27-B070-3AC25AD06BE4.html)

## Agent

**Task**

1. Select  **Menu**  →  **Systems**  →  **System Tree**.
2. Click  **New Systems** , select  **Create and download agent installation package** , choose the appropriate  **Agent version** , click  **OK** , and save the agentPackages.zip file that contains the install.sh file.
3. Open  **Terminal** , then switch to the location where you copied the install.sh file.
4. Generate maprovision.deb file from install.sh using the option (-p).
  - Run the command, giving root credentials when requested. For example:

./install.sh -p

1. The maprovision.deb file is generated.
2. To collect mfema.deb and mfert.deb files, do one of the following:

- Collect using install.sh file.
  - Copy the install.sh file to a non-windows system.
  - Open  **Terminal** , then switch to the location where you copied the install.sh file.
  - Run the following command to extract the installation package.

unzip install.sh

  - The following installation files are available. Collect the files as needed. From McAfee Agent 5.6.6 onwards, McAfee Agent includes version information in the filename.
    - mfema-\&lt;build\_number\&gt;.i686.deb
    - mfema-\&lt;build\_number\&gt;.x86\_64.deb
    - mfert-\&lt;build\_number\&gt;.i686.deb.

**NOTE:**  Use the appropriate mfema package based on the operating system used. For example:

For a 64-bit operating system: Use mfema-\&lt;build\_number\&gt;.x86\_64.deb

For a 32-bit operating system: Use mfema-\&lt;build\_number\&gt;.i686.deb

- Collect from McAfee ePO Master Repository.

The files are available in the selected repository path. For example, if checked in to the Current branch of the McAfee ePO software repository, the path of the required files is C:\Program Files\McAfee\ePolicy Orchestrator\DB\Software\Current\EPOAGENT3700LYNX\Install\0409. Change the file path based on the branch selected.

1. To collect mfedx-ma-\&lt;build\_number\&gt;.deb file, do the following:

  - Copy the DXL.zip file to a non-windows system.

The DXL.zip file is available in the selected repository path. For example, if checked in to the Current branch of the McAfee ePO software repository, the path of the required files is C:\Program Files\McAfee\ePolicy Orchestrator\DB\Software\Current\EPOAGENT3700LYNX\Install\0409. Change the file path based on the branch selected.

  - Open  **Terminal** , then switch to the location where you copied the DXL.zip file.
  - Run the following command to extract the installation package.

unzip DXL.zip

  - The following installation files are available. Collect the files as needed.
    - mfedx-ma-\&lt;build\_number\&gt;.i686.deb
    - mfedx-ma-\&lt;build\_number\&gt;.x86\_64.deb

**NOTE:**  Use the appropriate mfedx-ma-\&lt;build\_number\&gt; package based on the operating system used. For example:

For a 64-bit operating system: Use mfedx-ma-\&lt;build\_number\&gt;.x86\_64.deb

For a 32-bit operating system: Use mfedx-ma-\&lt;build\_number\&gt;.i686.deb

- Check in the files (mfema-\&lt;build\_number\&gt;.i686.deb, mfema-\&lt;build\_number\&gt;.x86\_64.deb, mfert-\&lt;build\_number\&gt;.i686.deb, and mfedx-ma-\&lt;build\_number\&gt;.deb) into the third-party deployment tools (such as apt-get) repository.
- Install McAfee Agent in managed mode using third-party tools (for example, apt-get install maprovision.deb).

## ENS

[https://docs.mcafee.com/bundle/endpoint-security--v10-7-0-installation-guide-linux/page/GUID-18018C2D-6ACD-4C54-BC93-B3D4474DEA22.html](https://docs.mcafee.com/bundle/endpoint-security--v10-7-0-installation-guide-linux/page/GUID-18018C2D-6ACD-4C54-BC93-B3D4474DEA22.html)

## Task

1. Add these files to your APT repository.
  - McAfeeESP-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;.deb
  - McAfeeRt-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;.deb
  - McAfeeTP-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;.deb
  - McAfeeESPFileAccess-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;.deb
  - McAfeeESPAac-\&lt;version\_number-\&lt;build-number\&gt;.deb
2. Install the software.

apt-get install mcafeetp