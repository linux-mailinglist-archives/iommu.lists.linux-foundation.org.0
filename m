Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8F181D8C
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:15:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DF68620403;
	Wed, 11 Mar 2020 16:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2YaUIJDQVgo; Wed, 11 Mar 2020 16:15:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 438E82094D;
	Wed, 11 Mar 2020 16:15:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 301A7C0177;
	Wed, 11 Mar 2020 16:15:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38C94C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 27749876D7
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQGM9ReMfsM1 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:15:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7C1728757F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B1DE468C65; Wed, 11 Mar 2020 17:15:51 +0100 (CET)
Date: Wed, 11 Mar 2020 17:15:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
Message-ID: <20200311161551.GA24878@lst.de>
References: <20200311160710.376090-1-hch@lst.de>
 <20200311161423.GA3941932@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311161423.GA3941932@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: aros@gmx.com, torvalds@linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Wed, Mar 11, 2020 at 05:14:23PM +0100, Greg KH wrote:
> On Wed, Mar 11, 2020 at 05:07:10PM +0100, Christoph Hellwig wrote:
> > Ever since the generic platform device code started allocating DMA masks
> > itself the code to allocate and leak a private DMA mask in
> > platform_device_register_full has been superflous.  More so the fact that
> > it unconditionally frees the DMA mask allocation in the failure path
> > can lead to slab corruption if the function fails later on for a device
> > where it didn't allocate the mask.  Just remove the offending code.
> > 
> > Fixes: cdfee5623290 ("driver core: initialize a default DMA mask for platform device")
> > Reported-by: Artem S. Tashkinov <aros@gmx.com>
> > Tested-by: Artem S. Tashkinov <aros@gmx.com>
> 
> No s-o-b from you?  :(
> 
> I can take this, or Linus, you can take this now if you want to as well:

Sorry, here it is:

Signed-off-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
