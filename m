Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1C1CA031
	for <lists.iommu@lfdr.de>; Fri,  8 May 2020 03:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B3CD886E6F;
	Fri,  8 May 2020 01:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utkr30eC8Mil; Fri,  8 May 2020 01:40:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ABAE9881B3;
	Fri,  8 May 2020 01:40:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8781FC0890;
	Fri,  8 May 2020 01:40:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 315C6C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1EB5D8815F
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q+3zprgKqHNz for <iommu@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:40:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6D6D886E6F
 for <iommu@lists.linux-foundation.org>; Fri,  8 May 2020 01:40:23 +0000 (UTC)
IronPort-SDR: HrkcMRG/ishGC52t2asVV0iKffh3pnVUN4LZhzVR/POORNtAVx/nQGRQUNQ1arq1LYT9zBd88K
 3Md5raOGrijA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 18:40:23 -0700
IronPort-SDR: 7j287Im+zYIY+vKmt4AEeMUCGpQudOdlqLO9h3v8FS2ILG5N5Zg3xeG2O5fNPd7T19gp2qKSTj
 Ia6QO6odw44A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="278794196"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2020 18:40:19 -0700
Subject: Re: [PATCH v4 2/5] iommu/vt-d: debugfs: Add support to show inv queue
 internals
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <20200507005534.3080-1-baolu.lu@linux.intel.com>
 <20200507005534.3080-3-baolu.lu@linux.intel.com>
 <20200507094706.6f6a605f@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f6ee653e-01d8-5728-207b-f423f979b624@linux.intel.com>
Date: Fri, 8 May 2020 09:37:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507094706.6f6a605f@jacob-builder>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

Hi Jacob,

On 5/8/20 12:47 AM, Jacob Pan wrote:
> Hi Baolu,
> 
> Very helpful feature, thanks for doing this. Just a small suggestion.

Thanks a lot for reviewing my patch.

> 
> On Thu,  7 May 2020 08:55:31 +0800
> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
> 
>> Export invalidation queue internals of each iommu device through the
>> debugfs.
>>
>> Example of such dump on a Skylake machine:
>>
>> $ sudo cat /sys/kernel/debug/iommu/intel/invalidation_queue
>> Invalidation queue on IOMMU: dmar1
>>   Base: 0x1672c9000      Head: 80        Tail: 80
>> Index           qw0                     qw1                     status
>>      0   0000000000000004        0000000000000000
>> 0000000000000000 1   0000000200000025        00000001672be804
>> 0000000000000000 2   0000000000000011        0000000000000000
>> 0000000000000000 3   0000000200000025        00000001672be80c
>> 0000000000000000 4   00000000000000d2        0000000000000000
>> 0000000000000000 5   0000000200000025        00000001672be814
>> 0000000000000000 6   0000000000000014        0000000000000000
>> 0000000000000000 7   0000000200000025        00000001672be81c
>> 0000000000000000 8   0000000000000014        0000000000000000
>> 0000000000000000 9   0000000200000025        00000001672be824
>> 0000000000000000
>>
> Head and Tail shows the offset, and queue is dump with index. Would it
> be nice to mark where the Head and Tail is in the list?

The Head and Tail actually show the index. I will mark it clearly in the
dump to avoid any confusion. Thanks for the reminding.

> In your example, the queue is empty (H=T), would be nice to see where
> the previous entry is if there were any faults.
> 

The qi_check_fault() has already cleared the faults and moved ahead the
HEAD register. So probably the developers have to check the kernel log
and locate the fault descriptor by themselves.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
