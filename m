Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B633AA032
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 17:44:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4C640E43;
	Wed, 16 Jun 2021 15:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h96Be-5_9gTc; Wed, 16 Jun 2021 15:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BFE824149C;
	Wed, 16 Jun 2021 15:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91BABC0024;
	Wed, 16 Jun 2021 15:44:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF762C000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF4844065B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_RpCUzqtgu3 for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 15:44:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 273DA405ED
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 15:44:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 71B3B67357; Wed, 16 Jun 2021 17:44:36 +0200 (CEST)
Date: Wed, 16 Jun 2021 17:44:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] swiotlb-xen: override common mmap and get_sgtable
 dma ops
Message-ID: <20210616154436.GA7619@lst.de>
References: <855a58e2-1e03-4763-cb56-81367b73762c@oracle.com>
 <20210616114205.38902-1-roman_skakun@epam.com>
 <20210616114205.38902-2-roman_skakun@epam.com>
 <2834cdc0-534c-4f07-1901-e468a7713c1f@oracle.com>
 <20210616142148.GA764@lst.de>
 <83353b34-2abb-9dfc-bed6-21d500abf49f@oracle.com>
 <20210616153519.GA6476@lst.de>
 <d4e8c822-3f92-d552-018c-611a44299e28@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4e8c822-3f92-d552-018c-611a44299e28@oracle.com>
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

On Wed, Jun 16, 2021 at 11:39:07AM -0400, Boris Ostrovsky wrote:
> 
> On 6/16/21 11:35 AM, Christoph Hellwig wrote:
> > On Wed, Jun 16, 2021 at 11:33:50AM -0400, Boris Ostrovsky wrote:
> >> Isn't the expectation of virt_to_page() that it only works on non-vmalloc'd addresses? (This is not a rhetorical question, I actually don't know).
> > Yes.  Thus is why I'd suggest to just do the vmalloc_to_page or
> > virt_to_page dance in ops_helpers.c and just continue using that.
> 
> 
> Ah, OK, so something along the lines of what I suggested. (I thought by "helpers" you meant virt_to_page()).

Yes.  Just keeping it contained in the common code without duplicating it
into a xen-specific version.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
