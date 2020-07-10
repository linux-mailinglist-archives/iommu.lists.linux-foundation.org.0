Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE821AFBE
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 08:51:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C9DF2896D9;
	Fri, 10 Jul 2020 06:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSRP4Ak4VMgJ; Fri, 10 Jul 2020 06:51:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D78C089619;
	Fri, 10 Jul 2020 06:51:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B11E0C016F;
	Fri, 10 Jul 2020 06:51:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BCB4C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 06:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 52CB8884B6
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 06:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DiVygZL4L_K for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 06:51:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DEF0286B60
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 06:50:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1999E68BEB; Fri, 10 Jul 2020 08:50:55 +0200 (CEST)
Date: Fri, 10 Jul 2020 08:50:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 2/4] dma-pool: Get rid of dma_in_atomic_pool()
Message-ID: <20200710065054.GA19416@lst.de>
References: <20200709161903.26229-1-nsaenzjulienne@suse.de>
 <20200709161903.26229-3-nsaenzjulienne@suse.de>
 <alpine.DEB.2.23.453.2007091449540.972523@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.23.453.2007091449540.972523@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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

On Thu, Jul 09, 2020 at 02:51:13PM -0700, David Rientjes wrote:
> On Thu, 9 Jul 2020, Nicolas Saenz Julienne wrote:
> 
> > The function is only used once and can be simplified to a one-liner.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> 
> I'll leave this one to Christoph to decide on.  One thing I really liked 
> about hacking around in kernel/dma is the coding style, it really follows 
> "one function does one thing and does it well" even if there is only one 
> caller.  dma_in_atomic_pool() was an attempt to follow in those footsteps.

While I like the helper aswell, I don't see how it could work nicely
with the changes in patch 4.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
