Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F13743118DA
	for <lists.iommu@lfdr.de>; Sat,  6 Feb 2021 03:50:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 618C6873C3;
	Sat,  6 Feb 2021 02:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75YR+RrtJXuL; Sat,  6 Feb 2021 02:50:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8A14873C2;
	Sat,  6 Feb 2021 02:50:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E486C1DA9;
	Sat,  6 Feb 2021 02:50:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F1F9C013A
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 02:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A18C203CE
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 02:50:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBonE9ZpTzx6 for <iommu@lists.linux-foundation.org>;
 Sat,  6 Feb 2021 02:50:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D8C2F20035
 for <iommu@lists.linux-foundation.org>; Sat,  6 Feb 2021 02:50:23 +0000 (UTC)
IronPort-SDR: gn7t8TkaX/d4J4IvvY0okCI43Di8F2RQM+0ttkuoAWhWPp39CDXgEPn921qdu8+LyzeI2WS38t
 mz2JLuU+GOaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="178956661"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="178956661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 18:50:23 -0800
IronPort-SDR: ZYEbH79NCcVuUb33cx3dcwdgg7j3x4nPjn2QVCXDsdC/XVOKH784RPFUHYTu+KoyR77KdjlkA4
 qqg5sKQajzxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="373801568"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2021 18:50:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 18:50:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 18:50:22 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2106.002;
 Fri, 5 Feb 2021 18:50:22 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/2] PCI: vmd: Disable MSI/X remapping when possible
Thread-Topic: [PATCH v2 2/2] PCI: vmd: Disable MSI/X remapping when possible
Thread-Index: AQHW+ylCpE2jdsG6GkKlPiUMLGcsOqpKo4cAgABQ7wA=
Date: Sat, 6 Feb 2021 02:50:22 +0000
Message-ID: <1a91d03da88eb81dff5782686e08eb34ecce7e45.camel@intel.com>
References: <20210205215718.GA202474@bjorn-Precision-5520>
In-Reply-To: <20210205215718.GA202474@bjorn-Precision-5520>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
Content-ID: <3799C4C95BAF7C40BC897FB30EB52955@intel.com>
MIME-Version: 1.0
Cc: "Patel, Nirmal" <nirmal.patel@intel.com>,
 "will@kernel.org" <will@kernel.org>, "Karkra, Kapil" <kapil.karkra@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
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

On Fri, 2021-02-05 at 15:57 -0600, Bjorn Helgaas wrote:
> On Thu, Feb 04, 2021 at 12:09:06PM -0700, Jon Derrick wrote:
> > VMD will retransmit child device MSI/X using its own MSI/X table and
> > requester-id. This limits the number of MSI/X available to the whole
> > child device domain to the number of VMD MSI/X interrupts.
> > 
> > Some VMD devices have a mode where this remapping can be disabled,
> > allowing child device interrupts to bypass processing with the VMD MSI/X
> > domain interrupt handler and going straight the child device interrupt
> > handler, allowing for better performance and scaling. The requester-id
> > still gets changed to the VMD endpoint's requester-id, and the interrupt
> > remapping handlers have been updated to properly set IRTE for child
> > device interrupts to the VMD endpoint's context.
> > 
> > Some VMD platforms have existing production BIOS which rely on MSI/X
> > remapping and won't explicitly program the MSI/X remapping bit. This
> > re-enables MSI/X remapping on unload.
> 
> Trivial comments below.  Would you mind using "MSI-X" instead of
> "MSI/X" so it matches the usage in the PCIe specs?  Several mentions
> above (including subject) and below.
Thanks Bjorn, will do

> 
> > Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> > ---
> >  drivers/pci/controller/vmd.c | 60 ++++++++++++++++++++++++++++--------
> >  1 file changed, 48 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> > index 5e80f28f0119..a319ce49645b 100644
> > --- a/drivers/pci/controller/vmd.c
> > +++ b/drivers/pci/controller/vmd.c
> > @@ -59,6 +59,13 @@ enum vmd_features {
> >  	 * be used for MSI remapping
> >  	 */
> >  	VMD_FEAT_OFFSET_FIRST_VECTOR		= (1 << 3),
> > +
> > +	/*
> > +	 * Device can bypass remapping MSI/X transactions into its MSI/X table,
> > +	 * avoding the requirement of a VMD MSI domain for child device
> 
> s/avoding/avoiding/
> 
> > +	 * interrupt handling
> 
> Maybe a period at the end of the sentence.
> 
> > +	 */
> > +	VMD_FEAT_BYPASS_MSI_REMAP		= (1 << 4),
> >  };
> >  
> >  /*
> > @@ -306,6 +313,15 @@ static struct msi_domain_info vmd_msi_domain_info = {
> >  	.chip		= &vmd_msi_controller,
> >  };
> >  
> > +static void vmd_enable_msi_remapping(struct vmd_dev *vmd, bool enable)
> > +{
> > +	u16 reg;
> > +
> > +	pci_read_config_word(vmd->dev, PCI_REG_VMCONFIG, &reg);
> > +	reg = enable ? (reg & ~0x2) : (reg | 0x2);
> 
> Would be nice to have a #define for 0x2.
> 
> > +	pci_write_config_word(vmd->dev, PCI_REG_VMCONFIG, reg);
> > +}
> > +
> >  static int vmd_create_irq_domain(struct vmd_dev *vmd)
> >  {
> >  	struct fwnode_handle *fn;
> > @@ -325,6 +341,13 @@ static int vmd_create_irq_domain(struct vmd_dev *vmd)
> >  
> >  static void vmd_remove_irq_domain(struct vmd_dev *vmd)
> >  {
> > +	/*
> > +	 * Some production BIOS won't enable remapping between soft reboots.
> > +	 * Ensure remapping is restored before unloading the driver.
> > +	 */
> > +	if (!vmd->msix_count)
> > +		vmd_enable_msi_remapping(vmd, true);
> > +
> >  	if (vmd->irq_domain) {
> >  		struct fwnode_handle *fn = vmd->irq_domain->fwnode;
> >  
> > @@ -679,15 +702,31 @@ static int vmd_enable_domain(struct vmd_dev *vmd, unsigned long features)
> >  
> >  	sd->node = pcibus_to_node(vmd->dev->bus);
> >  
> > -	ret = vmd_create_irq_domain(vmd);
> > -	if (ret)
> > -		return ret;
> > -
> >  	/*
> > -	 * Override the irq domain bus token so the domain can be distinguished
> > -	 * from a regular PCI/MSI domain.
> > +	 * Currently MSI remapping must be enabled in guest passthrough mode
> > +	 * due to some missing interrupt remapping plumbing. This is probably
> > +	 * acceptable because the guest is usually CPU-limited and MSI
> > +	 * remapping doesn't become a performance bottleneck.
> >  	 */
> > -	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
> > +	if (!(features & VMD_FEAT_BYPASS_MSI_REMAP) || offset[0] || offset[1]) {
> > +		ret = vmd_alloc_irqs(vmd);
> > +		if (ret)
> > +			return ret;
> > +
> > +		vmd_enable_msi_remapping(vmd, true);
> > +
> > +		ret = vmd_create_irq_domain(vmd);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/*
> > +		 * Override the irq domain bus token so the domain can be
> > +		 * distinguished from a regular PCI/MSI domain.
> > +		 */
> > +		irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
> > +	} else {
> > +		vmd_enable_msi_remapping(vmd, false);
> > +	}
> >  
> >  	pci_add_resource(&resources, &vmd->resources[0]);
> >  	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
> > @@ -753,10 +792,6 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >  	if (features & VMD_FEAT_OFFSET_FIRST_VECTOR)
> >  		vmd->first_vec = 1;
> >  
> > -	err = vmd_alloc_irqs(vmd);
> > -	if (err)
> > -		return err;
> > -
> >  	spin_lock_init(&vmd->cfg_lock);
> >  	pci_set_drvdata(dev, vmd);
> >  	err = vmd_enable_domain(vmd, features);
> > @@ -825,7 +860,8 @@ static const struct pci_device_id vmd_ids[] = {
> >  		.driver_data = VMD_FEAT_HAS_MEMBAR_SHADOW_VSCAP,},
> >  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_VMD_28C0),
> >  		.driver_data = VMD_FEAT_HAS_MEMBAR_SHADOW |
> > -				VMD_FEAT_HAS_BUS_RESTRICTIONS,},
> > +				VMD_FEAT_HAS_BUS_RESTRICTIONS |
> > +				VMD_FEAT_BYPASS_MSI_REMAP,},
> >  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x467f),
> >  		.driver_data = VMD_FEAT_HAS_MEMBAR_SHADOW_VSCAP |
> >  				VMD_FEAT_HAS_BUS_RESTRICTIONS |
> > -- 
> > 2.27.0
> > 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
