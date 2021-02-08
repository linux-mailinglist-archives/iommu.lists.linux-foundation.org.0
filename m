Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905A3138F0
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 17:10:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 184BF1FE32;
	Mon,  8 Feb 2021 16:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iFhxK0RHDse0; Mon,  8 Feb 2021 16:10:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4A9972079A;
	Mon,  8 Feb 2021 16:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44133C013A;
	Mon,  8 Feb 2021 16:10:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5601CC013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4E5F1870B6
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhqhbXB-cZz6 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 16:10:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8EDC2870B5
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 16:10:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0A05D67373; Mon,  8 Feb 2021 17:10:44 +0100 (CET)
Date: Mon, 8 Feb 2021 17:10:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 5/6] driver core: lift dma_default_coherent into common
 code
Message-ID: <20210208161043.GA14083@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-6-hch@lst.de>
 <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102081654060.35623@angie.orcam.me.uk>
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

On Mon, Feb 08, 2021 at 04:57:33PM +0100, Maciej W. Rozycki wrote:
> > diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
> > index e98cc977a735b2..f8c9663e7faa10 100644
> > --- a/arch/mips/mti-malta/malta-setup.c
> > +++ b/arch/mips/mti-malta/malta-setup.c
> > @@ -143,7 +143,7 @@ static void __init plat_setup_iocoherency(void)
> >  			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
> >  	}
> >  
> > -	if (supported)
> > +	if (supported) {
> >  		if (dma_force_noncoherent) {
> >  			pr_info("Hardware DMA cache coherency disabled\n");
> >  			return;
> 
>  I think this has to go with 1/6; otherwise compilation breaks between 
> then and now AFAICT.

Indeed.

>  Do you need to have this verified anyhow?  I only have a non-coherent 5Kc 
> Malta though.

If you get a chance to test this logic, that would be great.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
