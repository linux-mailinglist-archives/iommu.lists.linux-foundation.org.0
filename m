Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 363B1413F7F
	for <lists.iommu@lfdr.de>; Wed, 22 Sep 2021 04:35:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B72C540017;
	Wed, 22 Sep 2021 02:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ss34MCVgHayP; Wed, 22 Sep 2021 02:35:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCC5F4043E;
	Wed, 22 Sep 2021 02:35:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74309C000D;
	Wed, 22 Sep 2021 02:35:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B635AC000D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 02:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970AF40196
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 02:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gR_KDXL6nVBH for <iommu@lists.linux-foundation.org>;
 Wed, 22 Sep 2021 02:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DB7640017
 for <iommu@lists.linux-foundation.org>; Wed, 22 Sep 2021 02:35:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223148423"
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; d="scan'208";a="223148423"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 19:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; d="scan'208";a="533533519"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2021 19:35:09 -0700
Subject: Re: [RFC 04/20] iommu: Add iommu_device_get_info interface
To: Jason Gunthorpe <jgg@nvidia.com>, Liu Yi L <yi.l.liu@intel.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-5-yi.l.liu@intel.com>
 <20210921161930.GP327412@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <a8a72eba-bae3-9f42-f79c-c5646e425255@linux.intel.com>
Date: Wed, 22 Sep 2021 10:31:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921161930.GP327412@nvidia.com>
Content-Language: en-US
Cc: kvm@vger.kernel.org, jasowang@redhat.com, kwankhede@nvidia.com, hch@lst.de,
 jean-philippe@linaro.org, dave.jiang@intel.com, ashok.raj@intel.com,
 corbet@lwn.net, kevin.tian@intel.com, parav@mellanox.com,
 alex.williamson@redhat.com, lkml@metux.net, david@gibson.dropbear.id.au,
 dwmw2@infradead.org, jun.j.tian@intel.com, linux-kernel@vger.kernel.org,
 lushenming@huawei.com, iommu@lists.linux-foundation.org, pbonzini@redhat.com,
 robin.murphy@arm.com
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

Hi Jason,

On 9/22/21 12:19 AM, Jason Gunthorpe wrote:
> On Sun, Sep 19, 2021 at 02:38:32PM +0800, Liu Yi L wrote:
>> From: Lu Baolu <baolu.lu@linux.intel.com>
>>
>> This provides an interface for upper layers to get the per-device iommu
>> attributes.
>>
>>      int iommu_device_get_info(struct device *dev,
>>                                enum iommu_devattr attr, void *data);
> 
> Can't we use properly typed ops and functions here instead of a void
> *data?
> 
> get_snoop()
> get_page_size()
> get_addr_width()

Yeah! Above are more friendly to the upper layer callers.

> 
> ?
> 
> Jason
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
