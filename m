Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C41310825
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 10:46:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 14AC4203A4;
	Fri,  5 Feb 2021 09:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFylww-xrA6I; Fri,  5 Feb 2021 09:45:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08AB42037C;
	Fri,  5 Feb 2021 09:45:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 002E6C013A;
	Fri,  5 Feb 2021 09:45:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 306EEC013A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 280BE2038B
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcUNshh8WnEY for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:45:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id A81112037C
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 09:45:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 78EE968AFE; Fri,  5 Feb 2021 10:45:49 +0100 (CET)
Date: Fri, 5 Feb 2021 10:45:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 5/8] swiotlb: refactor swiotlb_tbl_map_single
Message-ID: <20210205094549.GB2801@lst.de>
References: <20210204193035.2606838-1-hch@lst.de>
 <20210204193035.2606838-6-hch@lst.de>
 <f60ddc1b-94c3-32a1-06eb-b2187d56d797@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f60ddc1b-94c3-32a1-06eb-b2187d56d797@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 gregkh@linuxfoundation.org, linux-nvme@lists.infradead.org, kbusch@kernel.org,
 iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
 jxgao@google.com
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

On Thu, Feb 04, 2021 at 10:12:31PM +0000, Robin Murphy wrote:
>> -	mask = dma_get_seg_boundary(hwdev);
>> +	if (boundary_mask + 1 == ~0UL)
>
> Either "mask == ~0UL" or "mask + 1 == 0", surely?

I switched forth and back a few times and ended up with the broken
variant in the middle.  Fixed.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
