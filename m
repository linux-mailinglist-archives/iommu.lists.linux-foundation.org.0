Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA82343ADD
	for <lists.iommu@lfdr.de>; Mon, 22 Mar 2021 08:46:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A68F6065D;
	Mon, 22 Mar 2021 07:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVgdWfUPzW6n; Mon, 22 Mar 2021 07:46:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FEFE60647;
	Mon, 22 Mar 2021 07:46:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EC96C0001;
	Mon, 22 Mar 2021 07:46:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EF82C0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 07:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB95402A4
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 07:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3HgQNPKgChJ for <iommu@lists.linux-foundation.org>;
 Mon, 22 Mar 2021 07:46:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C99A940287
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 07:46:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DFD0767373; Mon, 22 Mar 2021 08:46:27 +0100 (CET)
Date: Mon, 22 Mar 2021 08:46:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2] swiotlb: Make SWIOTLB_NO_FORCE perform no allocation
Message-ID: <20210322074627.GA4252@lst.de>
References: <20210319040055.183433-1-f.fainelli@gmail.com>
 <20210321033740.312500-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321033740.312500-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 linux-kernel@vger.kernel.org,
 "open list:SWIOTLB SUBSYSTEM" <iommu@lists.linux-foundation.org>,
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

On Sat, Mar 20, 2021 at 08:37:40PM -0700, Florian Fainelli wrote:
> -	if (!strcmp(str, "force")) {
> +	if (!strcmp(str, "force"))
>  		swiotlb_force = SWIOTLB_FORCE;
> -	} else if (!strcmp(str, "noforce")) {
> +	else if (!strcmp(str, "noforce"))
>  		swiotlb_force = SWIOTLB_NO_FORCE;
> -		default_nslabs = 1;
> -	}
>  
>  	return 0;
>  }
> @@ -211,6 +209,9 @@ swiotlb_init(int verbose)
>  	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>  	void *tlb;
>  
> +	if (swiotlb_force == SWIOTLB_NO_FORCE)
> +		return;

We'll also need this in the other callers of swiotlb_init_with_tbl
and swiotlb_late_init_with_tbl.

I actually had a plan to mostly kill them, but that can better
way until more support for multiple io_tlb structures is merged.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
