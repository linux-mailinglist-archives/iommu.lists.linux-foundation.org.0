Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 944584CFEE6
	for <lists.iommu@lfdr.de>; Mon,  7 Mar 2022 13:36:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D501460E4B;
	Mon,  7 Mar 2022 12:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msU9xbz4VltS; Mon,  7 Mar 2022 12:36:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D997360E4E;
	Mon,  7 Mar 2022 12:36:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B5E5C000B;
	Mon,  7 Mar 2022 12:36:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37555C000B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Mar 2022 12:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FEA40151
 for <iommu@lists.linux-foundation.org>; Mon,  7 Mar 2022 12:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKcpgE5LIufU for <iommu@lists.linux-foundation.org>;
 Mon,  7 Mar 2022 12:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 143B04012D
 for <iommu@lists.linux-foundation.org>; Mon,  7 Mar 2022 12:35:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360A81FB;
 Mon,  7 Mar 2022 04:35:59 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2CE03F766;
 Mon,  7 Mar 2022 04:35:57 -0800 (PST)
Message-ID: <6cf91f43-df23-3ac9-e9b5-958d99d37422@arm.com>
Date: Mon, 7 Mar 2022 12:35:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [BUG] crypto: ccree: driver does not handle case where cryptlen =
 authsize =0
Content-Language: en-GB
To: Gilad Ben-Yossef <gilad@benyossef.com>
References: <CAOtvUMeoYcVm7OQdqXd1V5iPSXW_BkVxx6TA6nF7zTLVeHe0Ww@mail.gmail.com>
 <CAOtvUMfy1fF35B2sfbOMui8n9Q4iCke9rgn5TiYMUMjd8gqHsA@mail.gmail.com>
 <YhKV55t90HWm6bhv@Red>
 <CAOtvUMdRU4wnRCXsC+U5XBDp+b+u8w7W7JCUKW2+ohuJz3PVhQ@mail.gmail.com>
 <YhOcEQEjIKBrbMIZ@Red>
 <CAOtvUMfN8U4+eG-TEVW4bSE6kOzuOSsJE4dOYGXYuWQKNzv7wQ@mail.gmail.com>
 <CAOtvUMeRb=j=NDrc88x8aB-3=D1mxZ_-aA1d4FfvJmj7Jrbi4w@mail.gmail.com>
 <YiIUXtxd44ut5uzV@Red> <YiUsWosH+MKMF7DQ@gondor.apana.org.au>
 <CAOtvUMcudG3ySU+VeE7hfneDVWGLKFTnws-xjhq4hgFYSj0qOg@mail.gmail.com>
 <YiXjCcXXk0f18FDL@Red> <aca4117c-b7a5-f7eb-eb03-4e1f1a93a730@arm.com>
 <CAOtvUMePFR4e2jgHZKOvs3J3Xt4NzRbzD_=vr_49Qgs5HTrvHw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAOtvUMePFR4e2jgHZKOvs3J3Xt4NzRbzD_=vr_49Qgs5HTrvHw@mail.gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2022-03-07 12:17, Gilad Ben-Yossef wrote:
> On Mon, Mar 7, 2022 at 1:14 PM Robin Murphy <robin.murphy@arm.com> wrote:
> 
>> The "overlap" is in the sense of having more than one mapping within the
>> same cacheline:
>>
>> [  142.458120] DMA-API: add_dma_entry start P=ba79f200 N=ba79f
>> D=ba79f200 L=10 DMA_FROM_DEVICE attrs=0
>> [  142.458156] DMA-API: add_dma_entry start P=445dc010 N=445dc
>> D=445dc010 L=10 DMA_TO_DEVICE attrs=0
>> [  142.458178] sun8i-ss 1c15000.crypto: SRC 0/1/1 445dc000 len=16 bi=0
>> [  142.458215] sun8i-ss 1c15000.crypto: DST 0/1/1 ba79f200 len=16 bi=0
>> [  142.458234] DMA-API: add_dma_entry start P=ba79f210 N=ba79f
>> D=ba79f210 L=10 DMA_FROM_DEVICE attrs=0
>>
>> This actually illustrates exactly the reason why this is unsupportable.
>> ba79f200 is mapped for DMA_FROM_DEVICE, therefore subsequently mapping
>> ba79f210 for DMA_TO_DEVICE may cause the cacheline covering the range
>> ba79f200-ba79f23f to be written back over the top of data that the
>> device has already started to write to memory. Hello data corruption.
>>
>> Separate DMA mappings should be from separate memory allocations,
>> respecting ARCH_DMA_MINALIGN.
> 
> hmm... I know I'm missing something here, but how does this align with
> the following from active_cacheline_insert() in kernel/dma/debug.c ?
> 
>          /* If the device is not writing memory then we don't have any
>           * concerns about the cpu consuming stale data.  This mitigates
>           * legitimate usages of overlapping mappings.
>           */
>          if (entry->direction == DMA_TO_DEVICE)
>                  return 0;

It's OK to have multiple mappings that are *all* DMA_TO_DEVICE, which 
looks to be the case that this check was intended to allow. However I 
think you're right that it should still actually check for conflicting 
directions between the new entry and any existing ones, otherwise it 
ends up a bit too lenient.

Cheers,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
