Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CBD7041
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 09:35:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B5868BA4;
	Tue, 15 Oct 2019 07:35:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8157DB6D;
	Tue, 15 Oct 2019 07:35:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1423D5D3;
	Tue, 15 Oct 2019 07:35:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4C96D68CEE; Tue, 15 Oct 2019 09:35:02 +0200 (CEST)
Date: Tue, 15 Oct 2019 09:35:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH 2/2] virtio_ring: Use DMA API if memory is encrypted
Message-ID: <20191015073501.GA32345@lst.de>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
	<1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1570843519-8696-3-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: andmike@us.ibm.com, sukadev@linux.vnet.ibm.com, mdroth@linux.vnet.ibm.com,
	b.zolnierkie@samsung.com, benh@kernel.crashing.org,
	jasowang@redhat.com, aik@linux.ibm.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, paulus@ozlabs.org,
	iommu@lists.linux-foundation.org, paul.burton@mips.com,
	mpe@ellerman.id.au, robin.murphy@arm.com,
	linuxppc-dev@lists.ozlabs.org, hch@lst.de, david@gibson.dropbear.id.au
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

On Fri, Oct 11, 2019 at 06:25:19PM -0700, Ram Pai wrote:
> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> Normally, virtio enables DMA API with VIRTIO_F_IOMMU_PLATFORM, which must
> be set by both device and guest driver. However, as a hack, when DMA API
> returns physical addresses, guest driver can use the DMA API; even though
> device does not set VIRTIO_F_IOMMU_PLATFORM and just uses physical
> addresses.

Sorry, but this is a complete bullshit hack.  Driver must always use
the DMA API if they do DMA, and if virtio devices use physical addresses
that needs to be returned through the platform firmware interfaces for
the dma setup.  If you don't do that yet (which based on previous
informations you don't), you need to fix it, and we can then quirk
old implementations that already are out in the field.

In other words: we finally need to fix that virtio mess and not pile
hacks on top of hacks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
