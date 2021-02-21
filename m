Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3E32082A
	for <lists.iommu@lfdr.de>; Sun, 21 Feb 2021 04:32:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5AB6F504
	for <lists.iommu@lfdr.de>; Sun, 21 Feb 2021 03:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kT_G5H3h2skh for <lists.iommu@lfdr.de>;
	Sun, 21 Feb 2021 03:32:47 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 79CA16F507; Sun, 21 Feb 2021 03:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B1AE6F49F;
	Sun, 21 Feb 2021 03:32:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6087BC0012;
	Sun, 21 Feb 2021 03:32:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07B41C0001
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E0E43870E9
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lbdo5zWRi5wY for <iommu@lists.linux-foundation.org>;
 Sun, 21 Feb 2021 03:32:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from angie.orcam.me.uk (angie.orcam.me.uk [157.25.102.26])
 by hemlock.osuosl.org (Postfix) with ESMTP id 91D228712E
 for <iommu@lists.linux-foundation.org>; Sun, 21 Feb 2021 03:32:40 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 87AEC92009C; Sun, 21 Feb 2021 04:32:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 7D0A092009B;
 Sun, 21 Feb 2021 04:32:38 +0100 (CET)
Date: Sun, 21 Feb 2021 04:32:38 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
 <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
 <20210208161043.GA14083@lst.de>
 <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Mon, 15 Feb 2021, Maciej W. Rozycki wrote:

>  I hope to have the adapter properly fixed soon and I'll look at the Malta 
> side now, possibly using the old server whose DEFPA has worked flawlessly 
> for some 20 years now.  I have planned to use the interface to supply NFS 
> root, which I think should be enough of a stress test.

 Card reworked now and network wired, so using the new server actually.  
I haven't booted Linux on my Malta for a while now, but it turns out to 
work just fine, and your patch set does not regress it booting multi-user 
NFS-rooted over FDDI.

 I note however that the system does not reboot properly:

sd 0:0:0:0: [sda] Synchronizing SCSI cache
reboot: Restarting system
Reboot failed -- System halted

which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
does not sign in anymore either:

Serial: 8250/16550 driver, 5 ports, IRQ sharing enabled
printk: console [ttyS0] disabled
serial8250.0: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
printk: console [ttyS0] enabled
printk: console [ttyS0] enabled
printk: bootconsole [uart8250] disabled
printk: bootconsole [uart8250] disabled
serial8250.0: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A

while long ago:

Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS28 at 0x03f8 (irq = 4) is a 16550A
ttyS29 at 0x02f8 (irq = 3) is a 16550A
ttyS30 at 0x0000 (irq = 20) is a 16550

(I don't know why the line numbers reported were so odd back then, but the 
standard character device major:minor numbers for ttyS0-2 just worked), so 
there's probably something wrong with platform device registration.  ISTR 
using the CBUS UART as a console device at one point too.

  Maciej
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
