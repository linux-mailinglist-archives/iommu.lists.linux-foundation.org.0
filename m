Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057022AE76
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 13:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EDE387CB9;
	Thu, 23 Jul 2020 11:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OM1TTl5S9ITF; Thu, 23 Jul 2020 11:55:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95DF187CB7;
	Thu, 23 Jul 2020 11:55:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70ACBC004C;
	Thu, 23 Jul 2020 11:55:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53165C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33F292C342
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-kJk4baW3nD for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 11:55:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id DC86A29DD7
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 11:55:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6004C68AFE; Thu, 23 Jul 2020 13:55:27 +0200 (CEST)
Date: Thu, 23 Jul 2020 13:55:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v3 1/2] dma-direct: provide the ability to reserve
 per-numa CMA
Message-ID: <20200723115527.GA31598@lst.de>
References: <20200628111251.19108-1-song.bao.hua@hisilicon.com>
 <20200628111251.19108-2-song.bao.hua@hisilicon.com>
 <20200722141658.GA17658@lst.de>
 <B926444035E5E2439431908E3842AFD25A15A3@DGGEMI525-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B926444035E5E2439431908E3842AFD25A15A3@DGGEMI525-MBS.china.huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Steve Capper <steve.capper@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Linuxarm <linuxarm@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "ganapatrao.kulkarni@cavium.com" <ganapatrao.kulkarni@cavium.com>,
 huangdaode <huangdaode@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "will@kernel.org" <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Wed, Jul 22, 2020 at 09:26:03PM +0000, Song Bao Hua (Barry Song) wrote:
> I understand your concern. Anyway, The primary purpose of this patchset is providing
> a general way for users like IOMMU to get local coherent dma buffers to put their
> command queue and page tables in. The first user case is what really made me
> begin to prepare this patchset.
> 
> For the second case, it is probably a positive side effect of this patchset for those users
> who have more concern on performance than dma security, then they maybe skip
> IOMMU by
> 	iommu.passthrough=
> 			[ARM64, X86] Configure DMA to bypass the IOMMU by default.
> 			Format: { "0" | "1" }
> 			0 - Use IOMMU translation for DMA.
> 			1 - Bypass the IOMMU for DMA.
> 			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
> In this case, they can get local memory and get better performance.
> However, it is not the primary purpose of this patchset.

That's not what I mean.  Hardcoding the CMA regions in the kernel
config is just a bad idea, and we should not add more hard coded values.
You can always use CONFIG_CMDLINE to force a specific kernel command
line including your options.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
