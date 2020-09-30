Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E929E27E168
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 08:41:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9794986054;
	Wed, 30 Sep 2020 06:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOvV9vupfkHw; Wed, 30 Sep 2020 06:41:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E94386031;
	Wed, 30 Sep 2020 06:41:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2156BC0051;
	Wed, 30 Sep 2020 06:41:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41D0AC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 294B020422
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqGCuFrliv2f for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 06:41:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 088BD203EE
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 06:41:52 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601448108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJKrDPg1zMcLHTJ9psmGJPskafubkx5uuA4rv00RWvE=;
 b=3b6vWZ3FYwgK0uGd/jHNKkzf932WR9YVcHqnMSL9hHtR4FHsBZC07JwnVnqMJT9Jed2laM
 sOmj+DtePTxNt1wmjH5DZ6o2s5opDsc8D9ifXyqbFVzXOdAfouLp4tTZLVGyMM1xzNgVNF
 SiFdV8l6tmYAgTktBPpm/Iadr8yO4O7oHnUbbnOIztDfkFXFDnrym1ArBAMUmD2E46aShM
 CD+CVsD5I4NZ1O1jmOVTRGe6+5R2FDp5MP/BP/FjqJPOUfRmKvz3lfIp+HuQ1y5Tb6Yo6V
 QtpSVxjdk4qgFUFhEUdh5DLZfdeQVjrBT9YrrBtUq7PiKVvMzZoW945MxWorVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601448108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EJKrDPg1zMcLHTJ9psmGJPskafubkx5uuA4rv00RWvE=;
 b=4oScqGVN58GGowfuDE4TlRtr/G0yJIGU+gi/diGlZDZu0wervLchyWESUEEFxWNHdARjHI
 QIrbJgszY1bnCuAA==
To: "Dey\, Megha" <megha.dey@intel.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
In-Reply-To: <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
References: <20200826111628.794979401@linutronix.de>
 <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
Date: Wed, 30 Sep 2020 08:41:48 +0200
Message-ID: <87v9fvix5f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org, "K. Y.
 Srinivasan" <kys@microsoft.com>, Dan Williams <dan.j.williams@intel.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Baolu Lu <baolu.lu@intel.com>, Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, xen-devel@lists.xenproject.org,
 ravi.v.shankar@intel.com, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, dave.jiang@intel.com,
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

On Tue, Sep 29 2020 at 16:03, Megha Dey wrote:
> On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
>> #9	is obviously just for the folks interested in IMS
>>
>
> I see that the tip tree (as of 9/29) has most of these patches but 
> notice that the DEV_MSI related patches
>
> haven't made it. I have tested the tip tree(x86/irq branch) with your
> DEV_MSI infra patches and our IMS patches with the IDXD driver and was

Your IMS patches? Why do you need something special again?

> wondering if we should push out those patches as part of our patchset?

As I don't have any hardware to test that, I was waiting for you and
Jason to confirm that this actually works for the two different IMS
implementations.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
