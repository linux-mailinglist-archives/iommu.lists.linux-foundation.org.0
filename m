Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3518E5CD
	for <lists.iommu@lfdr.de>; Sun, 22 Mar 2020 02:29:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 663F387601;
	Sun, 22 Mar 2020 01:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QIpvCoASG3ee; Sun, 22 Mar 2020 01:29:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7E3C875FD;
	Sun, 22 Mar 2020 01:29:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 986D4C07FF;
	Sun, 22 Mar 2020 01:29:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FEB4C07FF
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 01:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 19407887A7
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 01:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxQA+D8lpXkq for <iommu@lists.linux-foundation.org>;
 Sun, 22 Mar 2020 01:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E82F988794
 for <iommu@lists.linux-foundation.org>; Sun, 22 Mar 2020 01:29:39 +0000 (UTC)
IronPort-SDR: wzk1enpfDwGEZergTx6m3+hPpfT54FKhIyB9YYpDRla/WYUY/uHsOV+BMKw8Q9IVCYtaLaVHZT
 vEJAYI6bmgEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2020 18:29:37 -0700
IronPort-SDR: uvgmWcsmqqPKN/s0mPCsPuLNZQTddXWljiLsdd1lxX6ysU7uzjzaaYeFXyfv0k+diEGjxLU4Ot
 PGJR6W699pPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,290,1580803200"; d="scan'208";a="419117017"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.45])
 ([10.254.213.45])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2020 18:29:33 -0700
Subject: Re: [PATCH V10 02/11] iommu/uapi: Define a mask for bind data
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
References: <1584746861-76386-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1584746861-76386-3-git-send-email-jacob.jun.pan@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <ae2a1a46-07ed-8445-d905-37dda1459e28@linux.intel.com>
Date: Sun, 22 Mar 2020 09:29:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1584746861-76386-3-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Cameron <jic23@kernel.org>
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

On 2020/3/21 7:27, Jacob Pan wrote:
> Memory type related flags can be grouped together for one simple check.
> 
> ---
> v9 renamed from EMT to MTS since these are memory type support flags.
> ---
> 
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>   include/uapi/linux/iommu.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 4ad3496e5c43..d7bcbc5f79b0 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
>   	__u32 pat;
>   	__u32 emt;
>   };
> -
> +#define IOMMU_SVA_VTD_GPASID_MTS_MASK	(IOMMU_SVA_VTD_GPASID_CD | \
> +					 IOMMU_SVA_VTD_GPASID_EMTE | \
> +					 IOMMU_SVA_VTD_GPASID_PCD |  \
> +					 IOMMU_SVA_VTD_GPASID_PWT)

As name implies, can this move to intel-iommu.h?

Best regards,
baolu

>   /**
>    * struct iommu_gpasid_bind_data - Information about device and guest PASID binding
>    * @version:	Version of this data structure
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
