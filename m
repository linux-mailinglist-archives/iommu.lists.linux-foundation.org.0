Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D13AC505
	for <lists.iommu@lfdr.de>; Fri, 18 Jun 2021 09:30:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C575401F5;
	Fri, 18 Jun 2021 07:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvnqrocSjrGq; Fri, 18 Jun 2021 07:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8D3EC401F3;
	Fri, 18 Jun 2021 07:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59659C0022;
	Fri, 18 Jun 2021 07:30:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D40CC000B
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9071683AD5
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bg-uuv_ymENc for <iommu@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 07:30:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE77B83ABE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Jun 2021 07:30:10 +0000 (UTC)
IronPort-SDR: C02+vyFwY0NTeBeTcvb+59WSUz+m5J0ZTM1ewma/qeUhuXGf0f/B/pk1UdXC2wKPAkw9q0e+YC
 Z+ZoRHGFJ+lA==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="206329453"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="206329453"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 00:30:09 -0700
IronPort-SDR: DtvcpqXKRib4nPghAbogwHlPsjrRus/8LU7F7k7RiOl3Tq20r5Q9vDcFtzke1WUdbRZvP5VEgd
 fLBSWcfScBeQ==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="453064554"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.225])
 ([10.254.211.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 00:30:08 -0700
Subject: Re: [bug report] iommu/vt-d: Allocate/register iopf queue for sva
 devices
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YMxDc2Wtn+sMAYDj@mwanda>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e45d5d5e-2eb3-08c1-3f43-d7ae314ea103@linux.intel.com>
Date: Fri, 18 Jun 2021 15:30:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMxDc2Wtn+sMAYDj@mwanda>
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

Thanks for letting me know this. We already have a fix in linux-next.

commit 90141a0fb72340937ed9ec05301cc548901d8eec
Author: Colin Ian King <colin.king@canonical.com>
Date:   Fri Jun 11 14:50:24 2021 +0100

     iommu/vt-d: Fix dereference of pointer info before it is null checked

     The assignment of iommu from info->iommu occurs before info is null 
checked
     hence leading to a potential null pointer dereference issue. Fix 
this by
     assigning iommu and checking if iommu is null after null checking info.

     Fixes: 4c82b88696ac ("iommu/vt-d: Allocate/register iopf queue for 
sva devices")
     Signed-off-by: Colin Ian King <colin.king@canonical.com>
     Addresses-Coverity: ("Dereference before null check")
     Link: 
https://lore.kernel.org/r/20210611135024.32781-1-colin.king@canonical.com
     Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

On 2021/6/18 14:55, Dan Carpenter wrote:
> Hello Lu Baolu,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 4c82b88696ac: "iommu/vt-d: Allocate/register iopf queue for
> sva devices" from Jun 10, 2021, leads to the following Smatch
> complaint:
> 
>      drivers/iommu/intel/iommu.c:5335 intel_iommu_enable_sva()
>      warn: variable dereferenced before check 'info' (see line 5332)
> 
> drivers/iommu/intel/iommu.c
>    5331		struct device_domain_info *info = get_domain_info(dev);
>    5332		struct intel_iommu *iommu = info->iommu;
>                                              ^^^^^^^^^^^
> Dereferenced
> 
>    5333		int ret;
>    5334	
>    5335		if (!info || !iommu || dmar_disabled)
>                      ^^^^^
> Checked too late.  <dramatic prairie dog.gif>
> 
> 
>    5336			return -EINVAL;
>    5337	
> 
> regards,
> dan carpenter
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
