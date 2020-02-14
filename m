Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF315E59A
	for <lists.iommu@lfdr.de>; Fri, 14 Feb 2020 17:43:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 78F40867BD;
	Fri, 14 Feb 2020 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpH1IljKJLhL; Fri, 14 Feb 2020 16:43:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB2B086879;
	Fri, 14 Feb 2020 16:43:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B978C1D8E;
	Fri, 14 Feb 2020 16:43:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 518E8C0177
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3BA7286868
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 16:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSLVg2Q6nu4a for <iommu@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 16:43:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E54B7867C6
 for <iommu@lists.linux-foundation.org>; Fri, 14 Feb 2020 16:43:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 08:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="223066204"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga007.jf.intel.com with ESMTP; 14 Feb 2020 08:43:22 -0800
Received: from orsmsx121.amr.corp.intel.com (10.22.225.226) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 14 Feb 2020 08:43:21 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.110]) by
 ORSMSX121.amr.corp.intel.com ([169.254.10.140]) with mapi id 14.03.0439.000;
 Fri, 14 Feb 2020 08:43:21 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "joro@8bytes.org"
 <joro@8bytes.org>, "drake@endlessm.com" <drake@endlessm.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v2] iommu/vt-d: consider real PCI device when checking
 if mapping is needed
Thread-Topic: [PATCH v2] iommu/vt-d: consider real PCI device when checking
 if mapping is needed
Thread-Index: AQHV4xWJ2QGyDH0jl0CnLrsmeyoBcqgba6qA
Date: Fri, 14 Feb 2020 16:43:20 +0000
Message-ID: <0750dfaa5772e102df83b099926623f8378e6cc4.camel@intel.com>
References: <20200214090234.5746-1-drake@endlessm.com>
In-Reply-To: <20200214090234.5746-1-drake@endlessm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.232.115.34]
Content-ID: <D1D7BB55A38EEA44A0B5C5F5068678E1@intel.com>
MIME-Version: 1.0
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux@endlessm.com" <linux@endlessm.com>
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

Hi Daniel, sorry for the delay


On Fri, 2020-02-14 at 17:02 +0800, Daniel Drake wrote:
> From: Jon Derrick <jonathan.derrick@intel.com>
> 
> The PCI devices handled by intel-iommu may have a DMA requester on
> another bus, such as VMD subdevices needing to use the VMD endpoint.
> 
> The real DMA device is now used for the DMA mapping, but one case was
> missed earlier: if the VMD device (and hence subdevices too) are under
> IOMMU_DOMAIN_IDENTITY, mappings do not work.
> 
> Codepaths like intel_map_page() handle the IOMMU_DOMAIN_DMA case by
> creating an iommu DMA mapping, and fall back on dma_direct_map_page()
> for the IOMMU_DOMAIN_IDENTITY case. However, handling of the IDENTITY
> case is broken when intel_page_page() handles a subdevice.
intel_map_page?


> 
> We observe that at iommu attach time, dmar_insert_one_dev_info() for
> the subdevices will never set dev->archdata.iommu. This is because
> that function uses find_domain() to check if there is already an IOMMU
> for the device, and find_domain() then defers to the real DMA device
> which does have one. Thus dmar_insert_one_dev_info() returns without
> assigning dev->archdata.iommu.
> 
> Then, later:
> 
> 1. intel_map_page() checks if an IOMMU mapping is needed by calling
>    iommu_need_mapping() on the subdevice. identity_mapping() returns
>    false because dev->archdata.iommu is NULL, so this function
>    returns false indicating that mapping is needed.
> 2. __intel_map_single() is called to create the mapping.
> 3. __intel_map_single() calls find_domain(). This function now returns
>    the IDENTITY domain corresponding to the real DMA device.
> 4. __intel_map_single() calls domain_get_iommu() on this "real" domain.
>    A failure is hit and the entire operation is aborted, because this
>    codepath is not intended to handle IDENTITY mappings:
>        if (WARN_ON(domain->domain.type != IOMMU_DOMAIN_DMA))
>                    return NULL;
> 
> Fix this by using the real DMA device when checking if a mapping is
> needed, while also considering the subdevice DMA mask.
> The IDENTITY case will then directly fall back on dma_direct_map_page().
> 
> Reported-by: Daniel Drake <drake@endlessm.com>
> Fixes: b0140c69637e ("iommu/vt-d: Use pci_real_dma_dev() for mapping")
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
> 
> Notes:
>     v2: switch to Jon's approach instead.
>     
>     This problem was detected with a non-upstream patch
>     "PCI: Add Intel remapped NVMe device support"
>     (https://marc.info/?l=linux-ide&m=156015271021615&w=2)
>     
>     This patch creates PCI devices a bit like VMD, and hence
>     I believe VMD would hit this class of problem for any cases where
>     the VMD device is in the IDENTITY domain. (I presume the reason this
>     bug was not seen already there is that it is in a DMA iommu domain).
>     
>     However this hasn't actually been tested on VMD (don't have the hardware)
>     so if I've missed anything and/or it's not a real issue then feel free to
>     drop this patch.
> 
>  drivers/iommu/intel-iommu.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 9dc37672bf89..edbe2866b515 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -3582,19 +3582,23 @@ static struct dmar_domain *get_private_domain_for_dev(struct device *dev)
>  /* Check if the dev needs to go through non-identity map and unmap process.*/
>  static bool iommu_need_mapping(struct device *dev)
>  {
> +	u64 dma_mask, required_dma_mask;
>  	int ret;
>  
>  	if (iommu_dummy(dev))
>  		return false;
>  
> -	ret = identity_mapping(dev);
> -	if (ret) {
> -		u64 dma_mask = *dev->dma_mask;
> +	dma_mask = *dev->dma_mask;
> +	if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
> +		dma_mask = dev->coherent_dma_mask;
> +	required_dma_mask = dma_direct_get_required_mask(dev);
>  
> -		if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
> -			dma_mask = dev->coherent_dma_mask;
> +	if (dev_is_pci(dev))
> +		dev = &pci_real_dma_dev(to_pci_dev(dev))->dev;
>  
> -		if (dma_mask >= dma_direct_get_required_mask(dev))
> +	ret = identity_mapping(dev);
> +	if (ret) {
> +		if (dma_mask >= required_dma_mask)
>  			return false;
>  
>  		/*



I think this might work better since it shortcuts the mask check in the
non-identity case. Tests fine when VMD is forced into Identity domain.
Feel free to add my sign-off for either patch you go with.

Thanks,
Jon



diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 9dc3767..7ffd252 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3582,12 +3582,16 @@ static struct dmar_domain
*get_private_domain_for_dev(struct device *dev)
 /* Check if the dev needs to go through non-identity map and unmap
process.*/
 static bool iommu_need_mapping(struct device *dev)
 {
+       struct device *dma_dev = dev;
        int ret;
 
        if (iommu_dummy(dev))
                return false;
 
-       ret = identity_mapping(dev);
+       if (dev_is_pci(dev))
+               dma_dev = &pci_real_dma_dev(to_pci_dev(dev))->dev;
+
+       ret = identity_mapping(dma_dev);
        if (ret) {
                u64 dma_mask = *dev->dma_mask;
 
@@ -3601,19 +3605,19 @@ static bool iommu_need_mapping(struct device
*dev)
                 * 32 bit DMA is removed from si_domain and fall back
to
                 * non-identity mapping.
                 */
-               dmar_remove_one_dev_info(dev);
-               ret = iommu_request_dma_domain_for_dev(dev);
+               dmar_remove_one_dev_info(dma_dev);
+               ret = iommu_request_dma_domain_for_dev(dma_dev);
                if (ret) {
                        struct iommu_domain *domain;
                        struct dmar_domain *dmar_domain;
 
-                       domain = iommu_get_domain_for_dev(dev);
+                       domain = iommu_get_domain_for_dev(dma_dev);
                        if (domain) {
                                dmar_domain = to_dmar_domain(domain);
                                dmar_domain->flags |=
DOMAIN_FLAG_LOSE_CHILDREN;
                        }
-                       dmar_remove_one_dev_info(dev);
-                       get_private_domain_for_dev(dev);
+                       dmar_remove_one_dev_info(dma_dev);
+                       get_private_domain_for_dev(dma_dev);
                }
 
                dev_info(dev, "32bit DMA uses non-identity mapping\n");

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
