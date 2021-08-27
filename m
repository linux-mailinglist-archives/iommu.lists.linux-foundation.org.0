Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E17E03F98F7
	for <lists.iommu@lfdr.de>; Fri, 27 Aug 2021 14:24:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EE580CB7;
	Fri, 27 Aug 2021 12:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWOZbx2CqPdX; Fri, 27 Aug 2021 12:24:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7A9F382BA7;
	Fri, 27 Aug 2021 12:24:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47408C000E;
	Fri, 27 Aug 2021 12:24:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F27B7C000E
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 12:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C305A6151A
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 12:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yG9s87JN7D9R for <iommu@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 12:24:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E105606FA
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 12:24:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="205156357"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="205156357"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 05:24:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="528298065"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.238])
 ([10.254.211.238])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 05:24:04 -0700
To: Fenghua Yu <fenghua.yu@intel.com>, David Woodhouse <dwmw2@infradead.org>, 
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>
References: <20210826215918.4073446-1-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Fix PASID leak
Message-ID: <7e1289c9-39d3-6345-9b8d-73596efc5615@linux.intel.com>
Date: Fri, 27 Aug 2021 20:24:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210826215918.4073446-1-fenghua.yu@intel.com>
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

Hi Fenghua,

On 2021/8/27 5:59, Fenghua Yu wrote:
> mm->pasid will be used in intel_svm_free_pasid() after load_pasid()
> during unbinding mm. Clearing it in load_pasid() will cause PASID cannot
> be freed in intel_svm_free_pasid().
> 
> Additionally mm->pasid was updated already before load_pasid() during pasid
> allocation. No need to update it again in load_pasid() during binding mm.
> 
> Don't update mm->pasid to avoid the issues in both binding mm and
> unbinding mm.
> 
> Please note that load_pasid() and its called functions will be re-written
> in upcoming re-enabling ENQCMD series. This patch tries to fix the issues
> cleanly before the re-enabling ENQCMD series.

I will remove above paragraph since it's irrelevant to the issue and the
fix itself. This fix is needed not only for ENQCMD case.

> 
> Fixes: 62ef907a045e ("iommu/vt-d: Fix PASID reference leak")

This change actually fix below commit,

Fixes: 404837741416 ("iommu/vt-d: Use iommu_sva_alloc(free)_pasid() 
helpers")

> 
> Reported-and-tested-by: Dave Jiang <dave.jiang@intel.com>
> Co-developed-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> ---
>   drivers/iommu/intel/svm.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index 4b9b3f35ba0e..ceeca633a5f9 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -516,9 +516,6 @@ static void load_pasid(struct mm_struct *mm, u32 pasid)
>   {
>   	mutex_lock(&mm->context.lock);
>   
> -	/* Synchronize with READ_ONCE in update_pasid(). */
> -	smp_store_release(&mm->pasid, pasid);
> -
>   	/* Update PASID MSR on all CPUs running the mm's tasks. */
>   	on_each_cpu_mask(mm_cpumask(mm), _load_pasid, NULL, true);
>   
> 

I will change the commit title to "iommu/vt-d: Fix PASID leak in
intel_svm_unbind_mm()" and queued it for iommu/fix.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
