Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787322ADD6
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 13:37:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E5F087CB7;
	Thu, 23 Jul 2020 11:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ro3cQJhMFvRk; Thu, 23 Jul 2020 11:37:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F05987CB6;
	Thu, 23 Jul 2020 11:37:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6F7CC004C;
	Thu, 23 Jul 2020 11:37:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 550E8C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 46EE829DD9
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZ+cSRZF2SSS for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 454C529DD7
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:36:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U3a0ySa_1595504212; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U3a0ySa_1595504212) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 23 Jul 2020 19:36:52 +0800
Date: Thu, 23 Jul 2020 19:36:52 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200723113652.GA104096@VM20190228-100.tbsite.net>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714082821.GC4516@willie-the-truck>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 baolin.wang7@gmail.com, agross@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
 steven.price@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jul 14, 2020 at 09:28:21AM +0100, Will Deacon wrote:
> On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> > Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> > but the iommu_ops->map() function has been added a gfp_t parameter by
> > commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> > thus io_pgtable_ops->map() should use the gfp parameter passed from
> > iommu_ops->map() to allocate page pages, which can avoid wasting the
> > memory allocators atomic pools for some non-atomic contexts.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
> >  drivers/iommu/arm-smmu-v3.c             |  2 +-
> >  drivers/iommu/arm-smmu.c                |  2 +-
> >  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
> >  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
> >  drivers/iommu/ipmmu-vmsa.c              |  2 +-
> >  drivers/iommu/msm_iommu.c               |  2 +-
> >  drivers/iommu/mtk_iommu.c               |  2 +-
> >  drivers/iommu/qcom_iommu.c              |  2 +-
> >  include/linux/io-pgtable.h              |  2 +-
> >  10 files changed, 26 insertions(+), 26 deletions(-)
> 
> I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
> it looks like you've checked all the callsites and it looks fine to me, so:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- not sure what you want to do with this one, as it's likely to
> conflict (trivially) with unrelated driver changes.

Thanks Will. Joerg, could you apply this 2 patches if no objection from
your side? Thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
