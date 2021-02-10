Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F584316199
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 09:57:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 936536F4C5
	for <lists.iommu@lfdr.de>; Wed, 10 Feb 2021 08:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJGxLTXxn925 for <lists.iommu@lfdr.de>;
	Wed, 10 Feb 2021 08:57:39 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id A0AB36F515; Wed, 10 Feb 2021 08:57:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32296F4C5;
	Wed, 10 Feb 2021 08:57:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 868C5C013A;
	Wed, 10 Feb 2021 08:57:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CE83C013A
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 08:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BA66F4B9
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 08:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dj0XXrTjas_m for <iommu@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 08:57:31 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 50FEF6F4E9; Wed, 10 Feb 2021 08:57:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C52AE6F4B9
 for <iommu@lists.linux-foundation.org>; Wed, 10 Feb 2021 08:57:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 37B6B6736F; Wed, 10 Feb 2021 09:57:25 +0100 (CET)
Date: Wed, 10 Feb 2021 09:57:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 4/6] MIPS: refactor the maybe coherent DMA indicators
Message-ID: <20210210085724.GA24610@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
 <20210208145024.3320420-5-hch@lst.de>
 <20210209131237.GB11915@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209131237.GB11915@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
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

On Tue, Feb 09, 2021 at 02:12:37PM +0100, Thomas Bogendoerfer wrote:
> > +#ifdef CONFIG_DMA_MAYBE_COHERENT
> > +extern bool dma_default_coherent;
> >  static inline bool dev_is_dma_coherent(struct device *dev)
> >  {
> > -	return coherentio == IO_COHERENCE_ENABLED ||
> > -		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio);
> > +	return dma_default_coherent;
> 
> this breaks overriding of coherentio via command line. plat_mem_setup/
> plat_setup_iocoherency is called before earlyparams are handled. So
> changing coherentio after that doesn't have any effect.

Hmm.  In that case a manual override does actually work for alchemy,
as that initializes coherentio from plat_mem_setup().  But the
elaborate sanity checking that malta performs in plat_setup_iocoherency
is rather pointless then, as coherentio will always be set to
IO_COHERENCE_DISABLED at this point.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
