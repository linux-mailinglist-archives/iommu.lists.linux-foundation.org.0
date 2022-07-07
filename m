Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 294B4569C6B
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 10:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E674198D;
	Thu,  7 Jul 2022 08:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E674198D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GAgMo0gS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ki9vm6OBroKj; Thu,  7 Jul 2022 08:06:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1C28E4194A;
	Thu,  7 Jul 2022 08:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C28E4194A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB3A6C0077;
	Thu,  7 Jul 2022 08:06:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60B19C002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1B24023B
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1B24023B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=GAgMo0gS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfIS_Ghe97sL for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 08:06:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E07F4013E
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E07F4013E
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:06:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ADB361EB5
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D876DC341D4
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 08:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657181161;
 bh=sfmXV4tMP+5FC7d+XgMFdRmfqhgCRC6kI6KR1vW5czg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GAgMo0gS3gmNmDLrfo5hXZRhjDRnB0z6u0nQIlAHcNkUohsekUOT0arnNzkJk0PeJ
 kiqvBbCCzpBZL91oWmRGYLhpwDY11jb6Z0rq5NZLwG8Hxv5Kwiw15K/zqV4hWGP/Ta
 zxi3FIh5nbchm9t1YsRRUpPMK76SGBxSxqqqPZUGzp6nBJk9OwL5Y8aXFWn8NohlQb
 X4Ih/hMPHwvhp6nrcI8M1tIMm3zt2XpD/4IXyn7659xU16Fb6aIhppwPfVhWqnlFIK
 di8tTm83tOh09lNCQWY33uWGXxYdoYSNS/knPLKbFV5MUb1ypI/CG6QUgImE7U+hWb
 mgNcvFDiEyjNA==
Received: by mail-yb1-f177.google.com with SMTP id f73so407894yba.10
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 01:06:01 -0700 (PDT)
X-Gm-Message-State: AJIora9vpGHXA9nSdr/MV1+a7CHKFvUVR/GcmO3retJWlS3AcvNsbQx8
 7M/fdOuryVMM+slH29rR55v2fScaoXlfEwym6vM=
X-Google-Smtp-Source: AGRyM1vWsB1m06E0i839p0o7wq8aG5nv0UEyiO+bhht+9D2f833cmH7AafXMl6w9gYbck24GPqPDrwirxb/5d2EjiFU=
X-Received: by 2002:a25:9f87:0:b0:669:4345:a8c0 with SMTP id
 u7-20020a259f87000000b006694345a8c0mr48554733ybq.472.1657181160664; Thu, 07
 Jul 2022 01:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220614092047.572235-1-hch@lst.de>
 <20220629062837.GA17140@lst.de>
 <Yrv0HLSj3xAHa+av@kroah.com> <20220707045840.GA12672@lst.de>
In-Reply-To: <20220707045840.GA12672@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 7 Jul 2022 10:05:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VFhruH=DVLtL7u5JhH9ayCxrKyNb23qsAR4JBLvrD4Q@mail.gmail.com>
Message-ID: <CAK8P3a1VFhruH=DVLtL7u5JhH9ayCxrKyNb23qsAR4JBLvrD4Q@mail.gmail.com>
Subject: Re: fully convert arm to use dma-direct v3
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Andre Przywara <andre.przywara@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Thu, Jul 7, 2022 at 6:58 AM Christoph Hellwig <hch@lst.de> wrote:
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

Yes, please do!

Getting it into linux-next now should give plenty of time to test it
with the automated kernelci and lkft systems, as well as Russell's
Assabet. I'm sure we can fix up any regressions before this actually
hits the 5.20 release.

         Arnd
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
