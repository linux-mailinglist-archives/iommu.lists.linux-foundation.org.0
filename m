Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5322C1BA
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 11:08:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9EC522037E;
	Fri, 24 Jul 2020 09:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1Jrwnft6Wv5; Fri, 24 Jul 2020 09:08:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9CA8320108;
	Fri, 24 Jul 2020 09:08:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 828F0C004C;
	Fri, 24 Jul 2020 09:08:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD200C004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 09:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9B9FE882A0
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 09:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1Yh2RJ7vWSq for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 09:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 368A487F85
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 09:08:49 +0000 (UTC)
IronPort-SDR: 0KgUTiSh4kFaJzIhcqJ84nh/FL+YR8kgNvpPAiXvvrtMzlpXqPqw5h1WQdT0uUrsuHwSWF5jRr
 EHVWsMlofqcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="215267527"
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; d="scan'208";a="215267527"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 02:08:49 -0700
IronPort-SDR: aM3Fwiu0mLASnt0BIj9C5TGT+QMlVobTkJxIhLzNBR4wLP4511rboiRUm1Da5WSUQqvOdXOtN4
 JxZ/gN7o6o6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; d="scan'208";a="319256252"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.215.172])
 ([10.254.215.172])
 by orsmga008.jf.intel.com with ESMTP; 24 Jul 2020 02:08:47 -0700
Subject: Re: [PATCH 00/12] [PULL REQUEST] iommu/vt-d: patches for v5.9
To: Joerg Roedel <joro@8bytes.org>
References: <20200724014925.15523-1-baolu.lu@linux.intel.com>
 <20200724085518.GR27672@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f89c06fd-c068-394c-28f6-99f9dcb17e21@linux.intel.com>
Date: Fri, 24 Jul 2020 17:08:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724085518.GR27672@8bytes.org>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org
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

Hi Joerg,

On 2020/7/24 16:55, Joerg Roedel wrote:
> On Fri, Jul 24, 2020 at 09:49:13AM +0800, Lu Baolu wrote:
>> Below patches have been piled up for v5.9. It includes:
>>
>>   - Misc tweaks and fixes for vSVA
>>   - Report/response page request events
>>   - Cleanups
>>
>> Can you please consider them for iommu/next?
> 
> Applied, thanks Baolu.
> 
> For the next round, would you consider using the b4[1] tool to queue
> your patches? This way you can easily add a Link: tag to the commits,
> pointing to the original upstream discussion.
> 
> I also use b4 and the link it adds to the commits is from your
> patch-posting, but that does not include the original posting or
> discussion around a patch.
> 
> Thanks,
> 
> 	Joerg
> 
> [1] https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
> 

Sure. It's a cool tool! Thanks a lot.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
