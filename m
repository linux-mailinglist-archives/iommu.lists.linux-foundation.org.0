Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A574B26CE39
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 23:49:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4916F2E137;
	Wed, 16 Sep 2020 21:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P4z2oyYRrQC; Wed, 16 Sep 2020 21:49:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B5E02E12F;
	Wed, 16 Sep 2020 21:49:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54F18C0051;
	Wed, 16 Sep 2020 21:49:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88487C0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4990E2E12F
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 21:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8GFm09a4QVW for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 21:49:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9094C2E126
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 21:49:34 +0000 (UTC)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B29B221F1;
 Wed, 16 Sep 2020 21:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600292973;
 bh=jJezu567qIlgUbHBBrnK7CmPZjAKs1t/p+q3frQ/xIY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IXrZDI5MWm4t7cHFn2EF3DGYxDVjzUzuzpsTrtWvbCCWTg4cIWuNCh9Y77BT9llxA
 mBztegtGXSBCLsuQGV+2B8EPuyWRd5bT7o6weGbh2VFW85TeF/PeuI0hUtXvJF09nb
 Z3ChUzVZqqNllOb6H//iY2MQYg38JNgXbVJOjXM8=
Date: Wed, 16 Sep 2020 16:49:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v5] PCI/ACS: Enable PCI_ACS_TB and disable only when
 needed for ATS
Message-ID: <20200916214932.GA1587255@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714201540.3139140-1-rajatja@google.com>
Cc: Todd Broch <tbroch@google.com>, linux-pci@vger.kernel.org,
 lalithambika.krishnakumar@intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 Saravana Kannan <saravanak@google.com>, linux-acpi@vger.kernel.org,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 oohall@gmail.com, Benson Leung <bleung@google.com>,
 David Woodhouse <dwmw2@infradead.org>, Alex Levin <levinale@google.com>
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

On Tue, Jul 14, 2020 at 01:15:40PM -0700, Rajat Jain wrote:
> The ACS "Translation Blocking" bit blocks the translated addresses from
> the devices. We don't expect such traffic from devices unless ATS is
> enabled on them. A device sending such traffic without ATS enabled,
> indicates malicious intent, and thus should be blocked.
> 
> Enable PCI_ACS_TB by default for all devices, and it stays enabled until
> atleast one of the devices downstream wants to enable ATS. It gets
> disabled to enable ATS on a device downstream it, and then gets enabled
> back on once all the downstream devices don't need ATS.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>

I applied v4 of this patch instead because I think the complexity of
this one, where we have to walk up the tree and disable TB in upstream
bridges, is too high.  It's always tricky to modify the state of
device Y when we're doing something for device X.

> ---
> Note that I'm ignoring the devices that require quirks to enable or
> disable ACS, instead of using the standard way for ACS configuration.
> The reason is that it would require adding yet another quirk table or
> quirk function pointer, that I don't know how to implement for those
> devices, and will neither have the devices to test that code.
> 
> v5: Enable TB and disable ATS for all devices on boot. Disable TB later
>     only if needed to enable ATS on downstream devices.
> v4: Add braces to avoid warning from kernel robot
>     print warning for only external-facing devices.
> v3: print warning if ACS_TB not supported on external-facing/untrusted ports.
>     Minor code comments fixes.
> v2: Commit log change
> 
>  drivers/pci/ats.c   |  5 ++++
>  drivers/pci/pci.c   | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h   |  2 ++
>  drivers/pci/probe.c |  2 +-
>  include/linux/pci.h |  2 ++
>  5 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index b761c1f72f67..e2ea9083f30f 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -28,6 +28,9 @@ void pci_ats_init(struct pci_dev *dev)
>  		return;
>  
>  	dev->ats_cap = pos;
> +
> +	dev->ats_enabled = 1; /* To avoid WARN_ON from pci_disable_ats() */
> +	pci_disable_ats(dev);
>  }
>  
>  /**
> @@ -82,6 +85,7 @@ int pci_enable_ats(struct pci_dev *dev, int ps)
>  	}
>  	pci_write_config_word(dev, dev->ats_cap + PCI_ATS_CTRL, ctrl);
>  
> +	pci_disable_acs_trans_blocking(dev);
>  	dev->ats_enabled = 1;
>  	return 0;
>  }
> @@ -102,6 +106,7 @@ void pci_disable_ats(struct pci_dev *dev)
>  	ctrl &= ~PCI_ATS_CTRL_ENABLE;
>  	pci_write_config_word(dev, dev->ats_cap + PCI_ATS_CTRL, ctrl);
>  
> +	pci_enable_acs_trans_blocking(dev);
>  	dev->ats_enabled = 0;
>  }
>  EXPORT_SYMBOL_GPL(pci_disable_ats);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 73a862782214..614e3c1e8c56 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -876,6 +876,9 @@ static void pci_std_enable_acs(struct pci_dev *dev)
>  	/* Upstream Forwarding */
>  	ctrl |= (cap & PCI_ACS_UF);
>  
> +	/* Translation Blocking */
> +	ctrl |= (cap & PCI_ACS_TB);
> +
>  	pci_write_config_word(dev, pos + PCI_ACS_CTRL, ctrl);
>  }
>  
> @@ -904,6 +907,60 @@ static void pci_enable_acs(struct pci_dev *dev)
>  	pci_disable_acs_redir(dev);
>  }
>  
> +void pci_disable_acs_trans_blocking(struct pci_dev *pdev)
> +{
> +	u16 cap, ctrl, pos;
> +	struct pci_dev *dev;
> +
> +	if (!pci_acs_enable)
> +		return;
> +
> +	for (dev = pdev; dev; dev = pci_upstream_bridge(pdev)) {
> +
> +		pos = dev->acs_cap;
> +		if (!pos)
> +			continue;
> +
> +		/*
> +		 * Disable translation blocking when first downstream
> +		 * device that needs it (for ATS) wants to enable ATS
> +		 */
> +		if (++dev->ats_dependencies == 1) {
> +			pci_read_config_word(dev, pos + PCI_ACS_CAP, &cap);
> +			pci_read_config_word(dev, pos + PCI_ACS_CTRL, &ctrl);
> +			ctrl &= ~(cap & PCI_ACS_TB);
> +			pci_write_config_word(dev, pos + PCI_ACS_CTRL, ctrl);
> +		}
> +	}
> +}
> +
> +void pci_enable_acs_trans_blocking(struct pci_dev *pdev)
> +{
> +	u16 cap, ctrl, pos;
> +	struct pci_dev *dev;
> +
> +	if (!pci_acs_enable)
> +		return;
> +
> +	for (dev = pdev; dev; dev = pci_upstream_bridge(pdev)) {
> +
> +		pos = dev->acs_cap;
> +		if (!pos)
> +			continue;
> +
> +		/*
> +		 * Enable translation blocking when last downstream device
> +		 * that depends on it (for ATS), doesn't need ATS anymore
> +		 */
> +		if (--dev->ats_dependencies == 0) {
> +			pci_read_config_word(dev, pos + PCI_ACS_CAP, &cap);
> +			pci_read_config_word(dev, pos + PCI_ACS_CTRL, &ctrl);
> +			ctrl |= (cap & PCI_ACS_TB);
> +			pci_write_config_word(dev, pos + PCI_ACS_CTRL, ctrl);
> +		}
> +	}
> +}
> +
>  /**
>   * pci_restore_bars - restore a device's BAR values (e.g. after wake-up)
>   * @dev: PCI device to have its BARs restored
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 12fb79fbe29d..f5d8ecb6ba96 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -552,6 +552,8 @@ static inline int pci_dev_specific_disable_acs_redir(struct pci_dev *dev)
>  	return -ENOTTY;
>  }
>  #endif
> +void pci_disable_acs_trans_blocking(struct pci_dev *dev);
> +void pci_enable_acs_trans_blocking(struct pci_dev *dev);
>  
>  /* PCI error reporting and recovery */
>  pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 8c40c00413e7..e2ff3a94e621 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2387,10 +2387,10 @@ static void pci_init_capabilities(struct pci_dev *dev)
>  	pci_vpd_init(dev);		/* Vital Product Data */
>  	pci_configure_ari(dev);		/* Alternative Routing-ID Forwarding */
>  	pci_iov_init(dev);		/* Single Root I/O Virtualization */
> +	pci_acs_init(dev);		/* Access Control Services */
>  	pci_ats_init(dev);		/* Address Translation Services */
>  	pci_pri_init(dev);		/* Page Request Interface */
>  	pci_pasid_init(dev);		/* Process Address Space ID */
> -	pci_acs_init(dev);		/* Access Control Services */
>  	pci_ptm_init(dev);		/* Precision Time Measurement */
>  	pci_aer_init(dev);		/* Advanced Error Reporting */
>  	pci_dpc_init(dev);		/* Downstream Port Containment */
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 7a40cd5caed0..31da4355f0fd 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -480,6 +480,8 @@ struct pci_dev {
>  	u16		ats_cap;	/* ATS Capability offset */
>  	u8		ats_stu;	/* ATS Smallest Translation Unit */
>  #endif
> +	/* Total number of downstream devices below a bridge that need ATS */
> +	u8		ats_dependencies;
>  #ifdef CONFIG_PCI_PRI
>  	u16		pri_cap;	/* PRI Capability offset */
>  	u32		pri_reqs_alloc; /* Number of PRI requests allocated */
> -- 
> 2.27.0.389.gc38d7665816-goog
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
