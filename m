Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78C24F20A
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 06:59:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 86B6D8620B;
	Mon, 24 Aug 2020 04:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5m57V5fbvW1r; Mon, 24 Aug 2020 04:59:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 004828618E;
	Mon, 24 Aug 2020 04:59:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1EA0C0051;
	Mon, 24 Aug 2020 04:59:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE3CAC0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 04:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AB26520474
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 04:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYiZMT-LsFCz for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 04:59:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 97F122045C
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 04:59:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B36BAD2E;
 Mon, 24 Aug 2020 04:59:36 +0000 (UTC)
Subject: Re: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.667887608@linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
Date: Mon, 24 Aug 2020 06:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821002947.667887608@linutronix.de>
Content-Language: en-US
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Russ Anderson <rja@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 21.08.20 02:24, Thomas Gleixner wrote:
> X86 cannot store the irq domain pointer in struct device without breaking
> XEN because the irq domain pointer takes precedence over arch_*_msi_irqs()
> fallbacks.
> 
> To achieve this XEN MSI interrupt management needs to be wrapped into an
> irq domain.
> 
> Move the x86_msi ops setup into a single function to prepare for this.
> 
> Signed-off-by: Thomas Gleixner<tglx@linutronix.de>
> ---
>   arch/x86/pci/xen.c |   51 ++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 19 deletions(-)
> 
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -371,7 +371,10 @@ static void xen_initdom_restore_msi_irqs
>   		WARN(ret && ret != -ENOSYS, "restore_msi -> %d\n", ret);
>   	}
>   }
> -#endif
> +#else /* CONFIG_XEN_DOM0 */
> +#define xen_initdom_setup_msi_irqs	NULL
> +#define xen_initdom_restore_msi_irqs	NULL
> +#endif /* !CONFIG_XEN_DOM0 */
>   
>   static void xen_teardown_msi_irqs(struct pci_dev *dev)
>   {
> @@ -403,7 +406,31 @@ static void xen_teardown_msi_irq(unsigne
>   	WARN_ON_ONCE(1);
>   }
>   
> -#endif
> +static __init void xen_setup_pci_msi(void)
> +{
> +	if (xen_initial_domain()) {
> +		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
> +		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
> +		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
> +		pci_msi_ignore_mask = 1;

This is wrong, as a PVH initial domain shouldn't do the pv settings.

The "if (xen_initial_domain())" should be inside the pv case, like:

if (xen_pv_domain()) {
	if (xen_initial_domain()) {
		...
	} else {
		...
	}
} else if (xen_hvm_domain()) {
	...

Juergen
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
