Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8350B569CAE
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 10:09:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F50883409;
	Thu,  7 Jul 2022 08:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F50883409
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bQhnK1KE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMizZAQWUwG6; Thu,  7 Jul 2022 08:09:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 35BDA83EBD;
	Thu,  7 Jul 2022 08:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BDA83EBD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10405C007D;
	Thu,  7 Jul 2022 08:09:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4649BC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12EAA40C8B
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12EAA40C8B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=bQhnK1KE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxB0WIuDvkGx for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 08:09:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 705A340C85
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 705A340C85
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:09:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B483F61EFE;
 Thu,  7 Jul 2022 08:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037BBC341CF;
 Thu,  7 Jul 2022 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657181369;
 bh=vpVtewxY4/wedaaT/1GGlBycY026cAD5naxa3pWaPTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQhnK1KEzTmujTim2Q65duWMHpbCJ8Q+cLzs5MTsotRv47C2S75HDOMqlA5bbdgNf
 9LldUwMLIkTu+1uPVuGuJV09KvApakAEP6ZEqgu7wJvwfF0nBkcxm/ai2J4a4MzSbt
 HJ83dnFP6ZpSzzj8RExcazmKgov7BlI8E9PaLcW8=
Date: Thu, 7 Jul 2022 10:09:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: fully convert arm to use dma-direct v3
Message-ID: <YsaUtzVsobF1WNVI@kroah.com>
References: <20220614092047.572235-1-hch@lst.de>
 <20220629062837.GA17140@lst.de> <Yrv0HLSj3xAHa+av@kroah.com>
 <20220707045840.GA12672@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707045840.GA12672@lst.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
 Robin Murphy <robin.murphy@arm.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
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

On Thu, Jul 07, 2022 at 06:58:40AM +0200, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 08:41:32AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jun 29, 2022 at 08:28:37AM +0200, Christoph Hellwig wrote:
> > > Any comments or additional testing?  It would be really great to get
> > > this off the table.
> > 
> > For the USB bits:
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> So given that we're not making any progress on getting anyone interested
> on the series, I'm tempted to just pull it into the dma-mapping tree
> this weekend so that we'll finally have all architectures using the
> common code.
> 
> Anyone who has real concerns, please scream now.

Sounds like a good plan to me, pull it in and let's see if anyone even
notices.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
