Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A63B2088
	for <lists.iommu@lfdr.de>; Wed, 23 Jun 2021 20:44:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAEBF4027E;
	Wed, 23 Jun 2021 18:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvGgcdBlnsEd; Wed, 23 Jun 2021 18:44:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CCFA240265;
	Wed, 23 Jun 2021 18:44:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92FE7C0022;
	Wed, 23 Jun 2021 18:44:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF51C000E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 18:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103D34025E
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 18:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wncPj1Eyi0-1 for <iommu@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 18:44:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5568A400CA
 for <iommu@lists.linux-foundation.org>; Wed, 23 Jun 2021 18:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624473883; x=1656009883;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=N07wTNJU87j8J0GwX4jxR069BiU3mP0B1FK82hyEXsU=;
 b=YaQG1kmOJmrIQ4OYRGvFbMs7YdDbMfAUzTt5+3dU3awrC3ogq9wrVQyF
 by/8dBmI481zG9rDrDT63r5gl0+4Lgssz8Mjz1GicA/qq40Nz3W4Z2g8Y
 cwdpP2PDxeqtQnpQtwpqB5cxljkW9npsn4gepj+IF4rWnVDZ0OlwyEZ53 U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Jun 2021 11:44:42 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Jun 2021 11:44:41 -0700
Received: from [10.38.240.33] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 23 Jun
 2021 11:44:35 -0700
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
From: Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
Date: Wed, 23 Jun 2021 14:44:34 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623183736.GA472@willie-the-truck>
Content-Language: en-US
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Robin Murphy <robin.murphy@arm.com>, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com, bhelgaas@google.com,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 daniel@ffwll.ch, xypron.glpk@gmx.de, thomas.lendacky@amd.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
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



On 6/23/2021 2:37 PM, Will Deacon wrote:
> On Wed, Jun 23, 2021 at 12:39:29PM -0400, Qian Cai wrote:
>>
>>
>> On 6/18/2021 11:40 PM, Claire Chang wrote:
>>> Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
>>> use it to determine whether to bounce the data or not. This will be
>>> useful later to allow for different pools.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Tested-by: Will Deacon <will@kernel.org>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Reverting the rest of the series up to this patch fixed a boot crash with NVMe on today's linux-next.
> 
> Hmm, so that makes patch 7 the suspicious one, right?

Will, no. It is rather patch #6 (this patch). Only the patch from #6 to #12 were reverted to fix the issue. Also, looking at this offset of the crash,

pc : dma_direct_map_sg+0x304/0x8f0
is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119

is_swiotlb_force_bounce() was the new function introduced in this patch here.

+static inline bool is_swiotlb_force_bounce(struct device *dev)
+{
+	return dev->dma_io_tlb_mem->force_bounce;
+}

> 
> Looking at that one more closely, it looks like swiotlb_find_slots() takes
> 'alloc_size + offset' as its 'alloc_size' parameter from
> swiotlb_tbl_map_single() and initialises 'mem->slots[i].alloc_size' based
> on 'alloc_size + offset', which looks like a change in behaviour from the
> old code, which didn't include the offset there.
> 
> swiotlb_release_slots() then adds the offset back on afaict, so we end up
> accounting for it twice and possibly unmap more than we're supposed to?
> 
> Will
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
