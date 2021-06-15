Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29D3A7DB0
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 13:55:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA54405B4;
	Tue, 15 Jun 2021 11:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKluEuOShaTo; Tue, 15 Jun 2021 11:55:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AE92B405B5;
	Tue, 15 Jun 2021 11:55:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78694C0022;
	Tue, 15 Jun 2021 11:55:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62BC4C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313B5405CD
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:55:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPuxAJyl2HM9 for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 11:55:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69760405C9
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 11:55:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13D826145C;
 Tue, 15 Jun 2021 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623758112;
 bh=/gr41PPAaRSOhX5e/haGfhwMpZ7WYsIfJ37HBrtlPqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwgBZ9enw2+xhYQfs4UdzXiJz5YYhnzJWKaVhGpaf9d9QCmClmJ1kGL9Jo1mQl/38
 7UorMKcnnL9eWiIst0o5Veox1+gZ6CY5+MtMADKZbNfx998R66B+JujxfNKfVDGGGv
 KZsUQ5hJliuABc9o0m08ctAFyjWLC9i6p/+uuxAgMWBQV+0jjGy0DtOKnezZPuPmDa
 5PQmhl+ypclZl5pHpwUc8J1s+NVYop3JooAZ85khqGPqUCTAbQBCmx/Noa9TrcoX/d
 hsmPq0/8qOdUoLKu3eu12EF/CVm5lIuCdboloEnXOio4V4XlC/edkLhJJY0kW5hPVm
 2WVNUelHexkJQ==
Date: Tue, 15 Jun 2021 12:55:08 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: remove unnecessary oom message
Message-ID: <20210615115507.GD20598@willie-the-truck>
References: <20210609125438.14369-1-thunder.leizhen@huawei.com>
 <20210611103220.GB15274@willie-the-truck>
 <2a0b7f37-156a-775f-ade4-015cade472c6@huawei.com>
 <20210615113417.GA20598@willie-the-truck>
 <ab17a9d3-fe8b-dcd8-1a69-81f5604cfe81@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab17a9d3-fe8b-dcd8-1a69-81f5604cfe81@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jun 15, 2021 at 12:51:38PM +0100, Robin Murphy wrote:
> On 2021-06-15 12:34, Will Deacon wrote:
> > On Tue, Jun 15, 2021 at 07:22:10PM +0800, Leizhen (ThunderTown) wrote:
> > > 
> > > 
> > > On 2021/6/11 18:32, Will Deacon wrote:
> > > > On Wed, Jun 09, 2021 at 08:54:38PM +0800, Zhen Lei wrote:
> > > > > Fixes scripts/checkpatch.pl warning:
> > > > > WARNING: Possible unnecessary 'out of memory' message
> > > > > 
> > > > > Remove it can help us save a bit of memory.
> > > > > 
> > > > > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > > > > ---
> > > > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++------
> > > > >   1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > index 2ddc3cd5a7d1..fd7c55b44881 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > @@ -2787,10 +2787,8 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
> > > > >   	void *strtab = smmu->strtab_cfg.strtab;
> > > > >   	cfg->l1_desc = devm_kzalloc(smmu->dev, size, GFP_KERNEL);
> > > > > -	if (!cfg->l1_desc) {
> > > > > -		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
> > > > > +	if (!cfg->l1_desc)
> > > > 
> > > > What error do you get if devm_kzalloc() fails? I'd like to make sure it's
> > > > easy to track down _which_ allocation failed in that case -- does it give
> > > > you a line number, for example?
> > > 
> > > When devm_kzalloc() fails, the OOM information is printed. No line number information, but the
> > > size(order) and call stack is printed. It doesn't matter which allocation failed, the failure
> > > is caused by insufficient system memory rather than the fault of the SMMU driver. Therefore,
> > > the current printing is not helpful for locating the problem of insufficient memory. After all,
> > > when memory allocation fails, the SMMU driver cannot work at a lower specification.
> > 
> > I don't entirely agree. Another reason for the failure is because the driver
> > might be asking for a huge (or negative) allocation, in which case it might
> > be instructive to have a look at the actual caller, particularly if the
> > size is derived from hardware or firmware properties.
> 
> Agreed - other than deliberately-contrived situations I don't think I've
> ever hit a genuine OOM, but I definitely have debugged attempts to allocate
> -1 of something. If the driver-specific message actually calls out the
> critical information, e.g. "failed to allocate %d stream table entries", it
> gives debugging a head start since the miscalculation is obvious, but a
> static message that only identifies the callsite really only saves a quick
> trip to scripts/faddr2line, and personally I've never found that
> particularly valuable.

So it sounds like this particular patch is fine, but the one for smmuv2
should leave the IRQ allocation message alone (by virtue of it printing
something a bit more useful -- the number of irqs).

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
