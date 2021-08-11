Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479F3E8ECC
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 12:33:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C23344048E;
	Wed, 11 Aug 2021 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Xy9tRvFDQVj; Wed, 11 Aug 2021 10:33:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B06EA40489;
	Wed, 11 Aug 2021 10:33:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B99DC000E;
	Wed, 11 Aug 2021 10:33:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DCD5C000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DE9583777
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 10:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8TrirPyzdyp for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 10:33:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 824F983750
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 10:33:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECD0360C3E;
 Wed, 11 Aug 2021 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628678030;
 bh=MG7heJZm5M3tEsl415rXYzpWZZsIqmxepajSEhkW4Zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RkuqxgEd02iFCSEOmFrL6Lj/suWCuMrUu0fBECIz8mEjKlnHsjlvIwLmWXayBI4Re
 oZvfIrh7+xC86tFxJHW8SKB/YbYeNXNtVKwsFMJrmiRcbkxpnsDM9Gyr0NF9Tx05eL
 d6n8iqUo9ZMGfyCSqYV81EERnG3geug5cBJRdmmWa96V70yrmdv7REaVMTHpEBiNq+
 RBLk8UI5qQHo+uIbngO+jZHUIyWDZQu4gOpt7SiSXL1HF/exMLTmgfxtkMySOuVpry
 Z/dEEi8lNKQJv6UHHHeefspGTTd3zZSjfhYcuGgUB0TfugRT1VzoeIlIaHegB1TdJm
 BsEKf0t/yQ4gA==
Date: Wed, 11 Aug 2021 11:33:45 +0100
From: Will Deacon <will@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC 2/8] iommu/arm-smmu-v3: Add and use static helper
 function arm_smmu_cmdq_issue_cmd_with_sync()
Message-ID: <20210811103344.GA4736@willie-the-truck>
References: <20210626110130.2416-1-thunder.leizhen@huawei.com>
 <20210626110130.2416-3-thunder.leizhen@huawei.com>
 <20210810182454.GB3296@willie-the-truck>
 <b9fa05b5-d3ee-5c79-c8b8-b908e533646a@huawei.com>
 <20210811100905.GB4426@willie-the-truck>
 <d551f31d-4edc-db28-fb08-41a130a5d97f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d551f31d-4edc-db28-fb08-41a130a5d97f@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

On Wed, Aug 11, 2021 at 11:31:08AM +0100, John Garry wrote:
> > > > > Obviously, inserting as many commands at a time as possible can reduce the
> > > > > number of times the mutex contention participates, thereby improving the
> > > > > overall performance. At least it reduces the number of calls to function
> > > > > arm_smmu_cmdq_issue_cmdlist().
> > > > > 
> > > > > Therefore, function arm_smmu_cmdq_issue_cmd_with_sync() is added to insert
> > > > > the 'cmd+sync' commands at a time.
> > > > > 
> > > > > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > > > > ---
> > > > >   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 33 +++++++++++++--------
> > > > >   1 file changed, 21 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > index 2433d3c29b49ff2..a5361153ca1d6a4 100644
> > > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > @@ -858,11 +858,25 @@ static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> > > > >   	return arm_smmu_cmdq_issue_cmdlist(smmu, cmd, 1, false);
> > > > >   }
> > > > > -static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
> > > > > +static int __maybe_unused arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
> > > > >   {
> > > > >   	return arm_smmu_cmdq_issue_cmdlist(smmu, NULL, 0, true);
> > > > >   }
> > > > > +static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> > > > > +					     struct arm_smmu_cmdq_ent *ent)
> > > > > +{
> > > > > +	u64 cmd[CMDQ_ENT_DWORDS];
> > > > > +
> > > > > +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
> > > > > +		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> > > > > +			 ent->opcode);
> > > > > +		return -EINVAL;
> 
> Are any of the errors returned from the "issue command" functions actually
> consumed? I couldn't see it on mainline code from a brief browse.

I don't think so. Can we actually propagate them?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
