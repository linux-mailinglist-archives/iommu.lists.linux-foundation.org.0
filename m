Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7DD7021
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 09:31:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F091BC77;
	Tue, 15 Oct 2019 07:31:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12941BBC;
	Tue, 15 Oct 2019 07:31:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E529E14D;
	Tue, 15 Oct 2019 07:31:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E7CF568B05; Tue, 15 Oct 2019 09:31:04 +0200 (CEST)
Date: Tue, 15 Oct 2019 09:31:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] dma-mapping: Add dma_addr_is_phys_addr()
Message-ID: <20191015073104.GA32252@lst.de>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
	<20191014045139.GN4080@umbus.fritz.box>
	<37609731-5539-b906-aa94-2ef0242795ac@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37609731-5539-b906-aa94-2ef0242795ac@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
	b.zolnierkie@samsung.com, benh@kernel.crashing.org,
	jasowang@redhat.com, aik@linux.ibm.com,
	Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
	David Gibson <david@gibson.dropbear.id.au>
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

On Mon, Oct 14, 2019 at 11:29:24AM +0100, Robin Murphy wrote:
>> However, I would like to see the commit message (and maybe the inline
>> comments) expanded a bit on what the distinction here is about.  Some
>> of the text from the next patch would be suitable, about DMA addresses
>> usually being in a different address space but not in the case of
>> bounce buffering.
>
> Right, this needs a much tighter definition. "DMA address happens to be a 
> valid physical address" is true of various IOMMU setups too, but I can't 
> believe it's meaningful in such cases.
>
> If what you actually want is "DMA is direct or SWIOTLB" - i.e. "DMA address 
> is physical address of DMA data (not necessarily the original buffer)" - 
> wouldn't dma_is_direct() suffice?

It would.  But drivers have absolutely no business knowing any of this.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
