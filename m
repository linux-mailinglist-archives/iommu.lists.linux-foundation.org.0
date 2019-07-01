Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930131AAC
	for <lists.iommu@lfdr.de>; Sat,  1 Jun 2019 11:02:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8E0B67EFA;
	Sat,  1 Jun 2019 09:02:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63CE07EFC
	for <iommu@lists.linux-foundation.org>;
	Sat,  1 Jun 2019 09:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 24581844
	for <iommu@lists.linux-foundation.org>;
	Sat,  1 Jun 2019 09:00:31 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 4902068B02; Sat,  1 Jun 2019 11:00:06 +0200 (CEST)
Date: Sat, 1 Jun 2019 11:00:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] dma: replace single-char identifiers in macros
Message-ID: <20190601090005.GC6453@lst.de>
References: <1559079041-525-1-git-send-email-cai@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559079041-525-1-git-send-email-cai@lca.pw>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jroedel@suse.de, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, akpm@linux-foundation.org,
	robin.murphy@arm.com, hch@lst.de
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

On Tue, May 28, 2019 at 05:30:41PM -0400, Qian Cai wrote:
> There are a few macros in DMA have single-char identifiers make the code
> hard to read. Replace them with meaningful names.

Well, this code isn't really supposed to be read much, it just has
minimal stubs.  and dmar.h is not related at all to the dma-mapping
subsystem.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
