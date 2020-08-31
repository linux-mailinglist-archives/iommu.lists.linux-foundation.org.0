Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D2B257411
	for <lists.iommu@lfdr.de>; Mon, 31 Aug 2020 09:10:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 293958328C;
	Mon, 31 Aug 2020 07:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 860K9smf6XYj; Mon, 31 Aug 2020 07:10:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9429A85ADB;
	Mon, 31 Aug 2020 07:10:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 769F6C0051;
	Mon, 31 Aug 2020 07:10:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82923C0051
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 07:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 67F58852F8
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 07:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6nlqtyysBTF for <iommu@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 07:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B24C80BFE
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 07:10:51 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598857848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FARkIRHO1KDuZXY7+kAUc27scL3+jsSFrhOHhYco6Ck=;
 b=pVbGWHzCvbWtavZwE6dhNWXXFxRvilaTtx/laCggTx6McaidMopyu70dd6qN+DpOrvAnEC
 NWQgdTQEqPmTBErfzcv7KTN6E0s/wQHPlfGpQ6LHCLL7knvkvL+Z5EcRMLvdnnyIAZvOc7
 84eFvvaBgqdRh7b6uzJquG6SPUe/5E+2ILpbUF8XQOPYlIKERkhRt0JaVx8y2wLuw/UPVO
 kEYld38+pX8ynofoU0FC9wqE9Xmm4dgEmq8kJrFYuRUPGhZyPmASXHI3qXoTZox/n6FuHy
 WCA7m+B+DJitbQdaThrzVyKrqpDiD0aKyw6+VhHkpAd2LQiXdvrgCHi8IimDMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598857848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FARkIRHO1KDuZXY7+kAUc27scL3+jsSFrhOHhYco6Ck=;
 b=OmZcAy4Z777Iii/2G+bD5e+zVYJ16Fc1fbiIYma87KnA7XicfNHL1pplQOk/GUXLOURqWN
 xldvJovtQWy7NhBg==
To: Lu Baolu <baolu.lu@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <02e30654-714b-520a-0d20-fca20794df93@linux.intel.com>
References: <20200826111628.794979401@linutronix.de>
 <02e30654-714b-520a-0d20-fca20794df93@linux.intel.com>
Date: Mon, 31 Aug 2020 09:10:47 +0200
Message-ID: <87pn77i93c.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org, "K. Y.
 Srinivasan" <kys@microsoft.com>, Dan Williams <dan.j.williams@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Jacob Pan <jacob.jun.pan@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Mon, Aug 31 2020 at 08:51, Lu Baolu wrote:
> On 8/26/20 7:16 PM, Thomas Gleixner wrote:
>> This is the second version of providing a base to support device MSI (non
>> PCI based) and on top of that support for IMS (Interrupt Message Storm)
>> based devices in a halfways architecture independent way.
>
> After applying this patch series, the dmar_alloc_hwirq() helper doesn't
> work anymore during boot. This causes the IOMMU driver to fail to
> register the DMA fault handler and abort the IOMMU probe processing.
> Is this a known issue?

See replies to patch 15/46 or pull the git tree. It has the issue fixed.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
