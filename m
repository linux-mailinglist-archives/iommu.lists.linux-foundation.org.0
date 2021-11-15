Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A4451586
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 21:38:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5990F4015D;
	Mon, 15 Nov 2021 20:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6g38VHHN4amT; Mon, 15 Nov 2021 20:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7EAB840161;
	Mon, 15 Nov 2021 20:38:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C554C0012;
	Mon, 15 Nov 2021 20:38:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8EE4C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99E7140190
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cr4eYFU_nafg for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 20:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 088C84015D
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:38:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56E5561181;
 Mon, 15 Nov 2021 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637008730;
 bh=+MdU1gdoi9Y0H+fD2fxvZbAYwxpeArFFiStYzxrBRt8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Gc+ZpZCFlW9HOVziyYRuqE4eJwj0OMkNSDUIqef+RVb1ECfkLtMSTcD2hNYCXuvnk
 01nJBSp6ieXbE4H/KH74qenlOc4EUkKt7lCluxfg/NSMJelJF3kIPnvpQ+6l7wQgGd
 wYrErNLWfhpJ9Yno3p6LFaiDJgY/JqWOCxPmpI933Zw2CoTyHwaV6eiszNKWe2JSIV
 d0bp7kjEDweS1qBkCDYlW9crnG0uwVBa03wwswB5oVK90g+l90V0IVO5AqARkqRBBv
 r8f/4Y16sbjO2c7BMB4zxxGU6/XAZnDKrD0YBa2XbyeoyRsecAczXwJOj/RL19I+KR
 0Zk8I0UQ/lvBA==
Date: Mon, 15 Nov 2021 14:38:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 01/11] iommu: Add device dma ownership set/release
 interfaces
Message-ID: <20211115203848.GA1586192@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-2-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
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

On Mon, Nov 15, 2021 at 10:05:42AM +0800, Lu Baolu wrote:
> From the perspective of who is initiating the device to do DMA, device
> DMA could be divided into the following types:
> 
>         DMA_OWNER_KERNEL: kernel device driver intiates the DMA
>         DMA_OWNER_USER: userspace device driver intiates the DMA

s/intiates/initiates/ (twice)

As your first sentence suggests, the driver doesn't actually
*initiate* the DMA in either case.  One of the drivers programs the
device, and the *device* initiates the DMA.

> DMA_OWNER_KERNEL and DMA_OWNER_USER are exclusive for all devices in
> same iommu group as an iommu group is the smallest granularity of device
> isolation and protection that the IOMMU subsystem can guarantee.

I think this basically says DMA_OWNER_KERNEL and DMA_OWNER_USER are
attributes of the iommu_group (not an individual device), and it
applies to all devices in the iommu_group.  Below, you allude to the
fact that the interfaces are per-device.  It's not clear to me why you
made a per-device interface instead of a per-group interface.

> This
> extends the iommu core to enforce this exclusion when devices are
> assigned to userspace.
> 
> Basically two new interfaces are provided:
> 
>         int iommu_device_set_dma_owner(struct device *dev,
>                 enum iommu_dma_owner mode, struct file *user_file);
>         void iommu_device_release_dma_owner(struct device *dev,
>                 enum iommu_dma_owner mode);
> 
> Although above interfaces are per-device, DMA owner is tracked per group
> under the hood. An iommu group cannot have both DMA_OWNER_KERNEL
> and DMA_OWNER_USER set at the same time. Violation of this assumption
> fails iommu_device_set_dma_owner().
> 
> Kernel driver which does DMA have DMA_OWNER_KENREL automatically
> set/released in the driver binding process (see next patch).

s/DMA_OWNER_KENREL/DMA_OWNER_KERNEL/

> Kernel driver which doesn't do DMA should not set the owner type (via a
> new suppress flag in next patch). Device bound to such driver is considered
> same as a driver-less device which is compatible to all owner types.
> 
> Userspace driver framework (e.g. vfio) should set DMA_OWNER_USER for
> a device before the userspace is allowed to access it, plus a fd pointer to
> mark the user identity so a single group cannot be operated by multiple
> users simultaneously. Vice versa, the owner type should be released after
> the user access permission is withdrawn.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
