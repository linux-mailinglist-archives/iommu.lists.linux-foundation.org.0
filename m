Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9C804BB
	for <lists.iommu@lfdr.de>; Sat,  3 Aug 2019 08:42:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48B9C1863;
	Sat,  3 Aug 2019 06:42:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2B0071823
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 06:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B3F7D712
	for <iommu@lists.linux-foundation.org>;
	Sat,  3 Aug 2019 06:39:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A49A368BFE; Sat,  3 Aug 2019 08:39:27 +0200 (CEST)
Date: Sat, 3 Aug 2019 08:39:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gavin Li <gavinli@thegavinli.com>
Subject: Re: [PATCH v1] dma-mapping: normal memory for mmap() on coherent
	architectures
Message-ID: <20190803063927.GA29719@lst.de>
References: <20190802180758.9691-1-gavinli@thegavinli.com>
	<20190803062333.GC29348@lst.de>
	<CA+GxvY5EzTOXWSn_nKb2=v2Lzy6kKBvd+LfWpeNF5o2iD1E6Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+GxvY5EzTOXWSn_nKb2=v2Lzy6kKBvd+LfWpeNF5o2iD1E6Rg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Aug 02, 2019 at 11:35:48PM -0700, Gavin Li wrote:
> Ah, seems like it wasn't as simple of a fix as I thought :)

With our mess of dma flags nothing is ever as simple as it seems..

> I intended to use dma_mmap_coherent() in the usbfs driver
> (drivers/usb/core/devio.c) because its mmap() was broken on arm64 and
> all the other noncoherent DMA architectures.

Good to know, that is the right thing to do!

I'll try to expedite the fix to 5.3-rc + stable backports once we agree
on the details.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
