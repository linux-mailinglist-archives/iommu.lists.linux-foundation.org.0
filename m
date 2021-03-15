Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA233AD87
	for <lists.iommu@lfdr.de>; Mon, 15 Mar 2021 09:33:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E01E430BC;
	Mon, 15 Mar 2021 08:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5jkKpM_8eEt; Mon, 15 Mar 2021 08:33:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 349BC430BB;
	Mon, 15 Mar 2021 08:33:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11572C0001;
	Mon, 15 Mar 2021 08:33:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1955AC0001;
 Mon, 15 Mar 2021 08:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05404430BB;
 Mon, 15 Mar 2021 08:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXR6rCqF1w-b; Mon, 15 Mar 2021 08:33:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA529430BE;
 Mon, 15 Mar 2021 08:33:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D619068C4E; Mon, 15 Mar 2021 09:33:47 +0100 (CET)
Date: Mon, 15 Mar 2021 09:33:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210315083347.GA28445@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com> <20210310091501.GC5928@lst.de>
 <20210310092533.GA6819@lst.de> <fdacf87a-be14-c92c-4084-1d1dd4fc7766@arm.com>
 <20210311082609.GA6990@lst.de> <dff8eb80-8f74-972b-17e9-496c1fc0396f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dff8eb80-8f74-972b-17e9-496c1fc0396f@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-msm@vger.kernel.org
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

On Fri, Mar 12, 2021 at 04:18:24PM +0000, Robin Murphy wrote:
>> Let me know what you think of the version here:
>>
>> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/iommu-cleanup
>>
>> I'll happily switch the patch to you as the author if you're fine with
>> that as well.
>
> I still have reservations about removing the attribute API entirely and 
> pretending that io_pgtable_cfg is anything other than a SoC-specific 
> private interface,

I think a private inteface would make more sense.  For now I've just
condensed it down to a generic set of quirk bits and dropped the
attrs structure, which seems like an ok middle ground for now.  That
being said I wonder why that quirk isn't simply set in the device
tree?

> but the reworked patch on its own looks reasonable to 
> me, thanks! (I wasn't too convinced about the iommu_cmd_line wrappers 
> either...) Just iommu_get_dma_strict() needs an export since the SMMU 
> drivers can be modular - I consciously didn't add that myself since I was 
> mistakenly thinking only iommu-dma would call it.

Fixed.  Can I get your signoff for the patch?  Then I'll switch it to
over to being attributed to you.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
