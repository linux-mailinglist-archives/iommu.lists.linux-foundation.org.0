Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E265572A5
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 07:44:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EAB61261;
	Thu, 23 Jun 2022 05:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EAB61261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkcQgmZrHP0q; Thu, 23 Jun 2022 05:44:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8C56060BF2;
	Thu, 23 Jun 2022 05:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C56060BF2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E5B8C007E;
	Thu, 23 Jun 2022 05:44:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F122DC002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 05:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C84B34048C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 05:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C84B34048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XV5OcBXU_iMm for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 05:43:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3139840123
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3139840123
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 05:43:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6917D68AFE; Thu, 23 Jun 2022 07:43:52 +0200 (CEST)
Date: Thu, 23 Jun 2022 07:43:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH] dma-direct: use the correct size for dma_set_encrypted()
Message-ID: <20220623054352.GA12543@lst.de>
References: <20220622191424.15777-1-decui@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622191424.15777-1-decui@microsoft.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, Tianyu.Lan@microsoft.com,
 Andrea.Parri@microsoft.com, linux-kernel@vger.kernel.org,
 mikelley@microsoft.com, iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 hch@lst.de
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

On Wed, Jun 22, 2022 at 12:14:24PM -0700, Dexuan Cui wrote:
> The third parameter of dma_set_encrypted() is a size in bytes rather than
> the number of pages.
> 
> Fixes: 4d0564785bb0 ("dma-direct: factor out dma_set_{de,en}crypted helpers")
> Signed-off-by: Dexuan Cui <decui@microsoft.com>

see:

commit 4a37f3dd9a83186cb88d44808ab35b78375082c9 (tag: dma-mapping-5.19-2022-05-25)
Author: Robin Murphy <robin.murphy@arm.com>
Date:   Fri May 20 18:10:13 2022 +0100

    dma-direct: don't over-decrypt memory
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
