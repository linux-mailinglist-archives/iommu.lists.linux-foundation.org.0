Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A2793105652
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 17:02:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4D98824F13;
	Thu, 21 Nov 2019 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URsKITeNcgBo; Thu, 21 Nov 2019 16:02:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2CDA525014;
	Thu, 21 Nov 2019 16:02:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11F1FC18DA;
	Thu, 21 Nov 2019 16:02:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94EAFC18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CE048885F
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85XmxKyzht5U for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 16:02:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D9D5888858
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 16:02:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D87F268BFE; Thu, 21 Nov 2019 17:02:17 +0100 (CET)
Date: Thu, 21 Nov 2019 17:02:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] dma-mapping: treat dev->bus_dma_mask as a DMA limit
Message-ID: <20191121160217.GA1583@lst.de>
References: <20191121092646.8449-1-nsaenzjulienne@suse.de>
 <20191121152457.GA525@lst.de> <20191121152650.GA651@lst.de>
 <70359d2a-10c6-09c7-a857-805085affb0a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70359d2a-10c6-09c7-a857-805085affb0a@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Hanjun Guo <guohanjun@huawei.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Burton <paulburton@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 iommu@lists.linux-foundation.org, Sudeep Holla <sudeep.holla@arm.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Thu, Nov 21, 2019 at 03:55:39PM +0000, Robin Murphy wrote:
> Hmm, there's no functional dependency though, is there? AFAICS it's 
> essentially just a context conflict. Is it worth simply dropping (or 
> postponing) the local renaming in __dma_direct_optimal_gfp_mask(), or 
> perhaps even cross-merging arm64/for-next/zone-dma into dma/for-next?

I would have no problem with pulling it in.  I'd kinda hate creating
the conflict, though.  So if the arm64 maintainers are fine with it
I'll pull it in, especially if I get an ACK from Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
