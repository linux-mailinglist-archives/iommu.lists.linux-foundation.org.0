Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95F3A6A8A
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 17:36:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728FA608F9;
	Mon, 14 Jun 2021 15:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKbJlBWiueMn; Mon, 14 Jun 2021 15:36:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8A44F608F4;
	Mon, 14 Jun 2021 15:36:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52BD6C0024;
	Mon, 14 Jun 2021 15:36:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F384C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D783608F1
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8fY0SB9QHH1 for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 15:36:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB873608EE
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:36:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E0F6C68AFE; Mon, 14 Jun 2021 17:36:03 +0200 (CEST)
Date: Mon, 14 Jun 2021 17:36:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/1] dma: coherent: check no-map property for arm64
Message-ID: <20210614153603.GA1998@lst.de>
References: <20210611131056.3731084-1-aisheng.dong@nxp.com>
 <20210614083609.GA18701@willie-the-truck>
 <CAA+hA=S8x4S0sgAiJbqOC-wgtOshV_jhAq6eVqX5-EAeg3Dczg@mail.gmail.com>
 <20210614145105.GC30667@arm.com>
 <6f897830-301f-3eb4-785f-de446476e676@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f897830-301f-3eb4-785f-de446476e676@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Dong Aisheng <dongas86@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
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

On Mon, Jun 14, 2021 at 04:34:05PM +0100, Robin Murphy wrote:
>> Looking at the rmem_dma_device_init() -> dma_init_coherent_memory(), it
>> ends up calling memremap(MEMREMAP_WC) which would warn if it intersects
>> with system RAM regardless of the architecture. If the memory region is
>> nomap, it doesn't end up as IORESOURCE_SYSTEM_RAM, so memremap() won't
>> warn. But why is this specific only to arm (or arm64)?
>
> Didn't some ARMv7 implementations permit unexpected cache hits for the 
> non-cacheable address if the same PA has been speculatively fetched via the 
> cacheable alias?

If we care about that we need to change these platforms to change the
cache attributes of the kernel direct mapping instead of using vmap.
We already have code to do that for openrisc, someone just needs to
write the glue code for other platforms.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
