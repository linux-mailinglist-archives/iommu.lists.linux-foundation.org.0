Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC3A10894D
	for <lists.iommu@lfdr.de>; Mon, 25 Nov 2019 08:39:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9DF38204B0;
	Mon, 25 Nov 2019 07:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBC+nkJ0bIO3; Mon, 25 Nov 2019 07:39:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C9A5204AB;
	Mon, 25 Nov 2019 07:39:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F016C0878;
	Mon, 25 Nov 2019 07:39:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 906F3C0878
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 07:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 76A3E87A6B
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 07:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0cwymzNO31FK for <iommu@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 07:39:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F41C987A5A
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 07:39:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0B29A68C65; Mon, 25 Nov 2019 08:39:24 +0100 (CET)
Date: Mon, 25 Nov 2019 08:39:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI
 board installed, unless RAM size limited to 3500M
Message-ID: <20191125073923.GA30168@lst.de>
References: <F1EBB706-73DF-430E-9020-C214EC8ED5DA@xenosoft.de>
 <20191121072943.GA24024@lst.de>
 <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
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

On Sat, Nov 23, 2019 at 12:42:27PM +0100, Christian Zigotzky wrote:
> Hello Christoph,
>
> Please find attached the dmesg of your Git kernel.

Thanks.  It looks like on your platform the swiotlb buffer isn't
actually addressable based on the bus dma mask limit, which is rather
interesting.  swiotlb_init uses memblock_alloc_low to allocate the
buffer, and I'll need some help from Mike and the powerpc maintainers
to figure out how that select where to allocate the buffer from, and
how we can move it to a lower address.  My gut feeling would be to try
to do what arm64 does and define a new ARCH_LOW_ADDRESS_LIMIT, preferably
without needing too much arch specific magic.

As a quick hack can you try this patch on top of the tree from Friday?

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index f491690d54c6..e3f95c362922 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -344,7 +344,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
 #define MEMBLOCK_LOW_LIMIT 0
 
 #ifndef ARCH_LOW_ADDRESS_LIMIT
-#define ARCH_LOW_ADDRESS_LIMIT  0xffffffffUL
+#define ARCH_LOW_ADDRESS_LIMIT  0x0fffffffUL
 #endif
 
 phys_addr_t memblock_phys_alloc_range(phys_addr_t size, phys_addr_t align,
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
