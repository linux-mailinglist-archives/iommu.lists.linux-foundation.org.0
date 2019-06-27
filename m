Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2918B57F11
	for <lists.iommu@lfdr.de>; Thu, 27 Jun 2019 11:16:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C2D2CDD4;
	Thu, 27 Jun 2019 09:16:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 55A15CD9
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 09:16:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1EBBB837
	for <iommu@lists.linux-foundation.org>;
	Thu, 27 Jun 2019 09:16:03 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 73FAB68B20; Thu, 27 Jun 2019 11:15:30 +0200 (CEST)
Date: Thu, 27 Jun 2019 11:15:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: SATA broken with LPAE
Message-ID: <20190627091530.GA11809@lst.de>
References: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
	<20190626125325.GA4744@lst.de>
	<20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, Vignesh Raghavendra <vigneshr@ti.com>,
	martin.petersen@oracle.com, linux-ide@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>, jejb@linux.ibm.com, "Nori,
	Sekhar" <nsekhar@ti.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	iommu@lists.linux-foundation.org, linux-omap@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Roger Quadros <rogerq@ti.com>
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

On Thu, Jun 27, 2019 at 10:07:53AM +0100, Russell King - ARM Linux admin wrote:
> dmabounce has only ever been used with specific devices that have weird
> setups.  Otherwise, we've never expected what you describe on ARM.  I
> also don't recognise your assertion about the way the DMA API should
> behave as ever having been documented as a requirement for architectures
> to implement.

That requirement has basically always been there since at least the
2.6.x days.  The history here is that when 64-bit architectures showed
up they all had iommus, so this wasn't an issue.  Next was x86 with
highmem, which added special bounce buffering for block I/O and networking
only.  Then ia64 showed up that didn't always have an iommu and swiotlb
was added as a "software IOMMU".  At this point we had to bounce buffering
schemes for block and networking, while everything else potentially
DMAing to higher memory relied on swiotlb, which was picked up by
basically every architecture that could have memory not covered by a
32-bit mask and didn't have an iommu.  Except it seems arm never did
that and has been lucky as people didn't try anything that is not
block or networking on their extended physical address space.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
