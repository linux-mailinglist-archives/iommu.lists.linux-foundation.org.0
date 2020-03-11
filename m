Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EE181F12
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 18:18:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A784085D17;
	Wed, 11 Mar 2020 17:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pn0sHAkWv5YQ; Wed, 11 Mar 2020 17:18:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3612785B3B;
	Wed, 11 Mar 2020 17:18:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21825C0177;
	Wed, 11 Mar 2020 17:18:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57A44C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 42B5A85B3B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yj9EMXrKzH0k for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:18:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C7B6585B2F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:18:04 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB58220736;
 Wed, 11 Mar 2020 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583947085;
 bh=kSRd2vWUlnNIgg7VJGv6T4EyBaZG9+3GbIsDwtJPOLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XYKE+mrP7iqEs6IES9OU+6rgpsZQLgvsE9pMapPflmYEkyJlu5B/q4lmRuaHdzrSN
 QW0bR/ChigYgeV+OEjJikRzsPQeWiozwOykBkHi2JNMAeqM55nPdb5FZpuQYtn5eJE
 OYEEDpNCabuyYlp2uRw/fDRfmA9He3pw7ky+tx5s=
Date: Wed, 11 Mar 2020 18:18:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
Message-ID: <20200311171802.GA3952198@kroah.com>
References: <20200311160710.376090-1-hch@lst.de>
 <20200311161423.GA3941932@kroah.com>
 <20200311161551.GA24878@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311161551.GA24878@lst.de>
Cc: aros@gmx.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On Wed, Mar 11, 2020 at 05:15:51PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 11, 2020 at 05:14:23PM +0100, Greg KH wrote:
> > On Wed, Mar 11, 2020 at 05:07:10PM +0100, Christoph Hellwig wrote:
> > > Ever since the generic platform device code started allocating DMA masks
> > > itself the code to allocate and leak a private DMA mask in
> > > platform_device_register_full has been superflous.  More so the fact that
> > > it unconditionally frees the DMA mask allocation in the failure path
> > > can lead to slab corruption if the function fails later on for a device
> > > where it didn't allocate the mask.  Just remove the offending code.
> > > 
> > > Fixes: cdfee5623290 ("driver core: initialize a default DMA mask for platform device")
> > > Reported-by: Artem S. Tashkinov <aros@gmx.com>
> > > Tested-by: Artem S. Tashkinov <aros@gmx.com>
> > 
> > No s-o-b from you?  :(
> > 
> > I can take this, or Linus, you can take this now if you want to as well:
> 
> Sorry, here it is:
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Is this still needed with the patch that Linus just committed to his
tree?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
