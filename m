Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 446AF1A26B7
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 18:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E33B5221F0;
	Wed,  8 Apr 2020 16:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9tEuYPrpO63z; Wed,  8 Apr 2020 16:06:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 241F4221C6;
	Wed,  8 Apr 2020 16:06:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0881EC1D89;
	Wed,  8 Apr 2020 16:06:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1233C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 16:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C443221F0
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 16:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8l+ySHwugWuT for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 16:06:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 6EEB42155D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 16:06:03 +0000 (UTC)
IronPort-SDR: qNTYNCGh2w+0e1jN3WYR71NuSxQDry8szkzXUUEFRtBAXdp11sCwudUA8Gyg+/FgW3CSJ2qub/
 MBD+D/13pqiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 09:06:01 -0700
IronPort-SDR: FWGMRCIDKc+4rShY/k2btbmNpB2Vde5BU/A9n1poyY3PXe4Ws5w3Xl/N5BgmtT1pk2Wkr9ZZko
 cDdb4dYAUqXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="330578827"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 08 Apr 2020 09:06:01 -0700
Date: Wed, 8 Apr 2020 09:11:52 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v11 02/10] iommu/uapi: Define a mask for bind data
Message-ID: <20200408091152.7e2a2fef@jacob-builder>
In-Reply-To: <20200408130722.GA27140@8bytes.org>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-3-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200408130722.GA27140@8bytes.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 8 Apr 2020 15:07:22 +0200
Joerg Roedel <joro@8bytes.org> wrote:

> On Fri, Apr 03, 2020 at 11:42:06AM -0700, Jacob Pan wrote:
> > Memory type related flags can be grouped together for one simple
> > check.
> > 
> > ---
> > v9 renamed from EMT to MTS since these are memory type support
> > flags. ---
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  include/uapi/linux/iommu.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/linux/iommu.h b/include/uapi/linux/iommu.h
> > index 4ad3496e5c43..d7bcbc5f79b0 100644
> > --- a/include/uapi/linux/iommu.h
> > +++ b/include/uapi/linux/iommu.h
> > @@ -284,7 +284,10 @@ struct iommu_gpasid_bind_data_vtd {
> >  	__u32 pat;
> >  	__u32 emt;
> >  };
> > -
> > +#define IOMMU_SVA_VTD_GPASID_MTS_MASK
> > (IOMMU_SVA_VTD_GPASID_CD | \
> > +					 IOMMU_SVA_VTD_GPASID_EMTE
> > | \
> > +					 IOMMU_SVA_VTD_GPASID_PCD
> > |  \
> > +
> > IOMMU_SVA_VTD_GPASID_PWT)  
> 
> Where and how will this be used? Can you add this in the patch that
> actually makes use of it?
> 
They are used in later patch when setting up PASID entry for guest SVA.
[PATCH v11 04/10] iommu/vt-d: Add nested translation helper function

> Also please add newlines before and after that define.
> 
Will do, thanks.

> 
> Regards,
> 
> 	Joerg

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
