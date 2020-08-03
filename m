Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE9239FB3
	for <lists.iommu@lfdr.de>; Mon,  3 Aug 2020 08:44:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC02185C92;
	Mon,  3 Aug 2020 06:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTkf99PnBw7z; Mon,  3 Aug 2020 06:44:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E39498511B;
	Mon,  3 Aug 2020 06:44:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CDDEAC088E;
	Mon,  3 Aug 2020 06:44:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA31EC004C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 06:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C29B6877B1
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 06:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2etKG-An6sr8 for <iommu@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 06:44:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F9488777C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 06:44:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A655E68CFC; Mon,  3 Aug 2020 08:44:38 +0200 (CEST)
Date: Mon, 3 Aug 2020 08:44:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: revert scope for 5.8, was Re: dma-pool fixes
Message-ID: <20200803064438.GA19014@lst.de>
References: <CAMi1Hd09EbzOgTU5P4EDS8BQ6J2jFntvyR49BePyAqJ15DBB0Q@mail.gmail.com>
 <20200731130903.GA31110@lst.de>
 <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
 <alpine.DEB.2.23.453.2008010105560.4078406@chino.kir.corp.google.com>
 <20200801085706.GA2991@lst.de>
 <CAMi1Hd2tCfbDUuBP=OKoG8fPVCTpiARmqrkPadEJjJ52fgc_-Q@mail.gmail.com>
 <20200801173952.GA15542@lst.de>
 <CAMi1Hd3wU3pH4dfxcxqKfWmLWxPXD--4hkYC+VQywwQn1mokMg@mail.gmail.com>
 <CAMi1Hd2MLYx_NkXug+Ow7qFn+tzkMFQy_u0iF_-J6amnXZhckA@mail.gmail.com>
 <alpine.DEB.2.23.453.2008022109280.483838@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2008022109280.483838@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 iommu <iommu@lists.linux-foundation.org>, jeremy.linton@arm.com,
 Caleb Connolly <caleb@connolly.tech>, linux-rpi-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Sun, Aug 02, 2020 at 09:14:41PM -0700, David Rientjes wrote:
> Christoph: since we have atomic DMA coherent pools in 5.8 now, recall our 
> previous discussions, including Greg KH, regarding backports to stable 
> trees (we are interested in 5.4 and 5.6) of this support for the purposes 
> of confidential VM users who wish to run their own SEV-enabled guests in 
> cloud.
> 
> Would you have any objections to backports being offered for this support 
> now?  We can prepare them immediately.  Or, if you would prefer we hold 
> off for a while, please let me know and we can delay it until you are more 
> comfortable.  (For confidential VM users, the ability to run your own 
> unmodified stable kernel is a much different security story than a guest 
> modified by the cloud provider.)

Before we start backporting I think we need the two fixes from
the "dma pool fixes" series.  Can you start reviewing them?  I also
think we should probably wait at least until -rc2 for any fallout
before starting the backport.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
