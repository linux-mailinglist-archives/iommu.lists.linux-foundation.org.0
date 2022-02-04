Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A26354A9878
	for <lists.iommu@lfdr.de>; Fri,  4 Feb 2022 12:34:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E4681DB2;
	Fri,  4 Feb 2022 11:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AE2NjNoyp5HT; Fri,  4 Feb 2022 11:34:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 533B381CA3;
	Fri,  4 Feb 2022 11:34:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 231F0C000B;
	Fri,  4 Feb 2022 11:34:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F136C000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 11:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E07F60B62
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 11:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5l2gfiT372j for <iommu@lists.linux-foundation.org>;
 Fri,  4 Feb 2022 11:34:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D10260B23
 for <iommu@lists.linux-foundation.org>; Fri,  4 Feb 2022 11:34:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 83EDA491; Fri,  4 Feb 2022 12:34:41 +0100 (CET)
Date: Fri, 4 Feb 2022 12:34:38 +0100
From: Joerg Roedel <joro@8bytes.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
Message-ID: <Yf0PTlYNn/fmIUZU@8bytes.org>
References: <20220131161749.4021-1-joro@8bytes.org>
 <48a674ae-f5cd-fc06-4505-6d863e6dad69@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48a674ae-f5cd-fc06-4505-6d863e6dad69@huawei.com>
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Maxim Levitsky <mlevitsk@redhat.com>
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

On Mon, Jan 31, 2022 at 05:06:03PM +0000, John Garry wrote:
> > diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> > index dc338acf3338..d2e09d53851f 100644
> > --- a/drivers/iommu/amd/init.c
> > +++ b/drivers/iommu/amd/init.c
> > @@ -834,6 +834,7 @@ static int iommu_ga_log_enable(struct amd_iommu *iommu)
> >   		status = readl(iommu->mmio_base + MMIO_STATUS_OFFSET);
> >   		if (status & (MMIO_STATUS_GALOG_RUN_MASK))
> >   			break;
> > +		udelay(1);
> 
> Maybe readl_relaxed_poll_timeout_atomic() could be used instead

I sent another version of this patch which uses
readl_poll_timeout_atomic(), but it didn't fix the issue. I take this
approach for now and leave using the helper as a future improvement.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
