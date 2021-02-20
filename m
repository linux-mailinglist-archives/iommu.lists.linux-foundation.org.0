Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE532031C
	for <lists.iommu@lfdr.de>; Sat, 20 Feb 2021 03:21:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C86587496;
	Sat, 20 Feb 2021 02:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T+xxeRjZJd-h; Sat, 20 Feb 2021 02:21:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1F108749F;
	Sat, 20 Feb 2021 02:21:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95BEAC0001;
	Sat, 20 Feb 2021 02:21:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACDFAC0001
 for <iommu@lists.linux-foundation.org>; Sat, 20 Feb 2021 02:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F66984014
 for <iommu@lists.linux-foundation.org>; Sat, 20 Feb 2021 02:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUleETeSPh6j for <iommu@lists.linux-foundation.org>;
 Sat, 20 Feb 2021 02:21:30 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
 id A272D84026; Sat, 20 Feb 2021 02:21:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A56B284014
 for <iommu@lists.linux-foundation.org>; Sat, 20 Feb 2021 02:21:28 +0000 (UTC)
IronPort-SDR: 9A+uhPYFdiLbWZwdZmgbJTeUv2RRngNWhs/YOnyqL09V/O307xVvb2NDp9Kcjqc4Sfe9mOfYt4
 IPjztcbgHjBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="268887025"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="268887025"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 18:21:27 -0800
IronPort-SDR: jgSY0f4qrxlE3DaXtKwmJn+gTZ7v2A0K0Dsz0yVXZEqgzjfpCj4FuGBdhJnfB3jnzvAZU82IRc
 2EmChZmwK2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="420588765"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2021 18:21:24 -0800
Subject: Re: [PATCH 3/4] iommu/vt-d: Reject unsupported page request modes
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>
References: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1613683878-89946-4-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <fb796569-4612-4ba9-0859-310bd13a32fc@linux.intel.com>
Date: Sat, 20 Feb 2021 10:12:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1613683878-89946-4-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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

On 2/19/21 5:31 AM, Jacob Pan wrote:
> When supervisor/privilige mode SVM is used, we bind init_mm.pgd with
> a supervisor PASID. There should not be any page fault for init_mm.
> Execution request with DMA read is also not supported.
> 
> This patch checks PRQ descriptor for both unsupported configurations,
> reject them both with invalid responses.
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>

Fixes: 1c4f88b7f1f92 ("iommu/vt-d: Shared virtual address in scalable mode")
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel/svm.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
> index 23a1e4f58c54..ff7ae7cc17d5 100644
> --- a/drivers/iommu/intel/svm.c
> +++ b/drivers/iommu/intel/svm.c
> @@ -1113,7 +1113,17 @@ static irqreturn_t prq_event_thread(int irq, void *d)
>   			       ((unsigned long long *)req)[1]);
>   			goto no_pasid;
>   		}
> -
> +		/* We shall not receive page request for supervisor SVM */
> +		if (req->pm_req && (req->rd_req | req->wr_req)) {
> +			pr_err("Unexpected page request in Privilege Mode");
> +			/* No need to find the matching sdev as for bad_req */
> +			goto no_pasid;
> +		}
> +		/* DMA read with exec requeset is not supported. */
> +		if (req->exe_req && req->rd_req) {
> +			pr_err("Execution request not supported\n");
> +			goto no_pasid;
> +		}
>   		if (!svm || svm->pasid != req->pasid) {
>   			rcu_read_lock();
>   			svm = ioasid_find(NULL, req->pasid, NULL);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
