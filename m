Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FD30C029
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 14:52:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7225486180;
	Tue,  2 Feb 2021 13:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duVdTiO-zrdc; Tue,  2 Feb 2021 13:52:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09CB08613C;
	Tue,  2 Feb 2021 13:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03814C013A;
	Tue,  2 Feb 2021 13:52:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D03F4C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BE39186D11
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3svlsB2cXAS for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 13:52:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D09A863E0
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:52:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B354365042;
 Tue,  2 Feb 2021 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612273946;
 bh=ac1ZwTM9CvDgyKLGWQ3NAE4eyOYLbAx0rSbXGyjfBDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIdumcTFitkG9UW1TirQaViw/HGiSZ9YF57fuvT4VRCUlx/a031Banr5NfuD0rKxt
 e/5TCPgUTtsMj2yHyT04j7P/FsGn8HwkUbXSS1iw0vzJSpr2wIkj8JiJvJZMfkp1l6
 GourvxFtYhv2NBIg6JKfs9WxKTEsx76o/R351h8nQfh7oNDsJ+30rkGHwOp14tDZDl
 qgyDG1HzOXd7+XNyMu5hV/uMVDFr1sdmoDbSAWoYhCCmWY/fxDs4LnX/N8298Xq5Ed
 OT7BiGv59OJuEffT17lWdVUPe6ibslQyBBx/gvxEizsIX+xBu7KsGEBocJR61ZTG0u
 ucyK0WNKexILg==
Date: Tue, 2 Feb 2021 13:52:22 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] iommu: Properly pass gfp_t in _iommu_map() to avoid
 atomic sleeping
Message-ID: <20210202135221.GB17070@willie-the-truck>
References: <20210201170611.1.I64a7b62579287d668d7c89e105dcedf45d641063@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201170611.1.I64a7b62579287d668d7c89e105dcedf45d641063@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Mon, Feb 01, 2021 at 05:06:23PM -0800, Douglas Anderson wrote:
> Sleeping while atomic = bad.  Let's fix an obvious typo to try to avoid it.
> 
> The warning that was seen (on a downstream kernel with the problematic
> patch backported):
> 
>  BUG: sleeping function called from invalid context at mm/page_alloc.c:4726
>  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 9, name: ksoftirqd/0
>  CPU: 0 PID: 9 Comm: ksoftirqd/0 Not tainted 5.4.93-12508-gc10c93e28e39 #1
>  Call trace:
>   dump_backtrace+0x0/0x154
>   show_stack+0x20/0x2c
>   dump_stack+0xa0/0xfc
>   ___might_sleep+0x11c/0x12c
>   __might_sleep+0x50/0x84
>   __alloc_pages_nodemask+0xf8/0x2bc
>   __arm_lpae_alloc_pages+0x48/0x1b4
>   __arm_lpae_map+0x124/0x274
>   __arm_lpae_map+0x1cc/0x274
>   arm_lpae_map+0x140/0x170
>   arm_smmu_map+0x78/0xbc

Damn, I'm annoyed that I didn't come across this in testing. Looks like
arm64 defconfig doesn't have DEBUG_ATOMIC_SLEEP, so that's probably why.
I'll see if I can adjust my scripts to enable that (and some others) for
the builds I actually run.

>   __iommu_map+0xd4/0x210
>   _iommu_map+0x4c/0x84
>   iommu_map_atomic+0x44/0x58
>   __iommu_dma_map+0x8c/0xc4
>   iommu_dma_map_page+0xac/0xf0
> 
> Fixes: d8c1df02ac7f ("iommu: Move iotlb_sync_map out from __iommu_map")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I haven't done any serious testing on this.  I saw a report of the
> warning and the fix seemed obvious so I'm shooting it out.
> 
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Will Deacon <will@kernel.org>

Joerg -- please can you apply this one on top of the pull request I sent
yesterday?

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
