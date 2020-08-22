Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6924E880
	for <lists.iommu@lfdr.de>; Sat, 22 Aug 2020 18:08:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 17CF5880B2;
	Sat, 22 Aug 2020 16:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DW3XO7Q3P4ZG; Sat, 22 Aug 2020 16:08:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F84688093;
	Sat, 22 Aug 2020 16:08:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2202EC0051;
	Sat, 22 Aug 2020 16:08:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63CCCC0051
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 51DA28826E
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zZy+0WCiAUo for <iommu@lists.linux-foundation.org>;
 Sat, 22 Aug 2020 16:08:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1B57488268
 for <iommu@lists.linux-foundation.org>; Sat, 22 Aug 2020 16:08:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22208799-1500050 for multiple; Sat, 22 Aug 2020 17:08:44 +0100
MIME-Version: 1.0
In-Reply-To: <20200822160209.28512-1-chris@chris-wilson.co.uk>
References: <20200822160209.28512-1-chris@chris-wilson.co.uk>
Subject: Re: [PATCH] iommu/intel: Handle 36b addressing for x86-32
From: Chris Wilson <chris@chris-wilson.co.uk>
To: iommu@lists.linux-foundation.org
Date: Sat, 22 Aug 2020 17:08:43 +0100
Message-ID: <159811252325.32652.6039031903844748631@build.alporthouse.com>
User-Agent: alot/0.9
Cc: intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
 stable@vger.kernel.org
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

Quoting Chris Wilson (2020-08-22 17:02:09)
> Beware that the address size for x86-32 may exceed unsigned long.
> 
> [    0.368971] UBSAN: shift-out-of-bounds in drivers/iommu/intel/iommu.c:128:14
> [    0.369055] shift exponent 36 is too large for 32-bit type 'long unsigned int'
> 
> If we don't handle the wide addresses, the pages are mismapped and the
> device read/writes go astray, detected as DMAR faults and leading to
> device failure. The behaviour changed (from working to broken) in commit
> fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer"), but
> the error looks older.
> 
> Fixes: fa954e683178 ("iommu/vt-d: Delegate the dma domain to upper layer")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: James Sewart <jamessewart@arista.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: <stable@vger.kernel.org> # v5.3+
> ---
>  drivers/iommu/intel/iommu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index 2e9c8c3d0da4..ba78a2e854f9 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -123,29 +123,29 @@ static inline unsigned int level_to_offset_bits(int level)
>         return (level - 1) * LEVEL_STRIDE;
>  }
>  
> -static inline int pfn_level_offset(unsigned long pfn, int level)
> +static inline int pfn_level_offset(u64 pfn, int level)

Maybe s/u64/dma_addr_t/ ? I'm not sure what is the appropriate type,
just that this makes i915 not try and eat itself. :)
-Chris
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
