Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78135ED62
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 08:44:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08553400F3;
	Wed, 14 Apr 2021 06:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ffEUSSk2KRJn; Wed, 14 Apr 2021 06:44:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35EAB4013B;
	Wed, 14 Apr 2021 06:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12BD6C000A;
	Wed, 14 Apr 2021 06:44:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F2B0C000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FB80845F6
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZ019e5Cby5A for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 06:44:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C57AF845F5
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 06:44:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D9B8468AFE; Wed, 14 Apr 2021 08:43:58 +0200 (CEST)
Date: Wed, 14 Apr 2021 08:43:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [RFC V2 PATCH 9/12] swiotlb: Add bounce buffer remap address
 setting function
Message-ID: <20210414064358.GA25877@lst.de>
References: <20210413152217.3386288-1-ltykernel@gmail.com>
 <20210413152217.3386288-10-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413152217.3386288-10-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: thomas.lendacky@amd.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 konrad.wilk@oracle.com, sunilmut@microsoft.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, brijesh.singh@amd.com, vkuznets@redhat.com,
 robin.murphy@arm.com, hch@lst.de
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

On Tue, Apr 13, 2021 at 11:22:14AM -0400, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
> needs to be accessed via extra address space(e.g address above bit39).
> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_bounce()
> needs to use remap virtual address to copy data from/to bounce buffer. Add
> new interface swiotlb_set_bounce_remap() to do that.

I have no way to review what this actually doing when you only Cc me
on a single patch.  Please make sure everyone is Cced on the whole
series to enable proper review.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
