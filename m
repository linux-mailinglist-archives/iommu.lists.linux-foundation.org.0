Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A221BF07
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 23:10:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7269789C6A;
	Fri, 10 Jul 2020 21:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3APusbQSPQG; Fri, 10 Jul 2020 21:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DEB5589C66;
	Fri, 10 Jul 2020 21:10:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF991C016F;
	Fri, 10 Jul 2020 21:10:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B01CEC016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 21:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 82364267C8
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ft1wjmK3mClM for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 21:10:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 538E323469
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 21:10:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A6B41FB;
 Fri, 10 Jul 2020 14:10:15 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 226F93F9AB;
 Fri, 10 Jul 2020 14:10:15 -0700 (PDT)
Subject: Re: [PATCH 0/4] dma-pool: Fix atomic pool selection
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, hch@lst.de,
 Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>,
 iommu@lists.linux-foundation.org
References: <20200709161903.26229-1-nsaenzjulienne@suse.de>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <c28da389-dae5-9bc8-61f1-d40da086c5c4@arm.com>
Date: Fri, 10 Jul 2020 13:52:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709161903.26229-1-nsaenzjulienne@suse.de>
Content-Language: en-US
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi,


I have merged this to a 5.8 tree along with "dma-pool: Only allocate 
from CMA when in the same memory zone" and tested it in various ACPI/DT 
combinations, particularly on the RPI4. It seems to be working fine.

So thanks for your time and effort clearing this up!

Tested-by: Jeremy Linton <jeremy.linton@arm.com>


On 7/9/20 11:19 AM, Nicolas Saenz Julienne wrote:
> This is my attempt at fixing one of the regressions we've seen[1] after
> the introduction of per-zone atomic pools.
> 
> This combined with "dma-pool: Do not allocate pool memory from CMA"[2]
> should fix the boot issues on Jeremy's RPi4 setup.
> 
> [1] https://lkml.org/lkml/2020/7/2/974
> [2] https://lkml.org/lkml/2020/7/8/1108
> 
> ---
> 
> Nicolas Saenz Julienne (4):
>    dma-direct: Provide function to check physical memory area validity
>    dma-pool: Get rid of dma_in_atomic_pool()
>    dma-pool: Introduce dma_guess_pool()
>    dma-pool: Make sure atomic pool suits device
> 
>   include/linux/dma-direct.h |  1 +
>   kernel/dma/direct.c        |  2 +-
>   kernel/dma/pool.c          | 76 +++++++++++++++++++++++++++-----------
>   3 files changed, 56 insertions(+), 23 deletions(-)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
