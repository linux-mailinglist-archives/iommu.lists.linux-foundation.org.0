Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 87322253994
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 23:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2117987DC1;
	Wed, 26 Aug 2020 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiAvgxjcTF4D; Wed, 26 Aug 2020 21:15:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF94A87DB8;
	Wed, 26 Aug 2020 21:15:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90917C0051;
	Wed, 26 Aug 2020 21:15:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 869ECC0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 73F9B88367
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gkxHxztyjRI for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 21:15:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D7F2C8835A
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 21:15:02 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72FC0207CD;
 Wed, 26 Aug 2020 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598476502;
 bh=1zCaXT3EyDHwbu4Y2W/LMbHARG53YBmDebObeojxBv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ADsZphIgjZ5T7GV618PiQVXF5hFPLkP4+5i1e3B56KbIqcMVPyjyf8P0j9JmK8PWb
 QohrTdC7et2y9O4nWOumBOqtjLzCy796nFR3xwDWAsmBZ6OxN9+6AUatmg6OCKb66y
 +fKoWXb/5fCzAknCF55f1UtfQANC7LSArE9wFids=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kB2l2-006yir-Pg; Wed, 26 Aug 2020 22:15:00 +0100
Date: Wed, 26 Aug 2020 22:14:58 +0100
Message-ID: <8736492jot.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <20200826112333.992429909@linutronix.de>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.992429909@linutronix.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-kernel@vger.kernel.org,
 x86@kernel.org, joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, haiyangz@microsoft.com,
 jonathan.derrick@intel.com, baolu.lu@linux.intel.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, steve.wahl@hpe.com,
 sivanich@hpe.com, rja@hpe.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 lorenzo.pieralisi@arm.com, konrad.wilk@oracle.com,
 xen-devel@lists.xenproject.org, jgross@suse.com, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 megha.dey@intel.com, jgg@mellanox.com, dave.jiang@intel.com,
 alex.williamson@redhat.com, jacob.jun.pan@intel.com, baolu.lu@intel.com,
 kevin.tian@intel.com, dan.j.williams@intel.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>,
 Megha Dey <megha.dey@intel.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, 26 Aug 2020 12:17:02 +0100,
Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> The arch_.*_msi_irq[s] fallbacks are compiled in whether an architecture
> requires them or not. Architectures which are fully utilizing hierarchical
> irq domains should never call into that code.
> 
> It's not only architectures which depend on that by implementing one or
> more of the weak functions, there is also a bunch of drivers which relies
> on the weak functions which invoke msi_controller::setup_irq[s] and
> msi_controller::teardown_irq.
> 
> Make the architectures and drivers which rely on them select them in Kconfig
> and if not selected replace them by stub functions which emit a warning and
> fail the PCI/MSI interrupt allocation.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Make the architectures (and drivers) which need the fallbacks select them
>     and not the other way round (Bjorn).
> ---
>  arch/ia64/Kconfig              |    1 +
>  arch/mips/Kconfig              |    1 +
>  arch/powerpc/Kconfig           |    1 +
>  arch/s390/Kconfig              |    1 +
>  arch/sparc/Kconfig             |    1 +
>  arch/x86/Kconfig               |    1 +
>  drivers/pci/Kconfig            |    3 +++
>  drivers/pci/controller/Kconfig |    3 +++
>  drivers/pci/msi.c              |    3 ++-
>  include/linux/msi.h            |   31 ++++++++++++++++++++++++++-----
>  10 files changed, 40 insertions(+), 6 deletions(-)
> 

[...]

> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -41,6 +41,7 @@ config PCI_TEGRA
>  	bool "NVIDIA Tegra PCIe controller"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	depends on PCI_MSI_IRQ_DOMAIN
> +	select PCI_MSI_ARCH_FALLBACKS
>  	help
>  	  Say Y here if you want support for the PCIe host controller found
>  	  on NVIDIA Tegra SoCs.
> @@ -67,6 +68,7 @@ config PCIE_RCAR_HOST
>  	bool "Renesas R-Car PCIe host controller"
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	depends on PCI_MSI_IRQ_DOMAIN
> +	select PCI_MSI_ARCH_FALLBACKS
>  	help
>  	  Say Y here if you want PCIe controller support on R-Car SoCs in host
>  	  mode.
> @@ -103,6 +105,7 @@ config PCIE_XILINX_CPM
>  	bool "Xilinx Versal CPM host bridge support"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>  	select PCI_HOST_COMMON
> +	select PCI_MSI_ARCH_FALLBACKS

This guy actually doesn't implement MSIs at all (it seems to delegate
them to an ITS present in the system, if I read the DT binding
correctly). However its older brother from the same silicon dealer
seems to need it. The patchlet below should fix it.

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9ad13919bcaa..f56ff049d469 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -96,6 +96,7 @@ config PCI_HOST_GENERIC
 
 config PCIE_XILINX
 	bool "Xilinx AXI PCIe host bridge support"
+	select PCI_MSI_ARCH_FALLBACKS
 	depends on OF || COMPILE_TEST
 	help
 	  Say 'Y' here if you want kernel to support the Xilinx AXI PCIe
@@ -105,7 +106,6 @@ config PCIE_XILINX_CPM
 	bool "Xilinx Versal CPM host bridge support"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	select PCI_HOST_COMMON
-	select PCI_MSI_ARCH_FALLBACKS
 	help
 	  Say 'Y' here if you want kernel support for the
 	  Xilinx Versal CPM host bridge.


With that fixed,

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
