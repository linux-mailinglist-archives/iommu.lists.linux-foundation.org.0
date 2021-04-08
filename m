Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9236335848E
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 15:24:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D1A4046D;
	Thu,  8 Apr 2021 13:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veDAZ3cOGA9Y; Thu,  8 Apr 2021 13:24:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E468340465;
	Thu,  8 Apr 2021 13:23:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B22B2C000A;
	Thu,  8 Apr 2021 13:23:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B13CC000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 13:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3035184808
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 13:23:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rb6YLXad6yPn for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 13:23:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7D68842C3
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 13:23:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 2DE0D418; Thu,  8 Apr 2021 15:23:51 +0200 (CEST)
Date: Thu, 8 Apr 2021 15:23:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH] iommu/amd: page-specific invalidations for more than one
 page
Message-ID: <YG8D5ZjSxZm6tF9v@8bytes.org>
References: <20210323210619.513069-1-namit@vmware.com>
 <YG2C42UdIEsWex2L@8bytes.org>
 <71C74038-943D-4041-B6FF-09A8C40CA204@vmware.com>
 <YG6uWFAS6GCWJPGO@8bytes.org>
 <80A4A5F2-5D8C-4F8D-BF7B-CFFF4F770F57@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80A4A5F2-5D8C-4F8D-BF7B-CFFF4F770F57@vmware.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Will Deacon <will@kernel.org>, Jiajun Cao <caojiajun@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Thu, Apr 08, 2021 at 10:29:25AM +0000, Nadav Amit wrote:
> In the version that you referred me to, iommu_update_domain_tlb() only
> regards the size of the region to be flushed and disregards the
> alignment:
> 
> +	order   = get_order(domain->flush.end - domain->flush.start);
> +	mask    = (0x1000ULL << order) - 1;
> +	address = ((domain->flush.start & ~mask) | (mask >> 1)) & ~0xfffULL;
> 
> 
> If you need to flush for instance the region between 0x1000-0x5000, this
> version would use the address|mask of 0x1000 (16KB page). The version I
> sent regards the alignment, and since the range is not aligned would use
> address|mask of 0x3000 (32KB page).
> 
> IIUC, IOVA allocations today are aligned in such way, but at least in
> the past (looking on 3.19 for the matter), it was not like always like
> that, which can explain the problems.

Yeah, that make sense and explains the data corruption problems. I will
give your patch a try on one of my test machines and consider it for
v5.13 if all goes well.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
