Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23435873A
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 16:32:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 058D0841A9;
	Thu,  8 Apr 2021 14:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJ2WrEQ0aazX; Thu,  8 Apr 2021 14:32:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C4F2841AA;
	Thu,  8 Apr 2021 14:32:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7496C000A;
	Thu,  8 Apr 2021 14:32:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 711D5C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FE0240115
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIDrZ4-lM-WO for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 14:32:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8B8140100
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 14:32:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C8C1610C7;
 Thu,  8 Apr 2021 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617892357;
 bh=bnvDob5CztkbQUTwJofxCyEWEfxMl4WR1ds+3MCG2bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EubHS+SS5+R2YdFDGsq4j/i9986/4BeTdsdE/Oo7lnSWR7ZtteiGELjdkORrhDqXp
 loRu07iqgMlDdWzgWSumOvYOM0cZFJxg7lx/9ciim4O+YSbc+Uu56LeC4Dz/VlqOKO
 rcWVlIt9p6tQV2s4xcwMoIkdeqQDSFolHUhd1cE0J/dQgwLVnVyeevN9xAaS3ulHbg
 srYBS3q6zOGt2sAZTDCKxrWJ+lqeNMDqxVOBP2qvk5wi0uBzwwm0jnRmbPSgTOSgJk
 Y9ZR5k+gpwEwj1EUI1NntWSp3PO5yWOe7vRsKwBdC/IrU18DRaNL1m4GC2006HcJcw
 f6tfZg+FtIO6A==
Date: Thu, 8 Apr 2021 15:32:33 +0100
From: Will Deacon <will@kernel.org>
To: isaacm@codeaurora.org
Subject: Re: [RFC PATCH v4 12/15] iommu/io-pgtable-arm-v7s: Implement
 arm_v7s_unmap_pages()
Message-ID: <20210408143232.GF17998@willie-the-truck>
References: <20210408045241.27316-1-isaacm@codeaurora.org>
 <20210408045241.27316-13-isaacm@codeaurora.org>
 <20210408135807.GA17998@willie-the-truck>
 <342d453c1e5d737122b43be006de6077@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <342d453c1e5d737122b43be006de6077@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pratikp@codeaurora.org, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

On Thu, Apr 08, 2021 at 07:19:29AM -0700, isaacm@codeaurora.org wrote:
> On 2021-04-08 06:58, Will Deacon wrote:
> > On Wed, Apr 07, 2021 at 09:52:38PM -0700, Isaac J. Manjarres wrote:
> > > Implement the unmap_pages() callback for the ARM v7s io-pgtable
> > > format.
> > > 
> > > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm-v7s.c | 23 ++++++++++++++++++++---
> > >  1 file changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/io-pgtable-arm-v7s.c
> > > b/drivers/iommu/io-pgtable-arm-v7s.c
> > > index d4004bcf333a..5e203e03c352 100644
> > > --- a/drivers/iommu/io-pgtable-arm-v7s.c
> > > +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> > > @@ -710,15 +710,32 @@ static size_t __arm_v7s_unmap(struct
> > > arm_v7s_io_pgtable *data,
> > >  	return __arm_v7s_unmap(data, gather, iova, size, lvl + 1, ptep);
> > >  }
> > > 
> > > -static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned
> > > long iova,
> > > -			    size_t size, struct iommu_iotlb_gather *gather)
> > > +static size_t arm_v7s_unmap_pages(struct io_pgtable_ops *ops,
> > > unsigned long iova,
> > > +				  size_t pgsize, size_t pgcount,
> > > +				  struct iommu_iotlb_gather *gather)
> > >  {
> > >  	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > > +	size_t unmapped = 0, ret;
> > > 
> > >  	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
> > >  		return 0;
> > > 
> > > -	return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
> > > +	while (pgcount--) {
> > > +		ret = __arm_v7s_unmap(data, gather, iova, pgsize, 1, data->pgd);
> > > +		if (!ret)
> > > +			break;
> > > +
> > > +		unmapped += pgsize;
> > > +		iova += pgsize;
> > > +	}
> > > +
> > > +	return unmapped;
> > > +}
> > 
> > Wait -- don't you need to hook this up somewhere (likewise for
> > ->map_pages)?
> Done. Likewise for map_pages(). I'm not sure how the compiler didn't catch
> this; I'm compile testing this, as I don't have hardware that uses the short
> descriptor format.

Damn, neither do I :/ My seattle has all the memory high up iirc.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
