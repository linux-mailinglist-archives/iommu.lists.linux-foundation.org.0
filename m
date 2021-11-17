Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C0454070
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 06:51:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A056580FFE;
	Wed, 17 Nov 2021 05:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upzP0o23ggUn; Wed, 17 Nov 2021 05:51:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC83280FF7;
	Wed, 17 Nov 2021 05:51:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 847E3C0032;
	Wed, 17 Nov 2021 05:51:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 709EBC0012
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 05:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BC32405A6
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 05:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAKkR17aqZq2 for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 05:51:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49894404D9
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 05:51:45 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D8F0368AFE; Wed, 17 Nov 2021 06:51:40 +0100 (CET)
Date: Wed, 17 Nov 2021 06:51:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: dma-direct fixes and cleanups v3
Message-ID: <20211117055140.GA1547@lst.de>
References: <20211111065028.32761-1-hch@lst.de>
 <73f5c70b-033c-f676-8ae9-4e89d5b043f1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73f5c70b-033c-f676-8ae9-4e89d5b043f1@arm.com>
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

On Tue, Nov 16, 2021 at 11:31:49AM +0000, Robin Murphy wrote:
> On 2021-11-11 06:50, Christoph Hellwig wrote:
>> Hi all,
>>
>> Linus complained about the complex flow in dma_direct_alloc, so this
>> tries to simplify it a bit, and while I was at it I also made sure that
>> unencrypted pages never leak back into the page allocator.
>
> Before I forget, I've had a quick skim of the remaining patches and nothing 
> more stands out. Let me know if you'd like me to find time to check 
> everything over in detail again for a proper review, but otherwise I reckon 
> we may as well get this baking in -next sooner rather than later.

I'd rather wait for a proper review, I don't think we are in a rush
with any of these patches.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
