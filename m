Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 517812EB77A
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 02:14:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1672984ECD;
	Wed,  6 Jan 2021 01:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-CBq_LlcMe6; Wed,  6 Jan 2021 01:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F0B084EA3;
	Wed,  6 Jan 2021 01:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20F7CC013A;
	Wed,  6 Jan 2021 01:14:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0DE3C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCEDA84ECD
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UloCzSrg-TlV for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 01:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 776D684EA3
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 01:14:26 +0000 (UTC)
IronPort-SDR: uCQQrhjfP+WjFRy0pbt50fBilmlOIjIgF/FoLjc0fjgIvxc2dAco3cMJP+0MCc5H9OHd1izyYN
 mn8LD2t4TZEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="156399440"
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="156399440"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 17:14:26 -0800
IronPort-SDR: Uc7toaoXygV4ij3rNtEGMj56KxFlvoN5+ltEWxTtgOBsH+UAbO8oS2jZpkufOe3pwrHjLOjtiy
 I8HD2A7cRDQA==
X-IronPort-AV: E=Sophos;i="5.78,478,1599548400"; d="scan'208";a="379090776"
Received: from jan-mobl.ccr.corp.intel.com (HELO [10.255.29.66])
 ([10.255.29.66])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 17:14:23 -0800
Subject: Re: [PATCH 3/5] iommu/vt-d: Remove unused dma map/unmap trace events
To: Will Deacon <will@kernel.org>
References: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
 <20201231005323.2178523-3-baolu.lu@linux.intel.com>
 <20210105190443.GB12182@willie-the-truck>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <8bf33c93-3154-e832-1197-891c684d6ded@linux.intel.com>
Date: Wed, 6 Jan 2021 09:14:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105190443.GB12182@willie-the-truck>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Guo Kaijie <Kaijie.Guo@intel.com>
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

Hi Will,

On 2021/1/6 3:04, Will Deacon wrote:
> On Thu, Dec 31, 2020 at 08:53:21AM +0800, Lu Baolu wrote:
>> With commit c588072bba6b5 ("iommu/vt-d: Convert intel iommu driver to
>> the iommu ops"), the trace events for dma map/unmap have no users any
>> more. Remove them so that they don't show up under
>> /sys/kernel/debug/tracing/events/intel_iommu. The users should use the
>> map/unmap traces defined in the iommu core from now on.
>>
>> Fixes: c588072bba6b5 ("iommu/vt-d: Convert intel iommu driver to the iommu ops")
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   include/trace/events/intel_iommu.h | 119 -----------------------------
>>   1 file changed, 119 deletions(-)
> 
> Is this needed in 5.11, or can it wait until 5.12?

It's necessary for 5.11 as far as I can see. Without this, users still
see the events under /sys/kernel/debug/tracing/events/intel_iommu, but
they will get nothing traced even they enable the events.

> 
> Will
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
