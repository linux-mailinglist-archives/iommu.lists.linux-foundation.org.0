Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1A3606FA
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 12:21:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CDF60609;
	Thu, 15 Apr 2021 10:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-Ud5Qqqy7Pp; Thu, 15 Apr 2021 10:21:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B3A6071E;
	Thu, 15 Apr 2021 10:21:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAC65C0012;
	Thu, 15 Apr 2021 10:21:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30296C000A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 10:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 233D260695
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 10:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oERBDzhl3aY for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 10:21:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BCA7560609
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 10:21:30 +0000 (UTC)
IronPort-SDR: M/XxSrMYOWYAszRb4KLxawT3MEtOq+jw7LENLBSosPgbGEs3uvTvb8LxeQoCJNt570HUboEj+5
 KD2FAK9i+6nw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="280142062"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="280142062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:21:29 -0700
IronPort-SDR: S4tkgA4j2Grn9PWxRgbOLJ6hnJxtiufe2YSOnSbpbDbhtm6EBzJKb667y0goYd/rcq3OMWvghG
 EvdwM4I1L0Hg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425129910"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.214.126])
 ([10.254.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:21:25 -0700
To: Keqian Zhu <zhukeqian1@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Yi Sun <yi.y.sun@linux.intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Tian Kevin <kevin.tian@intel.com>
References: <20210413085457.25400-1-zhukeqian1@huawei.com>
 <20210413085457.25400-2-zhukeqian1@huawei.com>
 <fe337950-f8d0-3d21-a7b1-98b385d71f3e@linux.intel.com>
 <e42373e3-10d5-5a34-8f33-8bb82d64fb19@huawei.com>
 <56b001fa-b4fe-c595-dc5e-f362d2f07a19@linux.intel.com>
 <88cba608-2f22-eb83-f22e-50cb547b6ee8@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 01/12] iommu: Introduce dirty log tracking framework
Message-ID: <2c01425f-813c-4278-ba06-26d651496a5c@linux.intel.com>
Date: Thu, 15 Apr 2021 18:21:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <88cba608-2f22-eb83-f22e-50cb547b6ee8@huawei.com>
Content-Language: en-US
Cc: jiangkunkun@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, lushenming@huawei.com,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com
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

On 2021/4/15 15:43, Keqian Zhu wrote:
>>> design it as not switchable. I will modify the commit message of patch#12, thanks!
>> I am not sure that I fully get your point. But I can't see any gaps of
>> using iommu_dev_enable/disable_feature() to switch dirty log on and off.
>> Probably I missed anything.
> IOMMU_DEV_FEAT_HWDBM just tells user whether underlying IOMMU driver supports
> dirty tracking, it is not used to management the status of dirty log tracking.
> 
> The feature reporting is per device, but the status management is per iommu_domain.
> Only when all devices in a domain support HWDBM, we can start dirty log for the domain.

So why not

	for_each_device_attached_domain()
		iommu_dev_enable_feature(IOMMU_DEV_FEAT_HWDBM)

?
> 
> And I think we'd better not mix the feature reporting and status management. Thoughts?
> 

I am worrying about having two sets of APIs for single purpose. From
vendor iommu driver's point of view, this feature is per device. Hence,
it still needs to do the same thing.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
