Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED912219C
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 02:38:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1CE508803E;
	Tue, 17 Dec 2019 01:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7p4IMVKxpHKP; Tue, 17 Dec 2019 01:38:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99CD487FCC;
	Tue, 17 Dec 2019 01:38:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 814BAC077D;
	Tue, 17 Dec 2019 01:38:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACED1C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9457487F5C
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ahEdK317Fpr for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:38:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DE6A887E9D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 01:38:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 17:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="227319645"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 16 Dec 2019 17:38:14 -0800
Subject: Re: [PATCH v3 5/6] iommu/vt-d: Flush PASID-based iotlb for iova over
 first level
To: "Liu, Yi L" <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20191211021219.8997-1-baolu.lu@linux.intel.com>
 <20191211021219.8997-6-baolu.lu@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A130C08@SHSMSX104.ccr.corp.intel.com>
 <f1e5cfea-8b11-6d72-8e57-65daea51c050@linux.intel.com>
 <A2975661238FB949B60364EF0F2C25743A132C50@SHSMSX104.ccr.corp.intel.com>
 <6a5f6695-d1fd-e7d1-3ea3-f222a1ef0e54@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b4a879b2-a5c7-b0bf-8cd4-7397aeebc381@linux.intel.com>
Date: Tue, 17 Dec 2019 09:37:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6a5f6695-d1fd-e7d1-3ea3-f222a1ef0e54@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Kumar,
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>
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

Hi again,

On 12/17/19 9:19 AM, Lu Baolu wrote:
> Hi Yi,
> 
> On 12/15/19 5:22 PM, Liu, Yi L wrote:
>> Ok, let me explain more... default pasid is meaningful only when
>> the domain has been attached to a device as an aux-domain. right?
> 
> No exactly. Each domain has a specific default pasid, no matter normal
> domain (RID based) or aux-domain (PASID based). The difference is for a
> normal domain RID2PASID value is used, for an aux-domain the pasid is
> allocated from a global pool.
> 
> The same concept used in VT-d 3.x scalable mode. For RID based DMA
> translation RID2PASID value is used when walking the tables; For PASID
> based DMA translation a real pasid in the transaction is used.
> 
>> If a domain only has one device, and it is attached to this device as
>> normal domain (normal domain means non aux-domain here). Then
>> you should flush cache with domain-id and RID2PASID value.
>> If a domain has one device, and it is attached to this device as
>> aux-domain. Then you may want to flush cache with domain-id
>> and default pasid. right?
> 
> A domain's counterpart is IOMMU group. So we say attach/detach domain
> to/from devices in a group. We don't allow devices with different
> default pasid sitting in a same group, right?
> 
>> Then let's come to the case I mentioned in previous email. a mdev
>> and another device assigned to a single VM. In host, you will have
>> a domain which has two devices, one device(deva) is attached as
> 
> No. We will have two IOMMU groups and two domains. Correct me if my
> understanding is not right.

Reconsidered this. Unfortunately, my understanding is not right. :-(

A single domain could be attached to multiple IOMMU groups. So it
comes to the issue you concerned. Do I understand it right?

> 
>> normal domain, another one (devB) is attached as aux-domain. Then
>> which pasid should be used when the mapping in IOVA page table is
>> modified? RID2PASID or default pasid? I think both should be used
>> since the domain means differently to the two devices. If you just
>> use default pasid, then deva may still be able to use stale caches.

You are right. I will change it accordingly. The logic should look
like:

if (domain attached to physical device)
	flush_piotlb_with_RID2PASID()
else if (domain_attached_to_mdev_device)
	flush_piotlb_with_default_pasid()

Does this work for you? Thanks for catching this!

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
