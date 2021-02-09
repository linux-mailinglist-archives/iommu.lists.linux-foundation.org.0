Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB216314E26
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 12:23:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76BB36F892
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 11:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCT9jgP_LVtm for <lists.iommu@lfdr.de>;
	Tue,  9 Feb 2021 11:23:33 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 82E7D6F492; Tue,  9 Feb 2021 11:23:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79DF86F5DB;
	Tue,  9 Feb 2021 11:23:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E7A2C013A;
	Tue,  9 Feb 2021 11:23:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1833C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 11:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A1A4C870A8
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 11:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLN9AnS8els8 for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 11:23:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from angie.orcam.me.uk (angie.orcam.me.uk [157.25.102.26])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D28D86E6E
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 11:23:15 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 053939200B4; Tue,  9 Feb 2021 12:23:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id F37559200B3;
 Tue,  9 Feb 2021 12:23:11 +0100 (CET)
Date: Tue, 9 Feb 2021 12:23:11 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
In-Reply-To: <20210208161043.GA14083@lst.de>
Message-ID: <alpine.DEB.2.21.2102091213070.35623@angie.orcam.me.uk>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
 <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
 <20210208161043.GA14083@lst.de>
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

On Mon, 8 Feb 2021, Christoph Hellwig wrote:

> >  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> > Malta though.
> 
> If you get a chance to test this logic, that would be great.

 I'll try to give it a hit in the next few days then.  Installed in my 
Malta I have a DEFPA, which is about as serious a DMA user as a piece of 
classic PCI hardware could be.  I need to debug the issue of another DEFPA 
not working with my POWER9 system, possibly due to an IOMMU handling bug 
(hopefully not broken host hardware), so I'll take the opportunity and do 
it all at once.

  Maciej
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
