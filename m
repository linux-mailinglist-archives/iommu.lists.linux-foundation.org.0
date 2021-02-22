Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D3321446
	for <lists.iommu@lfdr.de>; Mon, 22 Feb 2021 11:42:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09B283916;
	Mon, 22 Feb 2021 10:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sctyGgKREyA1; Mon, 22 Feb 2021 10:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD1683918;
	Mon, 22 Feb 2021 10:42:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD7EC0001;
	Mon, 22 Feb 2021 10:42:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29637C0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 10:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 024778708B
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 10:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5EjeznOwUe9 for <iommu@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 10:42:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from angie.orcam.me.uk (angie.orcam.me.uk [157.25.102.26])
 by hemlock.osuosl.org (Postfix) with ESMTP id B923387046
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 10:42:20 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 5983C92009C; Mon, 22 Feb 2021 11:42:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 5002292009B;
 Mon, 22 Feb 2021 11:42:17 +0100 (CET)
Date: Mon, 22 Feb 2021 11:42:17 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <20210222075937.GA21946@lst.de>
Message-ID: <alpine.DEB.2.21.2102221140180.1900@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
 <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
 <20210208161043.GA14083@lst.de>
 <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
 <20210222075937.GA21946@lst.de>
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

On Mon, 22 Feb 2021, Christoph Hellwig wrote:

> > I haven't booted Linux on my Malta for a while now, but it turns out to 
> > work just fine, and your patch set does not regress it booting multi-user 
> > NFS-rooted over FDDI.
> > 
> >  I note however that the system does not reboot properly:
> > 
> > sd 0:0:0:0: [sda] Synchronizing SCSI cache
> > reboot: Restarting system
> > Reboot failed -- System halted
> > 
> > which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
> > does not sign in anymore either:
> 
> Do you mean a regression with this series, or just compared to when you
> last tested?

 When last tested.  Years ago, so nothing for you to be concerned.  I'll 
look into it sometime unless someone beats me to.  Don't hold your breath 
though.  Sorry to be unclear.

  Maciej
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
