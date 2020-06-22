Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6A203DF4
	for <lists.iommu@lfdr.de>; Mon, 22 Jun 2020 19:31:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C79B58919B;
	Mon, 22 Jun 2020 17:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cL6ropR4v2vM; Mon, 22 Jun 2020 17:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F5038918B;
	Mon, 22 Jun 2020 17:31:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9E5EC016F;
	Mon, 22 Jun 2020 17:31:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F24AC016F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 17:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 04D2720348
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 17:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdBWg4PG10-H for <iommu@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 17:31:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A1DB20022
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 17:31:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CC32B68AEF; Mon, 22 Jun 2020 19:31:46 +0200 (CEST)
Date: Mon, 22 Jun 2020 19:31:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] dma-pool: Fix too large DMA pools on medium systems
Message-ID: <20200622173146.GA15796@lst.de>
References: <20200608132217.29945-1-geert@linux-m68k.org>
 <20200620200936.GA106151@roeck-us.net>
 <CAMuHMdX3mBDm9iHk+jhbGfmo+dbix=3tp5z2ewyddWxM1tdqGQ@mail.gmail.com>
 <c0889f5c-34ae-2314-6530-a9240e0901f2@roeck-us.net>
 <alpine.DEB.2.22.394.2006211308500.195301@chino.kir.corp.google.com>
 <1287bffd-3363-0764-0309-32222b2b8c9a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1287bffd-3363-0764-0309-32222b2b8c9a@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Rientjes <rientjes@google.com>, Christoph Hellwig <hch@lst.de>,
 Guenter Roeck <linux@roeck-us.net>
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

On Mon, Jun 22, 2020 at 05:07:55PM +0100, Robin Murphy wrote:
> Another angle, though, is to question why this driver is making such a 
> large allocation with GFP_ATOMIC in the first place. At a glance it looks 
> like there's no reason at all other than that it's still using the legacy 
> pci_alloc_consistent() API, since every path to that appears to have 
> CAN_SLEEP passed as its flag - modernising that would arguably be an even 
> better long-term win.

Maybe we can just try that for now?  If other problems show up we
can still increase the initial pool size later in this cycle.

I'll try to cook up a patch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
