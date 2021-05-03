Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE6371F9E
	for <lists.iommu@lfdr.de>; Mon,  3 May 2021 20:25:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93D09847E8;
	Mon,  3 May 2021 18:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B77XNRMs2m7a; Mon,  3 May 2021 18:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9015847E4;
	Mon,  3 May 2021 18:25:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A74AFC001C;
	Mon,  3 May 2021 18:25:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFD38C0001
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 18:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F43440E59
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 18:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LM8idD3830nb for <iommu@lists.linux-foundation.org>;
 Mon,  3 May 2021 18:25:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B5A4024B
 for <iommu@lists.linux-foundation.org>; Mon,  3 May 2021 18:25:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4F8B568BEB; Mon,  3 May 2021 20:25:49 +0200 (CEST)
Date: Mon, 3 May 2021 20:25:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 02/16] PCI/P2PDMA: Avoid pci_get_slot() which sleeps
Message-ID: <20210503182548.GB17174@lst.de>
References: <20210408170123.8788-1-logang@deltatee.com>
 <20210408170123.8788-3-logang@deltatee.com>
 <d6220bff-83fc-6c03-76f7-32e9e00e40fd@nvidia.com>
 <d4091d87-7d9e-8cde-4e1c-01b877b6785f@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4091d87-7d9e-8cde-4e1c-01b877b6785f@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-nvme@lists.infradead.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Minturn Dave B <dave.b.minturn@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>,
 Xiong Jianxin <jianxin.xiong@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
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

On Mon, May 03, 2021 at 10:08:34AM -0600, Logan Gunthorpe wrote:
> Per above, I think the reference count is unnecessary. But I could wrap
> it in a static function for clarity. (There's no reason to export this
> function).

A well documented helper function would really help to improve the
code for the casual reader I think.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
