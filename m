Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2246135B387
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 13:22:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE5B83376;
	Sun, 11 Apr 2021 11:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVw8naIA3Iux; Sun, 11 Apr 2021 11:22:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D45A483A62;
	Sun, 11 Apr 2021 11:22:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3836C0012;
	Sun, 11 Apr 2021 11:22:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E70DC000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C55A83A5E
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8MTP2OFkbZVi for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 11:22:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B8EC83376
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 11:22:24 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 2C31940D3BFF;
 Sun, 11 Apr 2021 11:22:14 +0000 (UTC)
Date: Sun, 11 Apr 2021 14:22:14 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] iommu/amd: Fix extended features logging
In-Reply-To: <e884200f-55a4-59b5-4311-964e6ddc94d1@molgen.mpg.de>
Message-ID: <alpine.LNX.2.20.13.2104111410340.11104@monopod.intra.ispras.ru>
References: <20210410211152.1938-1-amonakov@ispras.ru>
 <e884200f-55a4-59b5-4311-964e6ddc94d1@molgen.mpg.de>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 LKML <linux-kernel@vger.kernel.org>
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

On Sun, 11 Apr 2021, Paul Menzel wrote:

> > The second line is emitted via 'pr_cont', which causes it to have a
> > different ('warn') loglevel compared to the previous line ('info').
> > 
> > Commit 9a295ff0ffc9 attempted to rectify this by removing the newline
> > from the pci_info format string, but this doesn't work, as pci_info
> > calls implicitly append a newline anyway.
> 
> Hmm, did I really screw that up during my testing? I am sorry about that.
> 
> I tried to wrap my head around, where the newline is implicitly appended, and
> only found the definitions below.
> 
>     include/linux/pci.h:#define pci_info(pdev, fmt, arg...)
> dev_info(&(pdev)->dev, fmt, ##arg)
> 
>     include/linux/dev_printk.h:#define dev_info(dev, fmt, ...)
> \
>     include/linux/dev_printk.h:     _dev_info(dev, dev_fmt(fmt),
> ##__VA_ARGS__)
> 
>     include/linux/dev_printk.h:__printf(2, 3) __cold
>     include/linux/dev_printk.h:void _dev_info(const struct device *dev, const
> char *fmt, ...);
> 
>     include/linux/compiler_attributes.h:#define __printf(a, b)
> __attribute__((__format__(printf, a, b)))

Yeah, it's not obvious: it happens in kernel/printk/printk.c:vprintk_store
where it does

	if (dev_info)
		lflags |= LOG_NEWLINE;

It doesn't seem to be documented; I think it prevents using pr_cont with
"rich" printk facilities that go via _dev_info.

I suspect it quietly changed in commit c313af145b9bc ("printk() - isolate
KERN_CONT users from ordinary complete lines").

> In the discussion *smpboot: CPU numbers printed as warning* [1] John wrote:
> 
> > It is supported to provide loglevels for CONT messages. The loglevel is
> > then only used if the append fails:
> > 
> >     pr_cont(KERN_INFO "message part");
> > 
> > I don't know if we want to go down that path. But it is supported.

Yeah, I saw that, but decided to go with the 'pr_info("")' solution, because
it is less magic, and already used in two other drivers.

pr_info("") will also prepend 'AMD-Vi:' to the feature list, which is nice.

Best regards,
Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
