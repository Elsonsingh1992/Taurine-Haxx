# haxx

Untethered + Unsandboxed code execution haxx as root on iOS 14 - iOS 14.8.1.

Based on [haxx](https://github.com/asdfugil/haxx)

## Usage

Note: requires macOS + existing jailbreak

### Get up and running
This method works on 14.0-14.6. 14.7 (14.7b1)-14.8.1 requires launchd replacement (see `launchd.c`), which is less safe.

1. Ensure you have [ldid](https://github.com/ProcursusTeam/ldid) from Procursus Team.
3. Run `make` to build. If you're not on macOS, specify `TARGET_SYSROOT`
4. On the device, Copy `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd` to `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd.back`
5. Then replace `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd` with `/usr/bin/fileproviderctl`
6. Create and empty file `/var/mobile/.untether`
7. Copy `fileproviderctl_internal` generated from the build to `/usr/local/bin` on the device, mode should be 0755.
8. Profit.

### Disable

To disable the untether, do the following steps
1. Delete `/var/mobile/.untether`

### Removal

To remove the installation, do the following steps
1. Copy `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd` to `/usr/bin/fileproviderctl`
2. Move `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd.back` to `/System/Library/PrivateFrameworks/CoreAnalytics.framework/Support/analyticsd`
3. Delete `/var/haxx`, `/usr/local/bin/fileproviderctl_internal` as well as `/usr/local/bin/haxx`
