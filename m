Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E6C274AE8
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 23:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C55368705B;
	Tue, 22 Sep 2020 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mgyeXys8H+f; Tue, 22 Sep 2020 21:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 068C887053;
	Tue, 22 Sep 2020 21:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6887C0893;
	Tue, 22 Sep 2020 21:13:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05398C0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DDBDA86709
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 21:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DMF2J90TPjG for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 21:13:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 97F85866F4
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 21:13:05 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6a68b20000>; Tue, 22 Sep 2020 14:12:18 -0700
Received: from [10.20.170.18] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Sep
 2020 21:12:54 +0000
Date: Tue, 22 Sep 2020 16:12:49 -0500
From: Alex Goins <agoins@nvidia.com>
X-X-Sender: agoins@agoins-DiGiTS
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 05/38] drm: prime: use sgtable iterators in
 drm_prime_sg_to_page_addr_arrays()
In-Reply-To: <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
Message-ID: <alpine.DEB.2.20.2009221610450.27953@agoins-DiGiTS>
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133259eucas1p273f0e05005b7b1158d884295d35745fd@eucas1p2.samsung.com>
 <20200513133245.6408-5-m.szyprowski@samsung.com>
 <alpine.DEB.2.20.2009211803580.19454@agoins-DiGiTS>
 <afb59d1b-1fcf-fd6d-2b48-e078e129f1eb@samsung.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600809138; bh=eDw/Y+WvGisaFJLGeLDL1cgx4wGsvRwxMR3w6+tFJgE=;
 h=Date:From:X-X-Sender:To:CC:Subject:In-Reply-To:Message-ID:
 References:User-Agent:X-NVConfidentiality:MIME-Version:
 Content-Type:X-Originating-IP:X-ClientProxiedBy;
 b=Eo9od3YgFzrokUrlC+GkylUgaEM6H3/JoZ8VAsxxdIl9L1k7fmfTTeaMtcSVONyNe
 ugVp5jMHoqMBBnEgkhlJLszfUZYtSl8RQ5G3uRlXt7zoCgIY/0h6XX4FNuiH8Kb0S7
 WyRCcKI/bgFvn3zgzEfYD2tAqDxNiPDV/Dq3tjbte0g6Nhf4/YhF6akfbfcy/Styf4
 bUNbi2Zb7AFaWAuZBIsbRGocbT6iAy6lQbVA6v2eMw6KTlEKdB+PzvydytW5YeufYd
 t70q9gBMMRUD1C9tRuLLmMiYDa1OQo3J792HaY7U0hejkWFXmjlraDz1/kB/W6H1mV
 4/CT5hDoP5xiQ==
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

Hi Marek,

On Tue, 22 Sep 2020, Marek Szyprowski wrote:

> External email: Use caution opening links or attachments
> 
> 
> Hi Alex,
> 
> On 22.09.2020 01:15, Alex Goins wrote:
> > Tested-by: Alex Goins <agoins@nvidia.com>
> >
> > This change fixes a regression with drm_prime_sg_to_page_addr_arrays() and
> > AMDGPU in v5.9.
> 
> Thanks for testing!
> 
> > Commit 39913934 similarly revamped AMDGPU to use sgtable helper functions. When
> > it changed from dma_map_sg_attrs() to dma_map_sgtable(), as a side effect it
> > started correctly updating sgt->nents to the return value of dma_map_sg_attrs().
> > However, drm_prime_sg_to_page_addr_arrays() incorrectly uses sgt->nents to
> > iterate over pages, rather than sgt->orig_nents, resulting in it now returning
> > the incorrect number of pages on AMDGPU.
> >
> > I had written a patch that changes drm_prime_sg_to_page_addr_arrays() to use
> > for_each_sgtable_sg() instead of for_each_sg(), iterating using sgt->orig_nents:
> >
> > -       for_each_sg(sgt->sgl, sg, sgt->nents, count) {
> > +       for_each_sgtable_sg(sgt, sg, count) {
> >
> > This patch takes it further, but still has the effect of fixing the number of
> > pages that drm_prime_sg_to_page_addr_arrays() returns. Something like this
> > should be included in v5.9 to prevent a regression with AMDGPU.
> 
> Probably the easiest way to handle a fix for v5.9 would be to simply
> merge the latest version of this patch also to v5.9-rcX:
> https://lore.kernel.org/dri-devel/20200904131711.12950-3-m.szyprowski@samsung.com/

Tested-by: Alex Goins <agoins@nvidia.com> that version too.

> 
> This way we would get it fixed and avoid possible conflict in the -next.

> Do you have any AMDGPU fixes for v5.9 in the queue? Maybe you can add that
> patch to the queue? 

I don't have any more AMDGPU fixes, just want to ensure that this makes it in.

Thanks,
Alex

> Dave: would it be okay that way?
> 
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
