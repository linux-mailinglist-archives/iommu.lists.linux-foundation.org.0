Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4634C1AD71A
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 09:10:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0233F85D97;
	Fri, 17 Apr 2020 07:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X_a3zm5Ex0zj; Fri, 17 Apr 2020 07:10:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 895A885D54;
	Fri, 17 Apr 2020 07:10:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 788C6C1D8D;
	Fri, 17 Apr 2020 07:10:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C6CFC0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7818B854E3
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FrXeN5RsoBXj for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:10:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9D9783204
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:10:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A82A768BEB; Fri, 17 Apr 2020 09:10:23 +0200 (CEST)
Date: Fri, 17 Apr 2020 09:10:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [patch 5/7] dma-pool: add pool sizes to debugfs
Message-ID: <20200417071023.GC19153@lst.de>
References: <alpine.DEB.2.22.394.2004141700480.68516@chino.kir.corp.google.com>
 <alpine.DEB.2.22.394.2004141704050.68516@chino.kir.corp.google.com>
 <0c7144e3-057a-959d-0b7d-4a718bd6076c@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c7144e3-057a-959d-0b7d-4a718bd6076c@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: x86@kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Jon Grimm <jon.grimm@amd.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, David Rientjes <rientjes@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>
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

On Wed, Apr 15, 2020 at 08:45:08AM -0500, Tom Lendacky wrote:
>
>
> On 4/14/20 7:04 PM, David Rientjes wrote:
>> The atomic DMA pools can dynamically expand based on non-blocking
>> allocations that need to use it.
>>
>> Export the sizes of each of these pools, in bytes, through debugfs for
>> measurement.
>>
>> Suggested-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: David Rientjes <rientjes@google.com>
>> ---
>>   kernel/dma/pool.c | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
>> index cf052314d9e4..3e22022c933b 100644
>> --- a/kernel/dma/pool.c
>> +++ b/kernel/dma/pool.c
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (C) 2020 Google LLC
>>    */
>> +#include <linux/debugfs.h>
>>   #include <linux/dma-direct.h>
>>   #include <linux/dma-noncoherent.h>
>>   #include <linux/dma-contiguous.h>
>> @@ -15,6 +16,11 @@
>>   static struct gen_pool *atomic_pool_dma __ro_after_init;
>>   static struct gen_pool *atomic_pool_dma32 __ro_after_init;
>>   static struct gen_pool *atomic_pool_kernel __ro_after_init;
>> +#ifdef CONFIG_DEBUG_FS
>
> I don't think you need the #ifdef any more unless you just want to save 
> space. All of the debugfs routines have versions for whether 
> CONFIG_DEBUG_FS is defined or not.

Agreed.  I can fix this up.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
