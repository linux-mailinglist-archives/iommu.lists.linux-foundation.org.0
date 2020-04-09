Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5461A37F0
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 18:26:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E8C286B12;
	Thu,  9 Apr 2020 16:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJt7ajkYGcHR; Thu,  9 Apr 2020 16:26:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0688686AE3;
	Thu,  9 Apr 2020 16:26:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7208C1D89;
	Thu,  9 Apr 2020 16:26:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69E36C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 16:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5CCB9864E6
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 16:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10lhEcYaCG_Y for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 16:26:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A611E858DA
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 16:26:02 +0000 (UTC)
IronPort-SDR: vOkJO3LwG66YKCRxv4OvRA2KU0M4X8gJ17HnRvA3WE+zPgqUTF2KuLD13fDFbppcyiDpFnORkk
 j9lbPnyQrckw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 09:26:01 -0700
IronPort-SDR: 8/LGmhIM5MwKi2eUWfTHSnf2QnrPmqS+S/dd70DJkUl0rzn63t4OaFgbfDAFfn2XDaFWQXASiv
 No+nRg/JPUwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="251943198"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 09:26:01 -0700
Date: Thu, 9 Apr 2020 09:31:53 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/2] iommu: Remove iommu_sva_ops::mm_exit()
Message-ID: <20200409093153.3da80d0d@jacob-builder>
In-Reply-To: <20200409120821.GE11886@ziepe.ca>
References: <20200408140427.212807-1-jean-philippe@linaro.org>
 <20200408113552.7888bfee@jacob-builder>
 <20200408190226.GA11886@ziepe.ca>
 <20200408143552.57f5837c@jacob-builder>
 <20200408223218.GC11886@ziepe.ca>
 <20200408164802.155a69e3@jacob-builder>
 <20200409120821.GE11886@ziepe.ca>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, arnd@arndb.de, "Yu,
 Fenghua" <fenghua.yu@intel.com>, gregkh@linuxfoundation.org,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

On Thu, 9 Apr 2020 09:08:21 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Apr 08, 2020 at 04:48:02PM -0700, Jacob Pan wrote:
> > > Yes, this is the proper way, when the DMA is stopped and no use
> > > of the PASID remains then you can drop the mmu notifier and
> > > release the PASID entirely. If that is linked to the lifetime of
> > > the FD then forget completely about the mm_struct lifetime, it
> > > doesn't matter.. 
> > Got everything above, thanks a lot.
> > 
> > If everything is in order with the FD close. Why do we need to 
> > "ask IOMMU drivers to silently abort DMA and Page Requests in the
> > meantime." in mm_exit notifier? This will be done orderly in unbind
> > anyway.  
> 
> I thought this is exactly what Jean-Phillippe is removing here, it is
> a bad idea for the reasons he explained.
> 
I think this patch only removed driver side callbacks, i.e. to stop
DMA. But not removing IOMMU side of stop DMA, PRS.

Before uacce, (universal accelerator framework), sva bind/unbind is not
guaranteed at open/close FD time. Therefore, mmu notifier is needed if
mmexit comes without unbind.

> > > > Enforcing unbind upon FD close might be a precarious path,
> > > > perhaps that is why we have to deal with out of order
> > > > situation?    
> > > 
> > > How so? You just put it in the FD release function :)  
> > 
> > I was thinking some driver may choose to defer unbind in some
> > workqueue etc.  
> 
> Doesn't really change anything, the lifetime of the PASID wouuld be
> the lifetime of the notifier and the bind, and DMA can't continue
> without the notifier registered.
> 
True, it is just better not to defer. Otherwise, the window of
suppressing error gets longer.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
