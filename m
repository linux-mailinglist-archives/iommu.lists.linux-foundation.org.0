Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A8519530C94
	for <lists.iommu@lfdr.de>; Mon, 23 May 2022 12:24:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5143283FAA;
	Mon, 23 May 2022 10:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZUxMvyLrAkpX; Mon, 23 May 2022 10:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5D81283FA3;
	Mon, 23 May 2022 10:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25549C0081;
	Mon, 23 May 2022 10:24:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE0BDC0039
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 10:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F7541963
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 10:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJwYiSTOxdfp for <iommu@lists.linux-foundation.org>;
 Mon, 23 May 2022 10:24:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCBB24195A
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 10:24:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A15811FB;
 Mon, 23 May 2022 03:24:09 -0700 (PDT)
Received: from [10.57.82.55] (unknown [10.57.82.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CB9F3F73D;
 Mon, 23 May 2022 03:24:07 -0700 (PDT)
Message-ID: <6f1f48e2-a54d-58d6-8946-853cffeb55df@arm.com>
Date: Mon, 23 May 2022 11:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Content-Language: en-GB
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, hch@lst.de
References: <20220423174650.GA29219@lst.de>
 <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
Cc: mathieu.poirier@linaro.org, yj.chiang@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On 2022-05-23 11:15, Mark-PK Tsai wrote:
>> Sigh.  In theory drivers should never declare coherent memory like
>> this, and there has been some work to fix remoteproc in that regard.
>>
>> But I guess until that is merged we'll need somthing like this fix.
> 
> Hi,
> 
> Thanks for your comment.
> As I didn't see other fix of this issue, should we use this patch
> before the remoteproc work you mentioned is merged?

TBH I think it would be better "fixed" with a kmemleak_ignore() and a 
big comment, rather than adding API cruft for something that isn't a 
real problem. I'm quite sure that no real-world user is unbinding 
remoteproc drivers frequently enough that leaking a 48-byte allocation 
each time has any practical significance.

Thanks,
Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
