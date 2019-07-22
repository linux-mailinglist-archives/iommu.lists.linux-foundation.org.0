Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94B6FE0B
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 12:46:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E9B44CAA;
	Mon, 22 Jul 2019 10:46:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C1EC3CA5
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 10:46:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EBFD5F1
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 10:46:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
	x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
	by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
	17502112-1500050 for multiple; Mon, 22 Jul 2019 11:46:25 +0100
MIME-Version: 1.0
To: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <b0325309-02ea-2284-d3e1-fa78ea62ad1a@arm.com>
References: <20190720180848.15192-1-chris@chris-wilson.co.uk>
	<b0325309-02ea-2284-d3e1-fa78ea62ad1a@arm.com>
Message-ID: <156379238258.24728.11112424033468968352@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] iommu/iova: Remove stale cached32_node
Date: Mon, 22 Jul 2019 11:46:22 +0100
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: intel-gfx@lists.freedesktop.org, Joerg Roedel <jroedel@suse.de>,
	stable@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Quoting Robin Murphy (2019-07-22 11:13:49)
> Hi Chris,
> 
> On 20/07/2019 19:08, Chris Wilson wrote:
> > Since the cached32_node is allowed to be advanced above dma_32bit_pfn
> > (to provide a shortcut into the limited range), we need to be careful to
> > remove the to be freed node if it is the cached32_node.
> 
> Thanks for digging in - just to confirm my understanding, the 
> problematic situation is where both 32-bit and 64-bit nodes have been 
> allocated, the topmost 32-bit node is freed, then the lowest 64-bit node 
> is freed, which leaves the pointer dangling because the second free 
> fails the "free->pfn_hi < iovad->dma_32bit_pfn" check. Does that match 
> your reasoning?

Yes. Once cached32_node is set to the right of dma_32bit_pfn it fails
to be picked up in the next cycle through __cached_rbnode_delete_update
should cached32_node be the next victim.
 
> Assuming I haven't completely misread the problem, I can't think of a 
> more appropriate way to fix it, so;
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> I could swear I did consider that corner case at some point, but since 
> Leizhen and I rewrote this stuff about 5 times between us I'm not 
> entirely surprised such a subtlety could have got lost again along the way.

I admit to being impressed that rb_prev() does not appear high in the
profiles -- though I guess that is more an artifact of the scary layers
of caching above it.
-Chris
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
