Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4C3CD090
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 11:22:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AC0A40255;
	Mon, 19 Jul 2021 09:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7WxERhhxf3P; Mon, 19 Jul 2021 09:22:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6883640254;
	Mon, 19 Jul 2021 09:22:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 422A1C000E;
	Mon, 19 Jul 2021 09:22:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55F34C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 269D440255
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Jxki96C-wY4 for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 09:22:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0829540254
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 09:22:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 11E6C67373; Mon, 19 Jul 2021 11:22:36 +0200 (CEST)
Date: Mon, 19 Jul 2021 11:22:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Skakun <rm.skakun@gmail.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc addresses
Message-ID: <20210719092235.GA31566@lst.de>
References: <20210715170011.GA17324@lst.de>
 <20210716083934.154992-1-rm.skakun@gmail.com> <20210716093551.GA17981@lst.de>
 <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com>
 <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s>
 <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, Roman Skakun <Roman_Skakun@epam.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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

On Sat, Jul 17, 2021 at 11:39:21AM +0300, Roman Skakun wrote:
> > We can merge this patch and create a new one for
> > xen_swiotlb_free_coherent() later.
> > Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
> > was problematic.
> >
> > This patch is fine by me.
> 
> Good. I'm agreed too. Waiting for Christoph.

Fine with.  I've queued up the modified patch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
