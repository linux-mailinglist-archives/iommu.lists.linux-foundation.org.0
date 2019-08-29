Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC0A1C85
	for <lists.iommu@lfdr.de>; Thu, 29 Aug 2019 16:16:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0F634473F;
	Thu, 29 Aug 2019 14:16:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1A8DE453C
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 14:14:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A899188E
	for <iommu@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 14:14:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2351F68B20; Thu, 29 Aug 2019 16:14:54 +0200 (CEST)
Date: Thu, 29 Aug 2019 16:14:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 4/5] PCI/vmd: Stop overriding dma_map_ops
Message-ID: <20190829141453.GC18677@lst.de>
References: <20190828141443.5253-1-hch@lst.de>
	<20190828141443.5253-5-hch@lst.de>
	<20190828150106.GD23412@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828150106.GD23412@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	Christoph Hellwig <hch@lst.de>, "Derrick,
	Jonathan" <jonathan.derrick@intel.com>
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

On Wed, Aug 28, 2019 at 09:01:06AM -0600, Keith Busch wrote:
> On Wed, Aug 28, 2019 at 07:14:42AM -0700, Christoph Hellwig wrote:
> > With a little tweak to the intel-iommu code we should be able to work
> > around the VMD mess for the requester IDs without having to create giant
> > amounts of boilerplate DMA ops wrapping code.  The other advantage of
> > this scheme is that we can respect the real DMA masks for the actual
> > devices, and I bet it will only be a matter of time until we'll see the
> > first DMA challeneged NVMe devices.
> 
> This tests out fine on VMD hardware, but it's quite different than the
> previous patch. In v1, the original dev was used in iommu_need_mapping(),
> but this time it's the vmd device. Is this still using the actual device's
> DMA mask then?

True.  But then again I think the old one was broken as well, as it
will pass the wrong dev to identity_mapping() or
iommu_request_dma_domain_for_dev.   So I guess I'll need to respin it
a bit to do the work in iommu_need_mapping again, and then factor
that one to make it obvious what device we deal with.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
