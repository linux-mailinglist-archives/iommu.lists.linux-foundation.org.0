Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 759A5428C53
	for <lists.iommu@lfdr.de>; Mon, 11 Oct 2021 13:47:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8D7D402F7;
	Mon, 11 Oct 2021 11:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e8r5KVP-9JPm; Mon, 11 Oct 2021 11:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 24C9D402E1;
	Mon, 11 Oct 2021 11:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBF36C0022;
	Mon, 11 Oct 2021 11:47:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 489F7C000D
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3793E81A64
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQA0kSCstQte for <iommu@lists.linux-foundation.org>;
 Mon, 11 Oct 2021 11:47:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9843981A5F
 for <iommu@lists.linux-foundation.org>; Mon, 11 Oct 2021 11:47:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F16AD68B05; Mon, 11 Oct 2021 13:47:06 +0200 (CEST)
Date: Mon, 11 Oct 2021 13:47:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Karsten Graul <kgraul@linux.ibm.com>
Subject: Re: DPAA2 triggers, [PATCH] dma debug: report -EEXIST errors in
 add_dma_entry
Message-ID: <20211011114706.GA16350@lst.de>
References: <20210518125443.34148-1-someguy@effective-light.com>
 <fd67fbac-64bf-f0ea-01e1-5938ccfab9d0@arm.com>
 <20210914154504.z6vqxuh3byqwgfzx@skbuf>
 <185e7ee4-3749-4ccb-6d2e-da6bc8f30c04@linux.ibm.com>
 <20211001145256.0323957a@thinkpad> <20211006151043.61fe9613@thinkpad>
 <4a96b583-1119-8b26-cc85-f77a6b4550a2@arm.com>
 <fd4a2d8d-3f9d-51f3-1c86-8009ad50e6a1@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd4a2d8d-3f9d-51f3-1c86-8009ad50e6a1@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Hamza Mahfooz <someguy@effective-light.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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

On Thu, Oct 07, 2021 at 12:59:32PM +0200, Karsten Graul wrote:
> In our case its really that a buffer is mapped twice for 2 different devices which we use in SMC to provide failover capabilities. We see that -EEXIST is returned when a buffer is mapped for the second device. Since there is a maximum of 2 parallel mappings we never see the warning shown by active_cacheline_inc_overlap() because we don't exceed ACTIVE_CACHELINE_MAX_OVERLAP.

Mapping something twice is possible, but needs special care.
Basically one device always needs to do the first mapping and the other
one needs to use DMA_ATTR_SKIP_CPU_SYNC to opt out of the coherency
protocol.  So we have two TODO items here: 1) the driver needs to use the
above scheme and 2) this dma-debug check needs to understand
DMA_ATTR_SKIP_CPU_SYNC.  Can I trick you into doing both?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
