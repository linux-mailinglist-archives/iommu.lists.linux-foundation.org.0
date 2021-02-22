Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22E3211AE
	for <lists.iommu@lfdr.de>; Mon, 22 Feb 2021 08:59:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6176F530;
	Mon, 22 Feb 2021 07:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8mFSACgEFhM; Mon, 22 Feb 2021 07:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8436F536;
	Mon, 22 Feb 2021 07:59:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2A5C000A;
	Mon, 22 Feb 2021 07:59:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6DC9C0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 07:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEED48382D
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 07:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CXlCn32V4_Uk for <iommu@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 07:59:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9153C8381F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 07:59:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 69F6168D0A; Mon, 22 Feb 2021 08:59:38 +0100 (CET)
Date: Mon, 22 Feb 2021 08:59:37 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210222075937.GA21946@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
 <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
 <20210208161043.GA14083@lst.de>
 <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102151342050.1521@angie.orcam.me.uk>
 <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102210407090.2021@angie.orcam.me.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
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

On Sun, Feb 21, 2021 at 04:32:38AM +0100, Maciej W. Rozycki wrote:
> I haven't booted Linux on my Malta for a while now, but it turns out to 
> work just fine, and your patch set does not regress it booting multi-user 
> NFS-rooted over FDDI.
> 
>  I note however that the system does not reboot properly:
> 
> sd 0:0:0:0: [sda] Synchronizing SCSI cache
> reboot: Restarting system
> Reboot failed -- System halted
> 
> which is a regression, and also the MMIO-mapped discrete CBUS UART (ttyS2) 
> does not sign in anymore either:

Do you mean a regression with this series, or just compared to when you
last tested?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
