Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F615CB6C
	for <lists.iommu@lfdr.de>; Thu, 13 Feb 2020 20:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 90D878324B;
	Thu, 13 Feb 2020 19:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLo7cMJ+j9Iu; Thu, 13 Feb 2020 19:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E1BC3831F5;
	Thu, 13 Feb 2020 19:54:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0335C1D8E;
	Thu, 13 Feb 2020 19:54:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9197C0177
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 19:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A04A121543
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 19:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6HJV8oTIUWGW for <iommu@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 19:54:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 6C2B02152F
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 19:54:37 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1906F2168B
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581623677;
 bh=ZjBK3ZOdaBBTAWvFDrSILiFRaEmIfeUA9Bda4Zoq/TY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oopda02/3uKgx3wobFBaGSPTqHXmIw4xcVqxfnYIRaKI5eWAOWohATXyqTv8vMllW
 enH8X6zYIQz0YXIFGZ+4ul+kWh1Ghh6GWVgGVtT6NCJ9fFgrLfjOgM2jnC26hZ8p21
 YvgyB/t0UKKmyEFRFMvxrBYbEKw/F0soVXnBcBb4=
Received: by mail-qk1-f178.google.com with SMTP id c188so6920280qkg.4
 for <iommu@lists.linux-foundation.org>; Thu, 13 Feb 2020 11:54:37 -0800 (PST)
X-Gm-Message-State: APjAAAXgIlt//cQBtESVhimqg7G3CY3JyDnY+2lqZ8lhYWec//85eeUa
 hBsiVeU5v5tWRE4R1CXjQsW+ftuy+i8RzfpvLw==
X-Google-Smtp-Source: APXvYqxJjJ6TQ/6a7fL7VW4f10t6FNQJlKeTU1QhyzrQwlRk3MOdpkPnDMq8r+Ctc/zOdmZHOvnLiq+Mx1z2Gqjy454=
X-Received: by 2002:a37:85c4:: with SMTP id
 h187mr17585169qkd.223.1581623676270; 
 Thu, 13 Feb 2020 11:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20200117211628.27888-1-robh@kernel.org>
 <2d04f201-3457-08ad-db8e-735f8315d74e@redhat.com>
In-Reply-To: <2d04f201-3457-08ad-db8e-735f8315d74e@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 13 Feb 2020 13:54:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3=YbcUi=wte-Cmiq-BuD7hRXwSEnHN7E9_bSnHHxG1g@mail.gmail.com>
Message-ID: <CAL_Jsq+3=YbcUi=wte-Cmiq-BuD7hRXwSEnHN7E9_bSnHHxG1g@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Add SMMUv3.2 range invalidation
 support
To: Auger Eric <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Thu, Jan 30, 2020 at 9:06 AM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Rob,
> On 1/17/20 10:16 PM, Rob Herring wrote:
> > Arm SMMUv3.2 adds support for TLB range invalidate operations.
> > Support for range invalidate is determined by the RIL bit in the IDR3
> > register.
> >
> > The range invalidate is in units of the leaf page size and operates on
> > 1-32 chunks of a power of 2 multiple pages. First, we determine from the
> > size what power of 2 multiple we can use. Then we calculate how many
> > chunks (1-31) of the power of 2 size for the range on the iteration. On
> > each iteration, we move up in size by at least 5 bits.
> >
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/iommu/arm-smmu-v3.c | 66 ++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 65 insertions(+), 1 deletion(-)


> > @@ -2003,7 +2024,7 @@ static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
> >  {
> >       u64 cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
> >       struct arm_smmu_device *smmu = smmu_domain->smmu;
> > -     unsigned long start = iova, end = iova + size;
> > +     unsigned long start = iova, end = iova + size, num_pages = 0, tg = 0;
> >       int i = 0;
> >       struct arm_smmu_cmdq_ent cmd = {
> >               .tlbi = {
> > @@ -2022,12 +2043,50 @@ static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
> >               cmd.tlbi.vmid   = smmu_domain->s2_cfg.vmid;
> >       }
> >
> > +     if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> > +             /* Get the leaf page size */
> > +             tg = __ffs(smmu_domain->domain.pgsize_bitmap);
> > +
> > +             /* Convert page size of 12,14,16 (log2) to 1,2,3 */
> > +             cmd.tlbi.tg = ((tg - ilog2(SZ_4K)) / 2) + 1;
> > +
> > +             /* Determine what level the granule is at */
> > +             cmd.tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
> > +
> > +             num_pages = size / (1UL << tg);
> > +     }
> > +
> >       while (iova < end) {
> >               if (i == CMDQ_BATCH_ENTRIES) {
> >                       arm_smmu_cmdq_issue_cmdlist(smmu, cmds, i, false);
> >                       i = 0;
> >               }
> >
> > +             if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> > +                     /*
> > +                      * On each iteration of the loop, the range is 5 bits
> > +                      * worth of the aligned size remaining.
> > +                      * The range in pages is:
> > +                      *
> > +                      * range = (num_pages & (0x1f << __ffs(num_pages)))
> > +                      */
> > +                     unsigned long scale, num;
> > +
> > +                     /* Determine the power of 2 multiple number of pages */
> > +                     scale = __ffs(num_pages);
> > +                     cmd.tlbi.scale = scale;
> > +
> > +                     /* Determine how many chunks of 2^scale size we have */
> > +                     num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
> > +                     cmd.tlbi.num = num - 1;
> > +
> > +                     /* range is num * 2^scale * pgsize */
> > +                     granule = num << (scale + tg);
> > +
> > +                     /* Clear out the lower order bits for the next iteration */
> > +                     num_pages -= num << scale;
> Regarding the 2 options given in
> https://lore.kernel.org/linux-arm-kernel/CAL_JsqKABoE+0crGwyZdNogNgEoG=MOOpf6deQgH6s73c0UNdA@mail.gmail.com/raw,
>
> I understand you implemented 2) but I still do not understand why you
> preferred that one against 1).
>
> In your case of 1023*4k pages this will invalidate by 31 32*2^0*4K +
> 31*2^0*4K pages
> whereas you could achieve that with 10 invalidations with the 1st algo.
> I did not get the case where it is more efficient. Please can you detail.

No, it's only 2 commands. We do 31*4K and then 31*2^5*4K. Here's a the
output of a test case:

iova=10001000, num_pages=0x3e0, granule=1f000, num=31, scale=0, ttl=3
iova=10020000, num_pages=0x0, granule=3e0000, num=31, scale=5, ttl=3

(num_pages being what's left at end of the loop)

As I mentioned on v1, worst case is 4 commands for up to 4GB. It's
20-bits of size (32-12) and each loop processes a minimum of 5 bits.
Each loop becomes a larger aligned size, so scale goes up each pass.
This is what I tried to explain in the top comment.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
