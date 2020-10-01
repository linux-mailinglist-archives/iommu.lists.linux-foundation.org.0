Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E328007F
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 15:51:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 88AFF203D5;
	Thu,  1 Oct 2020 13:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiDNgds27l2Q; Thu,  1 Oct 2020 13:51:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A13320497;
	Thu,  1 Oct 2020 13:51:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FB42C0895;
	Thu,  1 Oct 2020 13:51:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60EDAC0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3B27B2048F
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6ka5WvcnQS3 for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 13:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BD16203D5
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 13:51:35 +0000 (UTC)
IronPort-SDR: DEd1Wg/qZ+KHZOAeOMd8G6eirpiwMHxxFoBgsJeJl7gzO/OV7lezKQJN7vguYRkEPr20mRSMZ0
 xOWghhDwCN0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="180882293"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="180882293"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 06:51:33 -0700
IronPort-SDR: mR2L3z5zRXJ1Bt62W7wINSWAeyfZtQR1B3LD07WUocKjfA0aHsZtw8lAaOq9NFrZdfsAQBxVR9
 deKYSIdv8YcQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="385535258"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 06:51:33 -0700
Date: Thu, 1 Oct 2020 06:51:32 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [Patch V8 0/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20201001135132.GA32553@otc-nc-03>
References: <20200925190620.18732-1-ashok.raj@intel.com>
 <20201001125841.GF30426@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001125841.GF30426@8bytes.org>
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

Hi Joerg

On Thu, Oct 01, 2020 at 02:58:41PM +0200, Joerg Roedel wrote:
> Hi Ashok,
> 
> On Fri, Sep 25, 2020 at 12:06:17PM -0700, Ashok Raj wrote:
> > Sai Praneeth Prakhya (3):
> >   iommu: Add support to change default domain of an iommu group
> >   iommu: Take lock before reading iommu group default domain type
> >   iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file
> > 
> >  .../ABI/testing/sysfs-kernel-iommu_groups          |  30 +++
> >  drivers/iommu/iommu.c                              | 227 ++++++++++++++++++++-
> >  2 files changed, 256 insertions(+), 1 deletion(-)
> 
> Thanks for the repost, I can grab it just fine with b4. But this nees
> some more testing on my side and some time in linux-next, so it is too
> late now to queue it for v5.10. Can you please remind me after the next
> merge window? I'll pick it up then and do the testing and it will
> hopefully spend enough time in linux-next.

Yes, I'll try to remind you after the next merge window.

Cheers,
Ashok
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
