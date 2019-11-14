Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C8FC0D6
	for <lists.iommu@lfdr.de>; Thu, 14 Nov 2019 08:35:10 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 793ABAE0;
	Thu, 14 Nov 2019 07:35:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C45E0408
	for <iommu@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 07:35:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 34C008A
	for <iommu@lists.linux-foundation.org>;
	Thu, 14 Nov 2019 07:35:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 910B768AFE; Thu, 14 Nov 2019 08:34:59 +0100 (CET)
Date: Thu, 14 Nov 2019 08:34:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
Message-ID: <20191114073459.GB26546@lst.de>
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113161340.27228-1-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
	Hanjun Guo <guohanjun@huawei.com>, Frank Rowand <frowand.list@gmail.com>,
	Christoph Hellwig <hch@lst.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Paul Burton <paulburton@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	phil@raspberrypi.org, linux-acpi@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, James Hogan <jhogan@kernel.org>,
	Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
	Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
	iommu@lists.linux-foundation.org, Sudeep Holla <sudeep.holla@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
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

On Wed, Nov 13, 2019 at 05:13:39PM +0100, Nicolas Saenz Julienne wrote:
> Using a mask to represent bus DMA constraints has a set of limitations.
> The biggest one being it can only hold a power of two (minus one). The
> DMA mapping code is already aware of this and treats dev->bus_dma_mask
> as a limit. This quirk is already used by some architectures although
> still rare.
> 
> With the introduction of the Raspberry Pi 4 we've found a new contender
> for the use of bus DMA limits, as its PCIe bus can only address the
> lower 3GB of memory (of a total of 4GB). This is impossible to represent
> with a mask. To make things worse the device-tree code rounds non power
> of two bus DMA limits to the next power of two, which is unacceptable in
> this case.
> 
> In the light of this, rename dev->bus_dma_mask to dev->bus_dma_limit all
> over the tree and treat it as such. Note that dev->bus_dma_limit is
> meant to contain the higher accesible DMA address.

This looks sensible modulo the minor comments in this thread.

> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> ---
> 
> Note this is rebased on top of Christoph's latest DMA series:
> https://www.spinics.net/lists/arm-kernel/msg768600.html

FYI, I'll plan to merge those tonight unless anyone screams.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
