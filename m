Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645A10E650
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 08:22:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A42485F5B;
	Mon,  2 Dec 2019 07:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctRjgatwztte; Mon,  2 Dec 2019 07:22:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1475A85F5A;
	Mon,  2 Dec 2019 07:22:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03AB0C087F;
	Mon,  2 Dec 2019 07:22:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80AFCC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 07:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 76B3B204A7
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 07:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ytVcTK-JfnM for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 07:22:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 115BD20109
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 07:22:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6F6D268B05; Mon,  2 Dec 2019 08:22:18 +0100 (CET)
Date: Mon, 2 Dec 2019 08:22:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: lijiazi <jqqlijiazi@gmail.com>
Subject: Re: [PATCH] dma-mapping: do not mapping module memory
Message-ID: <20191202072218.GB29554@lst.de>
References: <d6a63ad37b2556b8ba2fda16fc4dde95aa721741.1574997534.git.lijiazi@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6a63ad37b2556b8ba2fda16fc4dde95aa721741.1574997534.git.lijiazi@xiaomi.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 lijiazi <lijiazi@xiaomi.com>, Andrew Morton <akpm@linux-foundation.org>,
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

On Fri, Nov 29, 2019 at 07:03:40PM +0800, lijiazi wrote:
> On ARM, x86_64, sparc64 platform, virt_to_page only convert a
> _valid_ virtual address to struct page *, virt_addr_valid(x)
> indicates whether a virtual address is valid. If ptr is point
> to a static variable in module area, virt_to_page will return
> a invalid value.

While the path isn't wrong, why bother? 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
