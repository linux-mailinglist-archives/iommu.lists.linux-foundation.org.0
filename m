Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 088DD348E83
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 12:08:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B4184A04;
	Thu, 25 Mar 2021 11:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yq24k6WXuKgc; Thu, 25 Mar 2021 11:08:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF6A84A00;
	Thu, 25 Mar 2021 11:08:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB912C0018;
	Thu, 25 Mar 2021 11:08:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D15EC000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C19440186
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-yAbjmRI9fv for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 11:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89B8E40183
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 11:08:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E15F661A30;
 Thu, 25 Mar 2021 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616670515;
 bh=fmaDG9nwr1c5n2wKHs4RIkkh7aFrQ8iXSJ7J8liDeOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XeHFN1OS4vvVVjqou577ibH/O2XCS9RPKEZC+JbaHxsRXov156h5QImCq4U6ZOvuA
 eDr33pqyWp0RdcRlctOoTZ+yA8u87Ky9rmcXox3mmkhQIfn3XR4jQm0L5hHMWxI1xW
 A5yK1fUjD4pN3dYr/GqEfuT6KIcTZ8yHQgEqk2o50gzOamN+2k8Im1zIEgI7iVC60U
 vIIO5yq8/ui9wmzEzvHnXSRB5rk39/55tpkMuDyx2OceL1BYmuMr3oODLZqYqpB02f
 YRsARtuMAKXDPNaFXY81iyzSZkwdy8e5lbCQ+U52FmcRWI6dUw0CmwG0xAoW0SsnnV
 sQDmfG2hHoW5A==
Date: Thu, 25 Mar 2021 11:08:30 +0000
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: Fix a boundary issue to avoid performance drop
Message-ID: <20210325110829.GC14042@willie-the-truck>
References: <1616643504-120688-1-git-send-email-chenxiang66@hisilicon.com>
 <20210325094344.GB14042@willie-the-truck>
 <60c5c279-1d97-7ae8-9a97-b7c947ce8282@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60c5c279-1d97-7ae8-9a97-b7c947ce8282@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linuxarm@openeuler.org, iommu@lists.linux-foundation.org
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

On Thu, Mar 25, 2021 at 10:48:17AM +0000, Robin Murphy wrote:
> On 2021-03-25 09:43, Will Deacon wrote:
> > [+ Joerg]
> > 
> > On Thu, Mar 25, 2021 at 11:38:24AM +0800, chenxiang wrote:
> > > From: Xiang Chen <chenxiang66@hisilicon.com>
> > > 
> > > After the change of patch ("iommu: Switch gather->end to the
> > > inclusive end"), the performace drops from 1600+K IOPS to 1200K in our
> > > kunpeng ARM64 platform.
> > > We find that the range [start1, end1) actually is joint from the range
> > > [end1, end2), but it is considered as disjoint after the change,
> > > so it needs more times of TLB sync, and spends more time on it.
> > > So fix the boundary issue to avoid performance drop.
> > > 
> > > Fixes: 862c3715de8f ("iommu: Switch gather->end to the inclusive end")
> > > Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> > > ---
> > >   include/linux/iommu.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index ae8eddd..4d5bcc2 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -547,7 +547,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
> > >   	 * structure can be rewritten.
> > >   	 */
> > >   	if (gather->pgsize != size ||
> > > -	    end < gather->start || start > gather->end) {
> > > +	    end + 1 < gather->start || start > gather->end + 1) {
> > >   		if (gather->pgsize)
> > >   			iommu_iotlb_sync(domain, gather);
> > >   		gather->pgsize = size;
> > 
> > Urgh, I must say I much preferred these things being exclusive, but this
> > looks like a necessary fix:
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> > 
> > I wonder whether we should've just made these things u64s instead...
> 
> They'd have to be u65 or larger to represent a range ending on the highest
> valid TTBR1 address, which is a thing we support ;)

Damn, yes, I forgot about TTBR1. This reminds me of the trick with the
carry flag when checking user addresses.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
