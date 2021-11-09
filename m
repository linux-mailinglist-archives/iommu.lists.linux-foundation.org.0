Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7444AF53
	for <lists.iommu@lfdr.de>; Tue,  9 Nov 2021 15:19:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10E02400F3;
	Tue,  9 Nov 2021 14:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STB22QYOw_N7; Tue,  9 Nov 2021 14:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2DC2D4011C;
	Tue,  9 Nov 2021 14:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AB86C000E;
	Tue,  9 Nov 2021 14:19:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFFDAC000E
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB6F7607D7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id faopDEedY6eC for <iommu@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 14:19:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7389E60789
 for <iommu@lists.linux-foundation.org>; Tue,  9 Nov 2021 14:19:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 29E2767373; Tue,  9 Nov 2021 15:19:43 +0100 (CET)
Date: Tue, 9 Nov 2021 15:19:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 03/10] dma-direct: leak memory that can't be re-encrypted
Message-ID: <20211109141942.GB23489@lst.de>
References: <20211021090611.488281-1-hch@lst.de>
 <20211021090611.488281-4-hch@lst.de>
 <8556aafc-f006-ad25-3bd0-0664d06dcaaf@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8556aafc-f006-ad25-3bd0-0664d06dcaaf@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 David Rientjes <rientjes@google.com>
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

On Thu, Nov 04, 2021 at 12:35:49PM +0000, Robin Murphy wrote:
> Given that this is consistent for all uses of dma_set_encrypted(), seems 
> like it should be factored into the helper itself.

Done.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
