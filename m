Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6E341DB8
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:07:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69DA4BA32;
	Fri, 19 Mar 2021 13:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuKhIEOKYGtS; Fri, 19 Mar 2021 13:07:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F7B34EBB8;
	Fri, 19 Mar 2021 13:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 802A5C0010;
	Fri, 19 Mar 2021 13:07:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 455FDC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 225A4400C0
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhmF8bJeeAoB for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:07:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B791400AB
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:07:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE0B568BFE; Fri, 19 Mar 2021 14:07:31 +0100 (CET)
Date: Fri, 19 Mar 2021 14:07:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: Qualify enabling of swiotlb_init()
Message-ID: <20210319130731.GB2624@lst.de>
References: <20210319040333.183827-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319040333.183827-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: opendmb@gmail.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 open list <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:SWIOTLB SUBSYSTEM" <iommu@lists.linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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

On Thu, Mar 18, 2021 at 09:03:33PM -0700, Florian Fainelli wrote:
>  #ifdef CONFIG_ARM_LPAE
> +	if (swiotlb_force == SWIOTLB_FORCE ||
> +	    max_pfn > arm_dma_pfn_limit)

Does arm_dma_pfn_limit do the right thing even with the weirdest
remapping ranges?  Maybe a commen here would be useful.

> +		swiotlb_init(1);
> +	else
> +		swiotlb_force = SWIOTLB_NO_FORCE;

Konrad: what do you think of setting swiotlb_force to SWIOTLB_NO_FORCE
and only switching it to SWIOTLB_NORMAL when swiotlb_init* is called?
That kind makes more sense than forcing the callers to do it.

While we're at it, I think swiotlb_force should probably be renamed to
swiotlb_mode or somethng like that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
