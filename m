Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 602232A5B81
	for <lists.iommu@lfdr.de>; Wed,  4 Nov 2020 02:08:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 138EB86C5A;
	Wed,  4 Nov 2020 01:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEXp3ejxiUgt; Wed,  4 Nov 2020 01:08:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7A6EE86C50;
	Wed,  4 Nov 2020 01:08:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F20AC0051;
	Wed,  4 Nov 2020 01:08:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 451A7C0889
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 01:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 318D321561
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 01:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eXjNRHxGf4HG for <iommu@lists.linux-foundation.org>;
 Wed,  4 Nov 2020 01:08:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 371EE21FA8
 for <iommu@lists.linux-foundation.org>; Wed,  4 Nov 2020 01:08:16 +0000 (UTC)
IronPort-SDR: S0OMm6dYRvPwTgdrvyVziChyS4d6b0jusJpqKT1uxiDU0SnEj8UyS9CC5NgpBu1L4FJqMQTi3f
 C30Z5mA9E4PA==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156924953"
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="156924953"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 17:08:15 -0800
IronPort-SDR: 6BDOhAxZNbTJaLs1zswBH9VvB33E9mCxyRQnmqn8lJanXDeBq9qh2Xzq/St4ALkLm6+iLLBUHE
 /gffL0gGUCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,449,1596524400"; d="scan'208";a="426518233"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2020 17:08:14 -0800
Subject: Re: [PATCH 1/1] iommu: Fix deferred domain attachment in
 iommu_probe_device()
To: Joerg Roedel <joro@8bytes.org>
References: <20201026063008.24849-1-baolu.lu@linux.intel.com>
 <20201103132358.GG22888@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <399fbf3e-e940-d2a3-e0e7-20f4da988184@linux.intel.com>
Date: Wed, 4 Nov 2020 09:01:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103132358.GG22888@8bytes.org>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On 11/3/20 9:23 PM, Joerg Roedel wrote:
> Hi Baolu,
> 
> On Mon, Oct 26, 2020 at 02:30:08PM +0800, Lu Baolu wrote:
>> @@ -264,7 +266,8 @@ int iommu_probe_device(struct device *dev)
>>   	 */
>>   	iommu_alloc_default_domain(group, dev);
>>   
>> -	if (group->default_domain)
>> +	if (group->default_domain &&
>> +	    !iommu_is_attach_deferred(group->default_domain, dev))
>>   		ret = __iommu_attach_device(group->default_domain, dev);
> 
> This is the hotplug path, not used for boot-initialization. Have you
> seen failures from the missing check here?

I haven't seen any failure. Just wondered why deferred attaching was not
checked here. It's fine to me if it's only for hotplug path.

Please ignore this change.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
