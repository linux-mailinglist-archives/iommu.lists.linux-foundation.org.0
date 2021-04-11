Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1C35B6E4
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 22:44:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACFBA6065C;
	Sun, 11 Apr 2021 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wx4k3aJ-r-RK; Sun, 11 Apr 2021 20:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C89E6064C;
	Sun, 11 Apr 2021 20:44:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0780BC000A;
	Sun, 11 Apr 2021 20:44:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9EA1C000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C13356065C
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 20:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_XGfYg-4_y1 for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 20:44:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD9E16064C
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 20:44:03 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 1A99340D3BFF;
 Sun, 11 Apr 2021 20:43:53 +0000 (UTC)
Date: Sun, 11 Apr 2021 23:43:53 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] iommu/amd: Fix extended features logging
In-Reply-To: <87o8ekioo4.fsf@jogness.linutronix.de>
Message-ID: <alpine.LNX.2.20.13.2104112326460.11104@monopod.intra.ispras.ru>
References: <20210410211152.1938-1-amonakov@ispras.ru>
 <e884200f-55a4-59b5-4311-964e6ddc94d1@molgen.mpg.de>
 <alpine.LNX.2.20.13.2104111410340.11104@monopod.intra.ispras.ru>
 <87o8ekioo4.fsf@jogness.linutronix.de>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Joerg Roedel <jroedel@suse.de>,
 Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, Joe Perches <joe@perches.com>
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

On Sun, 11 Apr 2021, John Ogness wrote:

> > pr_info("") will also prepend 'AMD-Vi:' to the feature list, which is
> > nice.
> 
> I'd rather fix dev_info callers to allow pr_cont and then fix any code
> that is using this workaround.

Note that existing two users of pr_info("") that I found are not using that
as a workaround: efi.c is using that when it announced a list of EFI tables:

efi: ACPI=0xadffe000 ACPI 2.0=0xadffe014 TPMFinalLog=0xadf2d000 ESRT=0xab70d618 SMBIOS=0xab70b000 SMBIOS 3.0=0xab709000 RNG=0xab707b98 TPMEventLog=0x9602c018

and uvesafb.c similarly uses it to print a list of conditionally-present
strings. In both cases it is really a standalone message, not a continuation
for something previously printed.

In contrast, my patch deals with a continuation line. I wouldn't really like
the decoded feature list to appear on the same line as the previous message,
because it would end up quite long:

[    0.266332] pci 0000:00:00.2: AMD-Vi: Extended features (0x206d73ef22254ade):
[    0.266334] AMD-Vi:  PPR X2APIC NX GT IA GA PC GA_vAPIC

I think a good compromise is to change the first line from pci_info to pr_info,
losing the pci bus address. I'll send a v2.

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
