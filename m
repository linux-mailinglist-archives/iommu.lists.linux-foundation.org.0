Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B8568F4EC2
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 15:54:23 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D222214F0;
	Fri,  8 Nov 2019 14:54:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 483E71457
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 14:54:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C07B787D
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 14:54:17 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7CD6221882;
	Fri,  8 Nov 2019 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573224857;
	bh=jWYLwllCUqtBV7+ph/RRP8l2m0z8U4KXT030/BVvZOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkvt+iRMc3rdFHFWdBuMtoO6m4lR1p55i8Wiy6/DYfzZuuXhcv3YkJJ/z6p28gacd
	1bOGxMcHIXM9y7iOHwDFwwKLvr9UEl2FiR0QXOKXqvPNCJy153NRYiVb1+zP7NfBnL
	McG6LFA56dt8cwTO7JE+kLQSaBJ55RiQG8AFnpOs=
Date: Fri, 8 Nov 2019 14:54:13 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3: Allow building as a module
Message-ID: <20191108145407.GA20024@willie-the-truck>
References: <20191030145112.19738-1-will@kernel.org>
	<20191030145112.19738-6-will@kernel.org>
	<20191030193148.GA8432@8bytes.org>
	<20191031154247.GB28061@willie-the-truck>
	<20191104191524.GA2786242@lophozonia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104191524.GA2786242@lophozonia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Jean-Philippe,

On Mon, Nov 04, 2019 at 08:15:24PM +0100, Jean-Philippe Brucker wrote:
> On Thu, Oct 31, 2019 at 03:42:47PM +0000, Will Deacon wrote:
> > > Sorry for the stupid question, but what prevents the iommu module from
> > > being unloaded when there are active users? There are no symbol
> > > dependencies to endpoint device drivers, because the interface is only
> > > exposed through the iommu-api, right? Is some sort of manual module
> > > reference counting needed?
> > 
> > Generally, I think unloading the IOMMU driver module while there are
> > active users is a pretty bad idea, much like unbinding the driver via
> > /sys in the same situation would also be fairly daft. However, I *think*
> > the code in __device_release_driver() tries to deal with this by
> > iterating over the active consumers and ->remove()ing them first.
> 
> > I'm without hardware access at the moment, so I haven't been able to
> > test this myself. We could nobble the module_exit() hook, but there's
> > still the "force unload" option depending on the .config.
> 
> Shame that we can't completely prevent module unloading, because handling
> rmmod cleanly is tricky.
> 
> On module unload we also need to tidy up the bus->iommu_ops installed by
> bus_set_iommu(), and remove the IOMMU groups (and probably other leaks I
> missed). I have a solution for the bus->iommu_ops, which is simply adding
> a bus_unset_iommu() counterpart with a refcount, but it doesn't deal with
> the IOMMU groups cleanly. If there are multiple IOMMU instances managing
> one bus, then we should only remove the IOMMU groups belonging to the
> instance that is being removed.

Hmm, but all of those IOMMU instances must be driven by the same driver,
right, since bus_set_iommu() can only take one set of callbacks for a given
bus? In which case, removing the driver module effectively removes all
instances of the IOMMU for that bus and I think we're ok.

If we couple that with Joerg's suggestion to take a reference to the driver
module in add_device(), then I think that actually it's harmless to leave
the bus ops installed and the groups should be sorted too. It means it's
pretty difficult to unload the module, but that's probably not a bad thing.

I'll post a v2 shortly...

> I'll think about this more, but the simple solution is attached if you
> want to test. It at least works with a single IOMMU now:
> 
> $ modprobe virtio-iommu
> [   25.180965] virtio_iommu virtio0: input address: 64 bits
> [   25.181437] virtio_iommu virtio0: page mask: 0xfffffffffffff000
> [   25.214493] virtio-pci 0000:00:03.0: Adding to iommu group 0
> [   25.233252] virtio-pci 0000:00:03.0: enabling device (0000 -> 0003)
> [   25.334810] e1000e 0000:00:02.0: Adding to iommu group 1
> [   25.348997] e1000e 0000:00:02.0: enabling device (0000 -> 0002)
> ... net test etc
> 
> $ rmmod virtio-iommu
> [   34.084816] e1000e: eth1 NIC Link is Down
> [   34.212152] pci 0000:00:02.0: Removing from iommu group 1
> [   34.250558] pci 0000:00:03.0: Removing from iommu group 0
> [   34.261570] virtio_iommu virtio0: device removed
> 
> $ modprobe virtio-iommu
> [   34.828982] virtio_iommu virtio0: input address: 64 bits
> [   34.829442] virtio_iommu virtio0: page mask: 0xfffffffffffff000
> [   34.844576] virtio-pci 0000:00:03.0: Adding to iommu group 0
> [   34.916449] e1000e 0000:00:02.0: Adding to iommu group 1
> 
> Thanks,
> Jean

> From 5437fcaabe1d4671e2dc5b90b7898c0bf698111b Mon Sep 17 00:00:00 2001
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Date: Mon, 4 Nov 2019 15:52:36 +0100
> Subject: [PATCH] iommu: Add bus_unset_iommu()
> 
> Let modular IOMMU drivers undo bus_set_iommu(). Keep track of bus
> registrations with a list and refcount, and remove the iommu_ops from
> the bus when there are no IOMMU providers anymore.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/iommu.c | 101 ++++++++++++++++++++++++++++++++++--------
>  include/linux/iommu.h |   1 +
>  2 files changed, 84 insertions(+), 18 deletions(-)

To be honest, I think we should be trying to move *away* from the bus-ops
abstraction rather than extending it. We already don't need it for DMA
domains on arm64, and I think it's really just a bit of a wart now because
iommu_domain_alloc() takes a 'struct bus_type *' as its argument.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
