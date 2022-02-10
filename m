Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C834B01A4
	for <lists.iommu@lfdr.de>; Thu, 10 Feb 2022 01:45:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B070C60E5F;
	Thu, 10 Feb 2022 00:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cwm2yYgfz6gO; Thu, 10 Feb 2022 00:45:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E16C560E5E;
	Thu, 10 Feb 2022 00:45:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCCD9C000B;
	Thu, 10 Feb 2022 00:45:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63623C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 00:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5215C82F77
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 00:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjJmF70OOnHP for <iommu@lists.linux-foundation.org>;
 Thu, 10 Feb 2022 00:45:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6F9A82F6C
 for <iommu@lists.linux-foundation.org>; Thu, 10 Feb 2022 00:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644453951; x=1675989951;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A1arXDdvviAbJmFHB0JiZO8bM7BMFQsEYKo+h0boyLo=;
 b=Sn3N6hCmukp/Ouf02hvNjbY1V47UcAOJ9/nbnRfzS0Qg9Qa7uTAip07h
 fvJka6/x2iZc6tEKE8rHd7ZTDMtP5tBNLI1tgy+MNVvmhIKwDICd4l+PW
 +8KMAx0Oy7oEWepkO/y6pvphTRu2rMwXU3Kg8Q9rust7auv9yjV8/a1da
 0a8xjT3M3/oQuF34aXll/4l/LKx1uyGTP7xoSfoY/JN0X+qdEACrMCCcM
 QzTaFnUIXTpIlC3a/XpsVWXMnNtbL21AqOeicPb4ezEWamaDhflGRbdU8
 9uwWorQwn1uXIITbrqvcYLEA67MVk/7oQNdnBIn2iQX71ie/X0yixzbJf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="232940266"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="232940266"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:45:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="678966591"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2022 16:45:46 -0800
Message-ID: <b83e4324-6ef8-1cf0-b5e2-00d0802a6f75@linux.intel.com>
Date: Thu, 10 Feb 2022 08:44:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/10] iommu: Remove guest pasid related interfaces and
 definitions
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220208012559.1121729-1-baolu.lu@linux.intel.com>
 <20220208012559.1121729-3-baolu.lu@linux.intel.com>
 <20220209132954.GT4160@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
In-Reply-To: <20220209132954.GT4160@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
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

On 2/9/22 9:29 PM, Jason Gunthorpe wrote:
>> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
>> index 59178fc229ca..65d8b0234f69 100644
>> --- a/include/uapi/linux/iommu.h
>> +++ b/include/uapi/linux/iommu.h
>> @@ -158,185 +158,4 @@ struct iommu_page_response {
>>   	__u32	code;
>>   };
> What is the plan for the rest of the dead code in this file?

The remaining code are IOMMU fault related. I can look into them in a
separated series where I plan to make the I/O page fault framework
generic.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
