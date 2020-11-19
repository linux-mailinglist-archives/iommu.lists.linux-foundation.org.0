Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE92B8A29
	for <lists.iommu@lfdr.de>; Thu, 19 Nov 2020 03:43:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A7DA9872FA;
	Thu, 19 Nov 2020 02:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tvVWJ2xqZ5uc; Thu, 19 Nov 2020 02:43:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0E5B5872F7;
	Thu, 19 Nov 2020 02:43:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7556C07FF;
	Thu, 19 Nov 2020 02:43:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD79C07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 02:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1B3822F05
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 02:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbnW5crgi-Ca for <iommu@lists.linux-foundation.org>;
 Thu, 19 Nov 2020 02:43:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id B114E22E89
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 02:43:26 +0000 (UTC)
IronPort-SDR: VYp+9rmtL3tfuSLkSwMEtE1hgRyBSQlIyb9qr5smUHwwo42NLMwVoiJMcVtOnDhYyNFipEcU12
 WXWHDT97i+wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="158255258"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="158255258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 18:43:25 -0800
IronPort-SDR: iJ81quWRVvsyANxvNY2O3Hhj+SZY+YnCbCMs5+n3L4yZSHQCt1dRCUnJOFhwY3QcwSaROosWGe
 5Xpb/P93mpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="431085375"
Received: from allen-box.sh.intel.com (HELO [10.239.159.28]) ([10.239.159.28])
 by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2020 18:43:24 -0800
Subject: Re: [Patch V8 0/3] iommu: Add support to change default domain of an
 iommu group
To: Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 robin.murphy@arm.com
References: <20200925190620.18732-1-ashok.raj@intel.com>
 <20201118135225.GC2177@willie-the-truck>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <fbfcf459-2014-ac40-70e6-0288160fb915@linux.intel.com>
Date: Thu, 19 Nov 2020 10:36:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118135225.GC2177@willie-the-truck>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Will Deacon <will.deacon@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On 11/18/20 9:52 PM, Will Deacon wrote:
> On Fri, Sep 25, 2020 at 12:06:17PM -0700, Ashok Raj wrote:
>> Presently, the default domain of an iommu group is allocated during boot time
>> and it cannot be changed later. So, the device would typically be either in
>> identity (pass_through) mode or the device would be in DMA mode as long as the
>> system is up and running. There is no way to change the default domain type
>> dynamically i.e. after booting, a device cannot switch between identity mode and
>> DMA mode.
>>
>> Assume a use case wherein the privileged user would want to use the device in
>> pass-through mode when the device is used for host so that it would be high
>> performing. Presently, this is not supported. Hence add support to change the
>> default domain of an iommu group dynamically.
>>
>> Support this by writing to a sysfs file, namely
>> "/sys/kernel/iommu_groups/<grp_id>/type".
>>
>> Testing:
>> --------
>> Tested by dynamically changing storage device (nvme) from
>> 1. identity mode to DMA and making sure file transfer works
>> 2. DMA mode to identity mode and making sure file transfer works
>> Tested only for intel_iommu/vt-d. Would appreciate if someone could test on AMD
>> and ARM based machines.
>>
>> Based on iommu maintainer's 'next' branch.
> 
> Modulo my minor comments, I think this looks good for 5.11 if you can
> please send a version 9.
> 
> Robin -- please can you give it the once-over too? I think root can break
> things quite badly with this interface, but root can do that in other ways
> anyway...

Sure. I will send a v9 after Robin's review.

> 
> Will

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
