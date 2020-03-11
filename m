Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D69CC181F41
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 18:23:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9115088E60;
	Wed, 11 Mar 2020 17:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nr5c2L4grTwE; Wed, 11 Mar 2020 17:23:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F55A8937D;
	Wed, 11 Mar 2020 17:23:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56982C0177;
	Wed, 11 Mar 2020 17:23:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 783BFC0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 73DE488A44
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qNTNeLoOl8f for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 17:23:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B68EB88A3F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 17:23:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 41D1068B05; Wed, 11 Mar 2020 18:23:24 +0100 (CET)
Date: Wed, 11 Mar 2020 18:23:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
Message-ID: <20200311172324.GA26483@lst.de>
References: <20200311160710.376090-1-hch@lst.de>
 <20200311161423.GA3941932@kroah.com> <20200311161551.GA24878@lst.de>
 <20200311171802.GA3952198@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311171802.GA3952198@kroah.com>
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

On Wed, Mar 11, 2020 at 06:18:02PM +0100, Greg KH wrote:
> > Sorry, here it is:
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Is this still needed with the patch that Linus just committed to his
> tree?

No.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
