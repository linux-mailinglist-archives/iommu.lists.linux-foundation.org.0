Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A67ECC0
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 08:37:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A6876EC3;
	Fri,  2 Aug 2019 06:37:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD131EB7
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 06:37:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 47492E7
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 06:37:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 80CFE68C65; Fri,  2 Aug 2019 08:37:12 +0200 (CEST)
Date: Fri, 2 Aug 2019 08:37:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Smith <alex.smith@imgtec.com>
Subject: DMA_ATTR_WRITE_COMBINE on mips
Message-ID: <20190802063712.GA7553@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
	Sadegh Abbasi <Sadegh.Abbasi@imgtec.com>
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

[I hope the imgtec address still works, but maybe the mips folks know
if it moved to mips]

Hi Alex,

you added DMA_ATTR_WRITE_COMBINE support in dma_mmap_attrs to mips
in commit 8c172467be36f7c9591e59b647e4cd342ce2ef41
("MIPS: Add implementation of dma_map_ops.mmap()"), but that commit
only added the support in mmap, not in dma_alloc_attrs.  This means
the memory is now used in kernel space through KSEG1, and thus uncached,
while for userspace mappings through dma_mmap_* pgprot_writebombine
is used, which creates a write combine mapping, which on some MIPS CPUs
sets the _CACHE_UNCACHED_ACCELERATED pte bit instead of the
_CACHE_UNCACHED one.  I know at least on arm, powerpc and x86 such
mixed page cachability attributes can cause pretty severe problems.
Are they ok on mips?  Or was the DMA_ATTR_WRITE_COMBINE supported
unintended and not correct and we should remove it?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
