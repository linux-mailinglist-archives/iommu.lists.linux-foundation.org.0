Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB07FEFF
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 18:56:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C88BD15E0;
	Fri,  2 Aug 2019 16:56:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1560615DA
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 16:54:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4959A7ED
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 16:54:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 906D23082137;
	Fri,  2 Aug 2019 16:54:07 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD807608C2;
	Fri,  2 Aug 2019 16:54:06 +0000 (UTC)
Date: Fri, 2 Aug 2019 10:54:06 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 12/15] iommu/vt-d: Cleanup get_valid_domain_for_dev()
Message-ID: <20190802105406.53cd9977@x1.home>
In-Reply-To: <5258f18f-101e-8a43-edea-3f4bb88ca58b@linux.intel.com>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
	<20190525054136.27810-13-baolu.lu@linux.intel.com>
	<20190717211226.5ffbf524@x1.home>
	<9957afdd-4075-e7ee-e1e6-97acb870e17a@linux.intel.com>
	<20190719092303.751659a0@x1.home> <20190801193013.19444803@x1.home>
	<5258f18f-101e-8a43-edea-3f4bb88ca58b@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 02 Aug 2019 16:54:07 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, Joerg Roedel <jroedel@suse.de>, ashok.raj@intel.com,
	dima@arista.com, tmurphy@arista.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>
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

On Fri, 2 Aug 2019 15:17:45 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Alex,
> 
> Thanks for reporting this. I will try to find a machine with a
> pcie-to-pci bridge and get this issue fixed. I will update you
> later.

Further debug below...

> On 8/2/19 9:30 AM, Alex Williamson wrote:
> > DMAR: No ATSR found
> > DMAR: dmar0: Using Queued invalidation
> > DMAR: dmar1: Using Queued invalidation
> > pci 0000:00:00.0: DMAR: Software identity mapping
> > pci 0000:00:01.0: DMAR: Software identity mapping
> > pci 0000:00:02.0: DMAR: Software identity mapping
> > pci 0000:00:16.0: DMAR: Software identity mapping
> > pci 0000:00:1a.0: DMAR: Software identity mapping
> > pci 0000:00:1b.0: DMAR: Software identity mapping
> > pci 0000:00:1c.0: DMAR: Software identity mapping
> > pci 0000:00:1c.5: DMAR: Software identity mapping
> > pci 0000:00:1c.6: DMAR: Software identity mapping
> > pci 0000:00:1c.7: DMAR: Software identity mapping
> > pci 0000:00:1d.0: DMAR: Software identity mapping
> > pci 0000:00:1f.0: DMAR: Software identity mapping
> > pci 0000:00:1f.2: DMAR: Software identity mapping
> > pci 0000:00:1f.3: DMAR: Software identity mapping
> > pci 0000:01:00.0: DMAR: Software identity mapping
> > pci 0000:01:00.1: DMAR: Software identity mapping
> > pci 0000:03:00.0: DMAR: Software identity mapping
> > pci 0000:04:00.0: DMAR: Software identity mapping
> > DMAR: Setting RMRR:
> > pci 0000:00:02.0: DMAR: Setting identity map [0xbf800000 - 0xcf9fffff]
> > pci 0000:00:1a.0: DMAR: Setting identity map [0xbe8d1000 - 0xbe8dffff]
> > pci 0000:00:1d.0: DMAR: Setting identity map [0xbe8d1000 - 0xbe8dffff]
> > DMAR: Prepare 0-16MiB unity mapping for LPC
> > pci 0000:00:1f.0: DMAR: Setting identity map [0x0 - 0xffffff]
> > pci 0000:00:00.0: Adding to iommu group 0
> > pci 0000:00:00.0: Using iommu direct mapping
> > pci 0000:00:01.0: Adding to iommu group 1
> > pci 0000:00:01.0: Using iommu direct mapping
> > pci 0000:00:02.0: Adding to iommu group 2
> > pci 0000:00:02.0: Using iommu direct mapping
> > pci 0000:00:16.0: Adding to iommu group 3
> > pci 0000:00:16.0: Using iommu direct mapping
> > pci 0000:00:1a.0: Adding to iommu group 4
> > pci 0000:00:1a.0: Using iommu direct mapping
> > pci 0000:00:1b.0: Adding to iommu group 5
> > pci 0000:00:1b.0: Using iommu direct mapping
> > pci 0000:00:1c.0: Adding to iommu group 6
> > pci 0000:00:1c.0: Using iommu direct mapping
> > pci 0000:00:1c.5: Adding to iommu group 7
> > pci 0000:00:1c.5: Using iommu direct mapping
> > pci 0000:00:1c.6: Adding to iommu group 8
> > pci 0000:00:1c.6: Using iommu direct mapping
> > pci 0000:00:1c.7: Adding to iommu group 9

Note that group 9 contains device 00:1c.7

> > pci 0000:00:1c.7: Using iommu direct mapping

I'm booted with iommu=pt, so the domain type is IOMMU_DOMAIN_PT

> > pci 0000:00:1d.0: Adding to iommu group 10
> > pci 0000:00:1d.0: Using iommu direct mapping
> > pci 0000:00:1f.0: Adding to iommu group 11
> > pci 0000:00:1f.0: Using iommu direct mapping
> > pci 0000:00:1f.2: Adding to iommu group 11
> > pci 0000:00:1f.3: Adding to iommu group 11
> > pci 0000:01:00.0: Adding to iommu group 1
> > pci 0000:01:00.1: Adding to iommu group 1
> > pci 0000:03:00.0: Adding to iommu group 12
> > pci 0000:03:00.0: Using iommu direct mapping
> > pci 0000:04:00.0: Adding to iommu group 13
> > pci 0000:04:00.0: Using iommu direct mapping
> > pci 0000:05:00.0: Adding to iommu group 9

05:00.0 is downstream of 00:1c.7 and in the same group.  As above, the
domain is type IOMMU_DOMAIN_IDENTITY, so we take the following branch:

        } else {
                if (device_def_domain_type(dev) == IOMMU_DOMAIN_DMA) {

Default domain type is IOMMU_DOMAIN_DMA because of the code block in
device_def_domain_type() handling bridges to conventional PCI and
conventional PCI endpoints.

                        ret = iommu_request_dma_domain_for_dev(dev);

This fails in request_default_domain_for_dev() because there's more
than one device in the group.

                        if (ret) {
                                dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
                                if (!get_private_domain_for_dev(dev)) {

With this commit, this now returns NULL because find_domain() does find
a domain, the same one we found before this code block.

                                        dev_warn(dev,
                                                 "Failed to get a private domain.\n");
                                        return -ENOMEM;
                                }

So the key factors are that I'm booting with iommu=pt and I have a
PCIe-to-PCI bridge grouped with its parent root port.  The bridge
wants an IOMMU_DOMAIN_DMA, but the group domain is already of type
IOMMU_DOMAIN_IDENTITY.  A temporary workaround is to not use
passthrough mode, but this is a regression versus previous kernels.
Thanks,

Alex
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
