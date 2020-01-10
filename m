Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B01364A6
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 02:18:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5D950203A6;
	Fri, 10 Jan 2020 01:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE5JCj3NYvLw; Fri, 10 Jan 2020 01:18:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5F0F520449;
	Fri, 10 Jan 2020 01:18:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54771C0881;
	Fri, 10 Jan 2020 01:18:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A98BC0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 01:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 475D486ACE
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 01:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4kyFef3X0Qjl for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 01:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB52D86ACB
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 01:18:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 17:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="246847040"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2020 17:18:45 -0800
Subject: Re: [PATCH v8 04/10] iommu/vt-d: Support flushing more translation
 cache types
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1576524252-79116-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1576524252-79116-5-git-send-email-jacob.jun.pan@linux.intel.com>
 <24cc06da-14ec-908d-361d-a8b321b10852@linux.intel.com>
 <20200109135038.7608d059@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <34ef67b6-53ef-d15f-0fad-ef4c39719155@linux.intel.com>
Date: Fri, 10 Jan 2020 09:17:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109135038.7608d059@jacob-builder>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

On 1/10/20 5:50 AM, Jacob Pan wrote:
> On Thu, 19 Dec 2019 10:46:51 +0800
> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
> 
>> Hi,
>>
>> On 12/17/19 3:24 AM, Jacob Pan wrote:
>>> When Shared Virtual Memory is exposed to a guest via vIOMMU,
>>> scalable IOTLB invalidation may be passed down from outside IOMMU
>>> subsystems. This patch adds invalidation functions that can be used
>>> for additional translation cache types.
>>>
>>> Signed-off-by: Jacob Pan<jacob.jun.pan@linux.intel.com>
>>> ---
>>>    drivers/iommu/dmar.c        | 46
>>> +++++++++++++++++++++++++++++++++++++++++++++
>>> drivers/iommu/intel-pasid.c |  3 ++- include/linux/intel-iommu.h |
>>> 21 +++++++++++++++++---- 3 files changed, 65 insertions(+), 5
>>> deletions(-)
>>>
>>> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
>>> index 3acfa6a25fa2..f2f5d75da94a 100644
>>> --- a/drivers/iommu/dmar.c
>>> +++ b/drivers/iommu/dmar.c
>>> @@ -1348,6 +1348,20 @@ void qi_flush_iotlb(struct intel_iommu
>>> *iommu, u16 did, u64 addr, qi_submit_sync(&desc, iommu);
>>>    }
>>>    
>>> +/* PASID-based IOTLB Invalidate */
>>> +void qi_flush_iotlb_pasid(struct intel_iommu *iommu, u16 did, u64
>>> addr, u32 pasid,
>>> +		unsigned int size_order, u64 granu, int ih)
>>> +{
>>> +	struct qi_desc desc = {.qw2 = 0, .qw3 = 0};
>>> +
>>> +	desc.qw0 = QI_EIOTLB_PASID(pasid) | QI_EIOTLB_DID(did) |
>>> +		QI_EIOTLB_GRAN(granu) | QI_EIOTLB_TYPE;
>>> +	desc.qw1 = QI_EIOTLB_ADDR(addr) | QI_EIOTLB_IH(ih) |
>>> +		QI_EIOTLB_AM(size_order);
>>> +
>>> +	qi_submit_sync(&desc, iommu);
>>> +}
>> There's another version of pasid-based iotlb invalidation.
>>
>> https://lkml.org/lkml/2019/12/10/2128
>>
>> Let's consider merging them.
>>
> Absolutely, the difference i see is that the granularity is explicit
> here. Here we do invalidation request from the guest. Perhaps, we can
> look at consolidation once this use case is supported?
> 

Looks good to me. :-)

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
