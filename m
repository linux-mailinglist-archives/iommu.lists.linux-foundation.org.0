Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C5365E33
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 19:07:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3AC9401F5;
	Tue, 20 Apr 2021 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_ZNx_2cakWl; Tue, 20 Apr 2021 17:07:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED7654023F;
	Tue, 20 Apr 2021 17:07:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8511C000B;
	Tue, 20 Apr 2021 17:07:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4FD5C000B
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 966016080E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 17:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPsU-LEY8i87 for <iommu@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 17:07:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7D51605D0
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 17:07:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB4FF613AE;
 Tue, 20 Apr 2021 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618938431;
 bh=GE4+p/0+TSRy9zrXwA+A3hbFODGJvMZhR/Foyysj8Xk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HFxLz7aoFzH0dK6/RmYz4uKvPbOqqsrjZrNLFT0IJFHa0MGYHmSLVuRUkf6NJfcp2
 xKYJ31miuYE07A0VOVwkFofARekVV5uPsH53TlwnCvLpvAGTuCz47Qo3Dk0Qb6kBqO
 bEjzYiW24Lt7yrxTk8OtCnQkT/PyQdDy0OsDNNWgJbU6LB0Z5T+8vi7ZwOYLMzR4K0
 Jw+g+vqjjmzGPjUzQmz8qO/yeUSA1YZnuxjVNDIUrl/m4/mtN9qOEfyPFy7lsvnZ3o
 me17wq+dO+YMneqYiukxrKqXKJOdGLshp5NDe0HQxB6Je8dtVvJ11HL0YJTctGz0HH
 rf4sI5yfBAR4w==
Date: Tue, 20 Apr 2021 12:07:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] pci: Rename pci_dev->untrusted to pci_dev->external
Message-ID: <20210420170708.GA2813156@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420061006.GA3523612@infradead.org>
Cc: rajatxjain@gmail.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Rajat Jain <rajatja@google.com>, David Woodhouse <dwmw2@infradead.org>
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

On Tue, Apr 20, 2021 at 07:10:06AM +0100, Christoph Hellwig wrote:
> On Mon, Apr 19, 2021 at 05:30:49PM -0700, Rajat Jain wrote:
> > The current flag name "untrusted" is not correct as it is populated
> > using the firmware property "external-facing" for the parent ports. In
> > other words, the firmware only says which ports are external facing, so
> > the field really identifies the devices as external (vs internal).
> > 
> > Only field renaming. No functional change intended.
> 
> I don't think this is a good idea.  First the field should have been
> added to the generic struct device as requested multiple times before.

Fair point.  There isn't anything PCI-specific about this idea.  The
ACPI "ExternalFacingPort" and DT "external-facing" are currently only
defined for PCI devices, but could be applied elsewhere.

> Right now this requires horrible hacks in the IOMMU code to get at the
> pci_dev, and also doesn't scale to various other potential users.

Agreed, this is definitely suboptimal.  Do you have other users in
mind?  Maybe they could help inform the plan.

> Second the untrusted is objectively a better name.  Because untrusted
> is how we treat the device, which is what mattes.  External is just
> how we come to that conclusion.

The decision to treat "external" as being "untrusted" is a little bit
of policy that the PCI core really doesn't care about, so I think it
does make some sense to let the places that *do* care decide what to
trust based on "external" and possibly other factors, e.g., whether
the device is a BMC or processes untrusted data, etc.

But I guess it makes sense to wait until we have a better motivation
before renaming it, since we don't gain any functionality here.

Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
