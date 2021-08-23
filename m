Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE893F4AE0
	for <lists.iommu@lfdr.de>; Mon, 23 Aug 2021 14:40:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CF0E401BF;
	Mon, 23 Aug 2021 12:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZ3d2_3xVGsE; Mon, 23 Aug 2021 12:40:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 41CC4401CA;
	Mon, 23 Aug 2021 12:40:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 133DFC001F;
	Mon, 23 Aug 2021 12:40:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8227DC000E
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 12:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C46240221
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 12:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WR5K4nHuLthD for <iommu@lists.linux-foundation.org>;
 Mon, 23 Aug 2021 12:40:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C18604021F
 for <iommu@lists.linux-foundation.org>; Mon, 23 Aug 2021 12:40:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD832613A8;
 Mon, 23 Aug 2021 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629722444;
 bh=q5U8VAdrM7JIakmwfqzISsznoFOmajlx/uTQSgI2IAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfeHZvw6e2t0VI38lRV+B3DMFaG9gEmazNFMlGsahf6Fa5MR1uGITagNFmX2lYjFV
 fRvAZ3zsT0XdwEA6a3Bp5wwaeoYbMhu1UqEtuQHriC3Cz+a3vMRo9vBDeDMDxwYgUo
 ZWb9w839t3KHugDNgB2ABrrhBwbU4gUHHYqk5lRuZB1bqM71nfzl6xvISCuLzRBQ8J
 SGxccuc+vhnaR5OjsxRUWghuDirvV+o42rWomvQVvII4ohw8nOASuK43ucQFXy5NZ9
 99KKHrq7S04aa9hzS7eCbki9O02DgGMdtG1usfX9XYWmSqGtiUyqVD97IFjY544BOR
 KVkzmY29iWY+A==
Date: Mon, 23 Aug 2021 13:40:39 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2 0/2] Don't fail device probing due to
 of_dma_set_restricted_buffer()
Message-ID: <20210823124038.GA20879@willie-the-truck>
References: <20210816132618.11707-1-will@kernel.org>
 <YSN8tz6zb65V9+an@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSN8tz6zb65V9+an@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Claire Chang <tientzu@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Mon, Aug 23, 2021 at 06:47:19AM -0400, Konrad Rzeszutek Wilk wrote:
> On Mon, Aug 16, 2021 at 02:26:15PM +0100, Will Deacon wrote:
> > Hi all,
> > 
> > This is v2 of the patch I previously posted here:
> > 
> >   https://lore.kernel.org/r/20210805094736.902-1-will@kernel.org
> > 
> > Changes since v1 are:
> > 
> >   * Move of_dma_set_restricted_buffer() into of/device.c (Rob)
> >   * Use IS_ENABLED() instead of 'static inline' stub (Rob)
> > 
> > This applies on Konrad's devel/for-linus-5.15 branch in swiotlb.git
> 
> It should show up later today.

Brill, thanks Konrad!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
