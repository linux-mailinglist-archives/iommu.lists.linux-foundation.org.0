Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4E163B70
	for <lists.iommu@lfdr.de>; Wed, 19 Feb 2020 04:40:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59E528641F;
	Wed, 19 Feb 2020 03:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJ5uhZ0ieMa0; Wed, 19 Feb 2020 03:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F33686457;
	Wed, 19 Feb 2020 03:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BCD4C013E;
	Wed, 19 Feb 2020 03:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD703C013E
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA145203E4
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCfoPuqBby9U for <iommu@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:40:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 8EF52203CE
 for <iommu@lists.linux-foundation.org>; Wed, 19 Feb 2020 03:40:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 19:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,459,1574150400"; d="scan'208";a="253962052"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.252])
 ([10.254.213.252])
 by orsmga002.jf.intel.com with ESMTP; 18 Feb 2020 19:40:02 -0800
Subject: Re: [PATCH v4] iommu/vt-d: consider real PCI device when checking if
 mapping is needed
To: Daniel Drake <drake@endlessm.com>, dwmw2@infradead.org, joro@8bytes.org
References: <20200219032128.27907-1-drake@endlessm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f1df8a90-c5b8-b6e0-9d7c-e8eb697b0f13@linux.intel.com>
Date: Wed, 19 Feb 2020 11:40:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219032128.27907-1-drake@endlessm.com>
Content-Language: en-US
Cc: bhelgaas@google.com, iommu@lists.linux-foundation.org, linux@endlessm.com,
 jonathan.derrick@intel.com
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

Hi,

On 2020/2/19 11:21, Daniel Drake wrote:
> From: Jon Derrick<jonathan.derrick@intel.com>
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
>     iommu_need_mapping() on the subdevice. identity_mapping() returns
>     false because dev->archdata.iommu is NULL, so this function
>     returns false indicating that mapping is needed.
> 2. __intel_map_single() is called to create the mapping.
> 3. __intel_map_single() calls find_domain(). This function now returns
>     the IDENTITY domain corresponding to the real DMA device.
> 4. __intel_map_single() calls domain_get_iommu() on this "real" domain.
>     A failure is hit and the entire operation is aborted, because this
>     codepath is not intended to handle IDENTITY mappings:
>         if (WARN_ON(domain->domain.type != IOMMU_DOMAIN_DMA))
>                     return NULL;
> 
> Fix this by using the real DMA device when checking if a mapping is
> needed. The IDENTITY case will then directly fall back on
> dma_direct_map_page(). The subdevice DMA mask is still considered in
> order to handle any situations where (e.g.) the subdevice only supports
> 32-bit DMA with the real DMA requester having a 64-bit DMA mask.

With respect, this is problematical. The parent and all subdevices share
a single translation entry. The DMA mask should be consistent.

Otherwise, for example, subdevice A has 64-bit DMA capability and uses
an identity domain for DMA translation. While subdevice B has 32-bit DMA
capability and is forced to switch to DMA domain. Subdevice A will be
impacted without any notification.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
