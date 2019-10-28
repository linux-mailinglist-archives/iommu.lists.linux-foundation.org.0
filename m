Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C79E7087
	for <lists.iommu@lfdr.de>; Mon, 28 Oct 2019 12:37:38 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6088210AB;
	Mon, 28 Oct 2019 11:37:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5C45AC86
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 11:37:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B764C14D
	for <iommu@lists.linux-foundation.org>;
	Mon, 28 Oct 2019 11:37:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E4BA268AFE; Mon, 28 Oct 2019 12:37:28 +0100 (CET)
Date: Mon, 28 Oct 2019 12:37:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/dma: Add support for DMA_ATTR_SYS_CACHE
Message-ID: <20191028113728.GA24055@lst.de>
References: <1572050616-6143-1-git-send-email-isaacm@codeaurora.org>
	<20191026053026.GA14545@lst.de>
	<e5fe861d7d506eb41c23f3fc047efdfa@codeaurora.org>
	<20191028074156.GB20443@lst.de>
	<20191028112457.GB4122@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028112457.GB4122@willie-the-truck>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: isaacm@codeaurora.org, pratikp@codeaurora.org, linux-kernel@vger.kernel.org,
	lmark@codeaurora.org, iommu@lists.linux-foundation.org,
	robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>
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

On Mon, Oct 28, 2019 at 11:24:58AM +0000, Will Deacon wrote:
> Agreed. The way I /think/ it works is that on many SoCs there is a
> system/last-level cache (LLC) which effectively sits in front of memory for
> all masters. Even if a device isn't coherent with the CPU caches, we still
> want to be able to allocate into the LLC. Why this doesn't happen
> automatically is beyond me, but it appears that on these Qualcomm designs
> you actually have to set the memory attributes up in the page-table to
> ensure that the resulting memory transactions are non-cacheable for the CPU
> but cacheable for the LLC. Without any changes, the transactions are
> non-cacheable in both of them which assumedly has a performance cost.
> 
> But you can see that I'm piecing things together myself here. Isaac?

If that is the case it sounds like we'd want to drive this through
DT properties, not the driver API.  But again, without an actual consumer
it pretty much is a moot point anyway.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
