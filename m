Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A34215C26
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 18:45:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA0588940F;
	Mon,  6 Jul 2020 16:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RWKvsJ-1G+7t; Mon,  6 Jul 2020 16:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57EC28940A;
	Mon,  6 Jul 2020 16:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E2C5C016F;
	Mon,  6 Jul 2020 16:45:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF00C016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B3BE879B4
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 16:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzgRJLRdYkKu for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 16:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 04412879AD
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 16:45:16 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AC32206CD;
 Mon,  6 Jul 2020 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594053915;
 bh=6e7i6fPg3xNw9i2TFYGWKkuRV4+OY0qFf0hJHUNZFAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EhB2ATgroVPgNiiTvitOSzxGM8K1faRPJTHq+pWF9OWRXMbByn3s7Po687Z06TgqX
 VRr6vipnlOr72zbR5kU6z77tc6gv0H6MISA7cfsxuie6Xcsxdp0PmqZB60L2npF6bE
 EwgK1dlIzDci0mNcLWOVvgFQIU8qG/+6YxMdV6LM=
Date: Mon, 6 Jul 2020 11:45:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 3/7] PCI/ACS: Enable PCI_ACS_TB for
 untrusted/external-facing devices
Message-ID: <20200706164514.GA124720@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630044943.3425049-4-rajatja@google.com>
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

On Mon, Jun 29, 2020 at 09:49:39PM -0700, Rajat Jain wrote:
> When enabling ACS, enable translation blocking for external facing ports
> and untrusted devices.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v2: Commit log change 
> 
>  drivers/pci/pci.c    |  4 ++++
>  drivers/pci/quirks.c | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index d2ff987585855..79853b52658a2 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -3330,6 +3330,10 @@ static void pci_std_enable_acs(struct pci_dev *dev)
>  	/* Upstream Forwarding */
>  	ctrl |= (cap & PCI_ACS_UF);
>  
> +	if (dev->external_facing || dev->untrusted)
> +		/* Translation Blocking */
> +		ctrl |= (cap & PCI_ACS_TB);
> +
>  	pci_write_config_word(dev, pos + PCI_ACS_CTRL, ctrl);
>  }
>  
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index b341628e47527..6294adeac4049 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -4934,6 +4934,13 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
>  	}
>  }
>  
> +/*
> + * Currently this quirk does the equivalent of
> + * PCI_ACS_RR | PCI_ACS_CR | PCI_ACS_UF | PCI_ACS_SV
> + *
> + * Currently missing, it also needs to do equivalent of PCI_ACS_TB,
> + * if dev->external_facing || dev->untrusted

I don't understand this comment.  Is this a "TODO"?  Is there
something more that needs to be done here?

After a patch is applied, a comment should describe the code as it is.

> + */
>  static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
>  {
>  	if (!pci_quirk_intel_pch_acs_match(dev))
> @@ -4973,6 +4980,10 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
>  	ctrl |= (cap & PCI_ACS_CR);
>  	ctrl |= (cap & PCI_ACS_UF);
>  
> +	if (dev->external_facing || dev->untrusted)
> +		/* Translation Blocking */
> +		ctrl |= (cap & PCI_ACS_TB);
> +
>  	pci_write_config_dword(dev, pos + INTEL_SPT_ACS_CTRL, ctrl);
>  
>  	pci_info(dev, "Intel SPT PCH root port ACS workaround enabled\n");
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
