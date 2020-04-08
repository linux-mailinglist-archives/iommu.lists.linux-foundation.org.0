Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5FB1A2296
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 15:07:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 97D718739A;
	Wed,  8 Apr 2020 13:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-y3M7KJWVIK; Wed,  8 Apr 2020 13:07:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A9B087C3F;
	Wed,  8 Apr 2020 13:07:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F57CC1D89;
	Wed,  8 Apr 2020 13:07:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 784B4C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6F468873E3
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqfHQ43Wvrjs for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 13:07:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 593758739A
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 13:07:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CE5312CC; Wed,  8 Apr 2020 15:07:24 +0200 (CEST)
Date: Wed, 8 Apr 2020 15:07:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v11 02/10] iommu/uapi: Define a mask for bind data
Message-ID: <20200408130722.GA27140@8bytes.org>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-3-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585939334-21396-3-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Apr 03, 2020 at 11:42:06AM -0700, Jacob Pan wrote:
> Memory type related flags can be grouped together for one simple check.
> 
> ---
> v9 renamed from EMT to MTS since these are memory type support flags.
> ---
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  include/uapi/linux/iommu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> index 4ad3496e5c43..d7bcbc5f79b0 100644
> --- a/include/uapi/linux/iommu.h
> +++ b/include/uapi/linux/iommu.h
> @@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
>  	__u32 pat;
>  	__u32 emt;
>  };
> -
> +#define IOMMU_SVA_VTD_GPASID_MTS_MASK	(IOMMU_SVA_VTD_GPASID_CD | \
> +					 IOMMU_SVA_VTD_GPASID_EMTE | \
> +					 IOMMU_SVA_VTD_GPASID_PCD |  \
> +					 IOMMU_SVA_VTD_GPASID_PWT)

Where and how will this be used? Can you add this in the patch that
actually makes use of it?

Also please add newlines before and after that define.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
