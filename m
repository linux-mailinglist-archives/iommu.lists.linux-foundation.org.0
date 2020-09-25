Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1C278EB2
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 18:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C39C2037B;
	Fri, 25 Sep 2020 16:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MpUU2GmLduLZ; Fri, 25 Sep 2020 16:35:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 989C120364;
	Fri, 25 Sep 2020 16:35:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF66C0859;
	Fri, 25 Sep 2020 16:35:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39F03C0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2632586D19
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEaFD9APS9wt for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 16:35:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 74EE086D08
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 16:35:47 +0000 (UTC)
IronPort-SDR: mkBqS1R+vtn+NP/jbDdrdJ6tVNGB5nWVutGnj2vM6zU/el+Wzmn6CSxIbt9xxQLC5jHHYCTGEV
 ZBZ8iwDDc8lA==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="141600162"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="141600162"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 09:35:46 -0700
IronPort-SDR: klsL7SwkavkFEosKfSVcSFPH24mH++sINYeJh3VRnVqKZXW99ntcEPPUqpitWL4TpqFd855X6v
 gHwHOqMHkgWw==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; d="scan'208";a="487531984"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 09:35:46 -0700
Date: Fri, 25 Sep 2020 09:35:44 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH V7 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20200925163544.GA92046@otc-nc-03>
References: <cover.1595619936.git.sai.praneeth.prakhya@intel.com>
 <20200924172148.GA85236@otc-nc-03>
 <20200925073423.GT27174@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925073423.GT27174@8bytes.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi Joerg,

thanks!

On Fri, Sep 25, 2020 at 09:34:23AM +0200, Joerg Roedel wrote:
> Hi Ashok,
> 
> On Thu, Sep 24, 2020 at 10:21:48AM -0700, Raj, Ashok wrote:
> > Just trying to followup on this series.
> > 
> > Sai has moved out of Intel, hence I'm trying to followup on his behalf.
> > 
> > Let me know if you have queued this for the next release.
> 
> Not yet, but I think this is mostly ready. Can you please send a new
> version in a new mail thread so that I can pick it up with b4?

So just another version bump, no other changes?

I thought v6-v7 was a version bump...
> 
> Thanks,
> 
> 	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
