Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 845CA56999C
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 06:58:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98D5F40867;
	Thu,  7 Jul 2022 04:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98D5F40867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2N4sj4FG5-O; Thu,  7 Jul 2022 04:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3286F418D2;
	Thu,  7 Jul 2022 04:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3286F418D2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1832C0077;
	Thu,  7 Jul 2022 04:58:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C775C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 04:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69BAE81491
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 04:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69BAE81491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUzdrf6dqUmd for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 04:58:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58E4B8148E
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58E4B8148E
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 04:58:47 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 27FFD68AA6; Thu,  7 Jul 2022 06:58:41 +0200 (CEST)
Date: Thu, 7 Jul 2022 06:58:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: fully convert arm to use dma-direct v3
Message-ID: <20220707045840.GA12672@lst.de>
References: <20220614092047.572235-1-hch@lst.de>
 <20220629062837.GA17140@lst.de> <Yrv0HLSj3xAHa+av@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yrv0HLSj3xAHa+av@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
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

On Wed, Jun 29, 2022 at 08:41:32AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 29, 2022 at 08:28:37AM +0200, Christoph Hellwig wrote:
> > Any comments or additional testing?  It would be really great to get
> > this off the table.
> 
> For the USB bits:
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

So given that we're not making any progress on getting anyone interested
on the series, I'm tempted to just pull it into the dma-mapping tree
this weekend so that we'll finally have all architectures using the
common code.

Anyone who has real concerns, please scream now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
