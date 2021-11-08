Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5FE447886
	for <lists.iommu@lfdr.de>; Mon,  8 Nov 2021 03:22:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE16E40236;
	Mon,  8 Nov 2021 02:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25K9yEwEUlQe; Mon,  8 Nov 2021 02:22:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 28E4240237;
	Mon,  8 Nov 2021 02:22:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08752C000E;
	Mon,  8 Nov 2021 02:22:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25742C000E
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 02:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 131DA40267
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 02:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5WI60_2GxkS0 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Nov 2021 02:22:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B77540275
 for <iommu@lists.linux-foundation.org>; Mon,  8 Nov 2021 02:22:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="229612130"
X-IronPort-AV: E=Sophos;i="5.87,217,1631602800"; d="scan'208";a="229612130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2021 18:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,217,1631602800"; d="scan'208";a="451304727"
Received: from allen-box.sh.intel.com (HELO [10.239.159.118])
 ([10.239.159.118])
 by orsmga006.jf.intel.com with ESMTP; 07 Nov 2021 18:22:35 -0800
Subject: Re: [PATCH] iommu/vt-d: Fix an unbalanced
 rcu_read_lock/rcu_read_unlock()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, dwmw2@infradead.org,
 joro@8bytes.org, will@kernel.org, kevin.tian@intel.com
References: <40cc077ca5f543614eab2a10e84d29dd190273f6.1636217517.git.christophe.jaillet@wanadoo.fr>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <c7ac5f27-d7b6-6f19-75cc-c047ad590696@linux.intel.com>
Date: Mon, 8 Nov 2021 10:18:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <40cc077ca5f543614eab2a10e84d29dd190273f6.1636217517.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
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

On 11/7/21 12:53 AM, Christophe JAILLET wrote:
> If we return -EOPNOTSUPP, the rcu lock remains lock. This is spurious.
> Go through the end of the function instead. This way, the missing
> 'rcu_read_unlock()' is called.
> 
> Fixes: 7afd7f6aa21a ("iommu/vt-d: Check FL and SL capability sanity in scalable mode")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is speculative, review with care.
> ---
>   drivers/iommu/intel/cap_audit.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel/cap_audit.c b/drivers/iommu/intel/cap_audit.c
> index b39d223926a4..71596fc62822 100644
> --- a/drivers/iommu/intel/cap_audit.c
> +++ b/drivers/iommu/intel/cap_audit.c
> @@ -144,6 +144,7 @@ static int cap_audit_static(struct intel_iommu *iommu, enum cap_audit_type type)
>   {
>   	struct dmar_drhd_unit *d;
>   	struct intel_iommu *i;
> +	int rc = 0;
>   
>   	rcu_read_lock();
>   	if (list_empty(&dmar_drhd_units))
> @@ -169,11 +170,11 @@ static int cap_audit_static(struct intel_iommu *iommu, enum cap_audit_type type)
>   	 */
>   	if (intel_cap_smts_sanity() &&
>   	    !intel_cap_flts_sanity() && !intel_cap_slts_sanity())
> -		return -EOPNOTSUPP;
> +		rc = -EOPNOTSUPP;
>   
>   out:
>   	rcu_read_unlock();
> -	return 0;
> +	return rc;
>   }
>   
>   int intel_cap_audit(enum cap_audit_type type, struct intel_iommu *iommu)
> 

Nice catch! Thank you!

I will queue this for v5.16.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
