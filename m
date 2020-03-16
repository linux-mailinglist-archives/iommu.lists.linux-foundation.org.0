Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 602DA186B57
	for <lists.iommu@lfdr.de>; Mon, 16 Mar 2020 13:47:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 18A6B21563;
	Mon, 16 Mar 2020 12:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BumA9p4J2vrh; Mon, 16 Mar 2020 12:47:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 116BE21538;
	Mon, 16 Mar 2020 12:47:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0811BC013E;
	Mon, 16 Mar 2020 12:47:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E2E6C013E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 12:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C4FD2152A
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 12:46:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FynfLIbsaVj6 for <iommu@lists.linux-foundation.org>;
 Mon, 16 Mar 2020 12:46:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 31A3820774
 for <iommu@lists.linux-foundation.org>; Mon, 16 Mar 2020 12:46:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1711468CEC; Mon, 16 Mar 2020 13:46:53 +0100 (CET)
Date: Mon, 16 Mar 2020 13:46:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC][PATCH] dma-mapping: align default segment_boundary_mask
 with dma_mask
Message-ID: <20200316124652.GA17386@lst.de>
References: <20200314000007.13778-1-nicoleotsuka@gmail.com>
 <f36ac67e-0eca-46df-78ec-c8b1c4fbe951@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f36ac67e-0eca-46df-78ec-c8b1c4fbe951@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, hch@lst.de
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

On Mon, Mar 16, 2020 at 12:12:08PM +0000, Robin Murphy wrote:
> On 2020-03-14 12:00 am, Nicolin Chen wrote:
>> More and more drivers set dma_masks above DMA_BIT_MAKS(32) while
>> only a handful of drivers call dma_set_seg_boundary(). This means
>> that most drivers have a 4GB segmention boundary because DMA API
>> returns DMA_BIT_MAKS(32) as a default value, though they might be
>> able to handle things above 32-bit.
>
> Don't assume the boundary mask and the DMA mask are related. There do exist 
> devices which can DMA to a 64-bit address space in general, but due to 
> descriptor formats/hardware design/whatever still require any single 
> transfer not to cross some smaller boundary. XHCI is 64-bit yet requires 
> most things not to cross a 64KB boundary. EHCI's 64-bit mode is an example 
> of the 4GB boundary (not the best example, admittedly, but it undeniably 
> exists).

Yes, which is what the boundary is for.  But why would we default to
something restrictive by default even if the driver didn't ask for it?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
