Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663920CD2E
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 10:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95DFC887CA;
	Mon, 29 Jun 2020 08:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qecRSnhVcNFz; Mon, 29 Jun 2020 08:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DEF19887C6;
	Mon, 29 Jun 2020 08:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C18DAC016E;
	Mon, 29 Jun 2020 08:13:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A545C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 08:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 737D38937D
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 08:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzfw+NclGyeC for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 08:13:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 463E88937B
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 08:13:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 335C268B05; Mon, 29 Jun 2020 10:12:56 +0200 (CEST)
Date: Mon, 29 Jun 2020 10:12:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] dma-pool: Fix too large DMA pools on medium systems
Message-ID: <20200629081255.GA32155@lst.de>
References: <20200608132217.29945-1-geert@linux-m68k.org>
 <20200620200936.GA106151@roeck-us.net> <20200624073815.GE18609@lst.de>
 <6473db8e-4116-c994-aa08-6b50a6c609fb@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6473db8e-4116-c994-aa08-6b50a6c609fb@wanadoo.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
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

On Sat, Jun 27, 2020 at 06:13:43PM +0200, Marion & Christophe JAILLET wrote:
> I'm sorry, but I will not send pci_ --> dma_ conversion for this driver.
> I'm a bit puzzled by some choice of GFP_KERNEL and GFP_ATOMIC that not all 
> that obvious to me.
>
> I'll try to send some patches for other easier drivers in the coming weeks.

No problem, I sent a patch for the conversion of the allocations that
caused problems.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
