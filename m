Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A4394569CA8
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 10:08:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D698419BC;
	Thu,  7 Jul 2022 08:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D698419BC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=o8T0RPLH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id donXtHWByfCb; Thu,  7 Jul 2022 08:08:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8FEC14198D;
	Thu,  7 Jul 2022 08:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEC14198D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4320DC007D;
	Thu,  7 Jul 2022 08:08:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA544C002D;
 Thu,  7 Jul 2022 08:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3E7883409;
 Thu,  7 Jul 2022 08:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E7883409
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=o8T0RPLH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OuCwMLZaKAFL; Thu,  7 Jul 2022 08:08:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F4683381
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07F4683381;
 Thu,  7 Jul 2022 08:08:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2D21B81ADA;
 Thu,  7 Jul 2022 08:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8D2C3411E;
 Thu,  7 Jul 2022 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657181316;
 bh=Mzw+guaGxcvS7S4YlQr9bq/AYy4U/puT8v9DMSRjm+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o8T0RPLH1+QXuxRGiOx0iOcZa4PNW1RYnmq0rwqP4JlY+PYLChMX98BzUOmDLYQt5
 WHtgniPDP3fJS/IKoiVXIaVBC8g4rRYZFs4Es7HO3CMez5153+NrgRKDzbP84fxvsI
 PrLKzhYgkU2Ze+gIXne4sqvbIkFu3tT1lxy0BeOk=
Date: Thu, 7 Jul 2022 10:08:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 088b9c375534d905a4d337c78db3b3bfbb52c4a0
Message-ID: <YsaUgfPbOg7WuBuB@kroah.com>
References: <62c683a2.g1VSVt6BrQC6ZzOz%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62c683a2.g1VSVt6BrQC6ZzOz%lkp@intel.com>
Cc: nvdimm@lists.linux.dev, legousb-devel@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 usbb2k-api-dev@nongnu.org, linux-omap@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-perf-users@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-wpan@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-parport@lists.infradead.org, linux-doc@vger.kernel.org,
 samba-technical@lists.samba.org, linux-cxl@vger.kernel.org,
 virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
 target-devel@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, coreteam@netfilter.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, greybus-dev@lists.linaro.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
 linux-phy@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, isdn4linux@listserv.isdn4linux.de,
 linux-input@vger.kernel.org, linux-ext4@vger.kernel.org,
 ath11k@lists.infradead.org, mjpeg-users@lists.sourceforge.net,
 openipmi-developer@lists.sourceforge.net, linux-hwmon@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
 keyrings@vger.kernel.org, netdev@vger.kernel.org, kvm@vger.kernel.org,
 damon@lists.linux.dev, linux-mm@kvack.org,
 accessrunner-general@lists.sourceforge.net,
 linux1394-devel@lists.sourceforge.net, linux-leds@vger.kernel.org,
 rds-devel@oss.oracle.com, linux-x25@vger.kernel.org, dccp@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-nfc@lists.01.org,
 osmocom-net-gprs@lists.osmocom.org, apparmor@lists.ubuntu.com,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-scsi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-unionfs@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ntb@lists.linux.dev, tipc-discussion@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Jul 07, 2022 at 02:56:34PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 088b9c375534d905a4d337c78db3b3bfbb52c4a0  Add linux-next specific files for 20220706
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/linux-doc/202207070644.x48XOOvs-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> Documentation/arm/google/chromebook-boot-flow.rst: WARNING: document isn't included in any toctree
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1108): undefined reference to `__aeabi_ddiv'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1124): undefined reference to `__aeabi_ui2d'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1164): undefined reference to `__aeabi_dmul'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1170): undefined reference to `__aeabi_dadd'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1180): undefined reference to `__aeabi_dsub'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x1190): undefined reference to `__aeabi_d2uiz'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x162c): undefined reference to `__aeabi_d2iz'
> arm-linux-gnueabi-ld: dc_dmub_srv.c:(.text+0x16b0): undefined reference to `__aeabi_i2d'
> dc_dmub_srv.c:(.text+0x10f8): undefined reference to `__aeabi_ui2d'
> dc_dmub_srv.c:(.text+0x464): undefined reference to `__floatunsidf'
> dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x33c): undefined reference to `__floatunsidf'
> drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
> drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
> drivers/vfio/vfio_iommu_type1.c:2141:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x34c): undefined reference to `__floatunsidf'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x378): undefined reference to `__divdf3'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x38c): undefined reference to `__muldf3'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x3a0): undefined reference to `__adddf3'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x3b4): undefined reference to `__subdf3'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x3d4): undefined reference to `__fixunsdfsi'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x750): undefined reference to `__fixdfsi'
> mips-linux-ld: dc_dmub_srv.c:(.text.dc_dmub_setup_subvp_dmub_command+0x7c0): undefined reference to `__floatsidf'
> powerpc-linux-ld: drivers/pci/endpoint/functions/pci-epf-vntb.c:174: undefined reference to `ntb_link_event'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x468): undefined reference to `__divdf3'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x46c): undefined reference to `__muldf3'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x470): undefined reference to `__adddf3'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x474): undefined reference to `__subdf3'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x478): undefined reference to `__fixunsdfsi'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x47c): undefined reference to `__fixdfsi'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x480): undefined reference to `__floatsidf'
> xtensa-linux-ld: dc_dmub_srv.c:(.text+0x60c): undefined reference to `__floatunsidf'
> 
> Unverified Error/Warning (likely false positive, please contact us if interested):
> 
> arch/x86/events/core.c:2114 init_hw_perf_events() warn: missing error code 'err'
> drivers/android/binder.c:1481:19-23: ERROR: from is NULL but dereferenced.
> drivers/android/binder.c:2920:29-33: ERROR: target_thread is NULL but dereferenced.
> drivers/android/binder.c:353:25-35: ERROR: node -> proc is NULL but dereferenced.
> drivers/android/binder.c:4888:16-20: ERROR: t is NULL but dereferenced.
> drivers/base/regmap/regmap.c:1996:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/char/random.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/firmware/arm_scmi/clock.c:394:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/firmware/arm_scmi/powercap.c:376:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega10_powertune.c:1214:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/gpu/drm/amd/display/dc/os_types.h: drm/drm_print.h is included more than once.
> drivers/gpu/drm/bridge/ite-it66121.c:1398:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
> drivers/greybus/operation.c:617:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637

<snip>

When the compiler crashes, why are you blaming all of these different
mailing lists?  Perhaps you need to fix your compiler :)

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
