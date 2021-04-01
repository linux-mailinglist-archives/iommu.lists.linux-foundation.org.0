Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 139D1351242
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 11:32:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7E440FB2;
	Thu,  1 Apr 2021 09:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLWVp0za7sGk; Thu,  1 Apr 2021 09:32:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7976B40FA6;
	Thu,  1 Apr 2021 09:32:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 464F9C000A;
	Thu,  1 Apr 2021 09:32:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DC65C000A;
 Thu,  1 Apr 2021 09:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A38484A22;
 Thu,  1 Apr 2021 09:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyiKSEnx-6fo; Thu,  1 Apr 2021 09:32:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAC2484A21;
 Thu,  1 Apr 2021 09:32:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F161068B05; Thu,  1 Apr 2021 11:32:01 +0200 (CEST)
Date: Thu, 1 Apr 2021 11:32:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 06/18] iommu/fsl_pamu: remove ->domain_window_enable
Message-ID: <20210401093201.GC2934@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-7-hch@lst.de> <20210330124009.GF5908@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330124009.GF5908@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Mar 30, 2021 at 01:40:09PM +0100, Will Deacon wrote:
> > +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> > +				 geom->aperture_end - 1, ~(u32)0,
> 
> You're passing 'geom->aperture_end - 1' as the size here, but the old code
> seemed to _add_ 1:
> 

> > -	win_size = (domain->geometry.aperture_end + 1) >> ilog2(1);
> 
> here ^^ when calculating the exclusive upper bound. In other words, I think
> '1ULL << 36' used to get passed to pamu_config_ppaace(). Is that an
> intentional change?

No, I've fixed it up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
