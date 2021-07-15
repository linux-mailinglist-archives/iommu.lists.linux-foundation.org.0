Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 386123CA37C
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 19:00:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FBF942211;
	Thu, 15 Jul 2021 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wsids2dPmZ2H; Thu, 15 Jul 2021 17:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DC7F342238;
	Thu, 15 Jul 2021 17:00:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C40A7C001F;
	Thu, 15 Jul 2021 17:00:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2B0FC000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED76401C8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEoCnuUn-aXZ for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 17:00:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62A5640164
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 17:00:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D5DD667373; Thu, 15 Jul 2021 19:00:11 +0200 (CEST)
Date: Thu, 15 Jul 2021 19:00:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Message-ID: <20210715170011.GA17324@lst.de>
References: <20210616154436.GA7619@lst.de>
 <20210622133414.132754-1-rm.skakun@gmail.com> <YO4si0to/XYximwM@fedora>
 <CADu_u-OMx6Pj4DQDoOsdh6aNAzYys-+R=o+OzHYtLm=nECgkyQ@mail.gmail.com>
 <fb262a14-a69c-030b-1f39-d924553ddbd2@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb262a14-a69c-030b-1f39-d924553ddbd2@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roman Skakun <rm.skakun@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, Andrii Anisov <andrii_anisov@epam.com>,
 Roman Skakun <roman_skakun@epam.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Christoph Hellwig <hch@lst.de>
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

On Thu, Jul 15, 2021 at 12:58:53PM -0400, Boris Ostrovsky wrote:
> 
> On 7/15/21 3:39 AM, Roman Skakun wrote:
> >> This looks like it wasn't picked up? Should it go in rc1?
> > Hi, Konrad!
> >
> > This looks like an unambiguous bug, and should be in rc1.
> 
> 
> Looks like you didn't copy Christoph which could be part of the problem. Adding him.

Can someone just send a clean patch that I can review and hopefully
apply?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
