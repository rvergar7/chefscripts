Redhat/CENTOS:

AGENT

https://docs.mcafee.com/bundle/agent-5.7.0-installation-guide/page/GUID-5E215352-6764-476B-B7A4-0A26232B7324.html

**Task**

1. Select  **Menu**  →  **Systems**  →  **System Tree**.
2. Click  **New Systems** , select  **Create and download agent installation package** , choose the appropriate  **Agent version** , click  **OK** , and save the agentPackages.zip file that contains the install.sh file.
3. Open  **Terminal** , then switch to the location where you copied the install.sh file.
4. Generate MAProvision.rpm file from install.sh using the option (-p).

**IMPORTANT:**  Make sure the rpm-build package is installed on the local system before generating MAProvision files. Run the following command to check if it is already present.

rpm -q redhat-rpm-config

If the rpm-build package is not installed on the local system, run the following command to install.

yum install rpm-build

If the unzip package is not installed on the local system, run the following command to install.

yum install unzip

- Run the command, giving root credentials when requested. For example:

./install.sh -p

The MAProvision.rpm file is generated.

1. To collect MFEma.rpm and MFErt.rpm files, do one of the following:

- Collect using install.sh file.
  - Copy the install.sh file to a non-windows system.
  - Open  **Terminal** , then switch to the location where you copied the install.sh file.
  - Run the following command to extract the installation package.

unzip install.sh

  - The following installation files are available. Collect the files as needed.
    - MFEma.i686.rpm
    - MFEma.x86\_64.rpm
    - MFErt.i686.rpm

**NOTE:**  Use the appropriate MFEma package based on the operating system used. For example:

For a 64-bit operating system: Use MFEma.x86\_64.rpm

For a 32-bit operating system: Use MFEma.i686.rpm

- Collect from McAfee ePO Master Repository.

The files are available in the selected repository path. For example, if checked in to the Current branch of the McAfee ePO software repository, the path of the required files is C:\Program Files\McAfee\ePolicy Orchestrator\DB\Software\Current\EPOAGENT3700LYNX\Install\0409. Change the file path based on the branch selected.

1. To collect MFEdx-ma-\&lt;build\_number\&gt;.rpm file, do the following:

  - Copy the DXL.zip file to a non-windows system.

The DXL.zip file is available in the selected repository path. For example, if checked in to the Current branch of the McAfee ePO software repository, the path of the required files is C:\Program Files\McAfee\ePolicy Orchestrator\DB\Software\Current\EPOAGENT3700LYNX\Install\0409. Change the file path based on the branch selected.

  - Open  **Terminal** , then switch to the location where you copied the DXL.zip file.
  - Run the following command to extract the installation package.

unzip DXL.zip

  - The following installation files are available. Collect the files as needed.
    - MFEdx-ma-\&lt;build\_number\&gt;.i686.rpm
    - MFEdx-ma-\&lt;build\_number\&gt;.x86\_64.rpm

**NOTE:**  Use the appropriate MFEdx-ma-\&lt;build\_number\&gt; package based on the operating system used. For example:

For a 64-bit operating system: Use MFEdx-ma-\&lt;build\_number\&gt;.x86\_64.rpm

For a 32-bit operating system: Use MFEdx-ma-\&lt;build\_number\&gt;.i686.rpm

- Check in the files (MAProvision.rpm, MFEma.rpm, MFErt.rpm, and MFEdx-ma-\&lt;build\_number\&gt;.rpm) into the third-party deployment tools (such as YUM) repository.
- Install McAfee Agent in managed mode using third-party tools (for example, yum install MAProvision.rpm).

ENS

https://docs.mcafee.com/bundle/endpoint-security--v10-7-0-installation-guide-linux/page/GUID-2F2E7064-A30B-4A07-8F74-00584EA2E117.html

## Task

1. Add these RPM files to your YUM repository.
  - McAfeeESP-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;\_x86\_64.rpm
  - McAfeeRt-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;\_x86\_64.rpm
  - McAfeeTP-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;\_x86\_64.rpm
  - McAfeeESPFileAccess-\&lt;version\_number\&gt;-\&lt;build\_number\&gt;\_x86\_64.rpm
  - McAfeeESPAac-\&lt;version\_number-\&lt;build-number\&gt;-x86\_64.rpm
2. Install the software.

yum install McAfeeTP