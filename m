Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802026F552
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 07:10:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 08575876F2;
	Fri, 18 Sep 2020 05:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4fxs5ljxjzS; Fri, 18 Sep 2020 05:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 34D4A87770;
	Fri, 18 Sep 2020 05:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E5A2C0051;
	Fri, 18 Sep 2020 05:10:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70E30C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 05:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 625A6204CE
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 05:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JITxJq36QF5I for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 05:10:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id ECF7C20432
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 05:10:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9FD6A68B02; Fri, 18 Sep 2020 07:10:30 +0200 (CEST)
Date: Fri, 18 Sep 2020 07:10:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/4] ARM/dma-mapping: don't handle NULL devices in
 dma-direct.h
Message-ID: <20200918051030.GA21261@lst.de>
References: <20200917173229.3311382-1-hch@lst.de>
 <20200917173229.3311382-4-hch@lst.de>
 <20200917185009.GB1559@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917185009.GB1559@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-omap@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Sep 17, 2020 at 07:50:10PM +0100, Russell King - ARM Linux admin wrote:
> On Thu, Sep 17, 2020 at 07:32:28PM +0200, Christoph Hellwig wrote:
> > The DMA API removed support for not passing in a device a long time
> > ago, so remove the NULL checks.
> 
> What happens with ISA devices?

For actual drivers they've been switched to struct isa_driver, which
provides a struct device.  For some of the special case like the
arch/arm/kernel/dma-isa.c we now use static struct device instances.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
