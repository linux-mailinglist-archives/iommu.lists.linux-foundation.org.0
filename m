Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145A27EC45
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 17:21:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC4A9871ED;
	Wed, 30 Sep 2020 15:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGQc5gsRLTAv; Wed, 30 Sep 2020 15:20:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35F7C871E5;
	Wed, 30 Sep 2020 15:20:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17B9DC1AD6;
	Wed, 30 Sep 2020 15:20:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 973C3C016F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 15:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 825A522636
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 15:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmEG1z6ALX9p for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 15:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 1AD2A2264A
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 15:20:56 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601479252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8oFwCHrN/W6WTNQvqTZiyA5hlMY4vck+KbQYcROkbgY=;
 b=tYCl/2l9R4E995Qh3NpKoAyGCVWL3mDAoINqMv/wNuGX6S4HLY1wMVi/opGNyehAjnBuMJ
 J/mFnxqGJi9y1lrDtU8LnMFno2uyNWDnp52TihMLBsugausO/YZBw9cbDzave2vbIBXeT8
 c9XBrJIFqei726uvASaVWHUY0kaV6FfyTCQHpLR8sEmrbwtoP4kxIIsZD7IACBeeRFwZRn
 7ON7hpLw5Uvl1DVWD6PmixAFdMiv1ob39g6MMUQOdgyjsZ5EuJng24RutTqLc8w0qmwBjO
 sK7GXvZRJiyMy6q4MjQkl7MaHjpAFd5Jhp3xPljWJGbGpYvLtX3WFJdeM0y38A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601479252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8oFwCHrN/W6WTNQvqTZiyA5hlMY4vck+KbQYcROkbgY=;
 b=rv9d/q3MBb3+XU/aNA8ggIe1jaJhGhyVmeVzqZNtV+VXBu3CX7H3vdb/c69eCm+ZLdQNzU
 yUPJ6t5/jmsl7jBg==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <20200930114301.GD816047@nvidia.com>
References: <20200826111628.794979401@linutronix.de>
 <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
 <87v9fvix5f.fsf@nanos.tec.linutronix.de> <20200930114301.GD816047@nvidia.com>
Date: Wed, 30 Sep 2020 17:20:52 +0200
Message-ID: <87k0wbi94b.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org, "K. Y.
 Srinivasan" <kys@microsoft.com>, Dan Williams <dan.j.williams@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 "Dey, Megha" <megha.dey@intel.com>, xen-devel@lists.xenproject.org,
 ravi.v.shankar@intel.com, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

On Wed, Sep 30 2020 at 08:43, Jason Gunthorpe wrote:
> On Wed, Sep 30, 2020 at 08:41:48AM +0200, Thomas Gleixner wrote:
>> On Tue, Sep 29 2020 at 16:03, Megha Dey wrote:
>> > On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
>> >> #9	is obviously just for the folks interested in IMS
>> >>
>> >
>> > I see that the tip tree (as of 9/29) has most of these patches but 
>> > notice that the DEV_MSI related patches
>> >
>> > haven't made it. I have tested the tip tree(x86/irq branch) with your
>> > DEV_MSI infra patches and our IMS patches with the IDXD driver and was
>> 
>> Your IMS patches? Why do you need something special again?
>> 
>> > wondering if we should push out those patches as part of our patchset?
>> 
>> As I don't have any hardware to test that, I was waiting for you and
>> Jason to confirm that this actually works for the two different IMS
>> implementations.
>
> How urgently do you need this? The code looked good from what I
> understood. It will be a while before we have all the parts to send an
> actual patch though.

I personally do not need it at all :) Megha might have different
thoughts... 

> We might be able to put together a mockup just to prove it

If that makes Megha's stuff going that would of course be appreciated,
but we can defer the IMS_QUEUE part for later. It's orthogonal to the
IMS_ARRAY stuff.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
