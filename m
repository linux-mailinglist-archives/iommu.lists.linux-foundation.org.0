Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 43043132E3F
	for <lists.iommu@lfdr.de>; Tue,  7 Jan 2020 19:18:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE2DC8609F;
	Tue,  7 Jan 2020 18:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otBuUGUdL8H6; Tue,  7 Jan 2020 18:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 316C185F6D;
	Tue,  7 Jan 2020 18:18:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D288C0881;
	Tue,  7 Jan 2020 18:18:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE5DC0881
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 18:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 977CE874E4
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 18:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8-d0ATmgX9eM for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jan 2020 18:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id BF48C86A2E
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jan 2020 18:18:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E472831B;
 Tue,  7 Jan 2020 10:18:30 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 956783F534;
 Tue,  7 Jan 2020 10:18:29 -0800 (PST)
Subject: Re: dma-direct: don't check swiotlb=force in dma_direct_map_resource
To: Naresh Kamboju <naresh.kamboju@linaro.org>, hch@lst.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
References: <CA+G9fYvMX4gMi6hmTmukzgr1xPsoJsj0WTm=AS3hC5Mq-dLvsQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2c401e83-99d2-925f-66fe-fffe04415e1a@arm.com>
Date: Tue, 7 Jan 2020 18:18:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvMX4gMi6hmTmukzgr1xPsoJsj0WTm=AS3hC5Mq-dLvsQ@mail.gmail.com>
Content-Language: en-GB
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 iommu@lists.linux-foundation.org, linux- stable <stable@vger.kernel.org>
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

On 07/01/2020 5:38 pm, Naresh Kamboju wrote:
> Following build error on stable-rc 5.4.9-rc1 for arm architecture.
> 
> dma/direct.c: In function 'dma_direct_possible':
> dma/direct.c:329:3: error: too many arguments to function 'dma_capable'
>     dma_capable(dev, dma_addr, size, true);
>     ^~~~~~~~~~~

Not sure that $SUBJECT comes into it at all, but by the look of it I 
guess "dma-direct: exclude dma_direct_map_resource from the min_low_pfn 
check" implicitly depends on 130c1ccbf553 ("dma-direct: unify the 
dma_capable definitions") too.

Robin.

> In file included from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/dma-direct.h:12:0,
>                   from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/kernel/dma/direct.c:10:
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/include/asm/dma-direct.h:17:20:
> note: declared here
>   static inline bool dma_capable(struct device *dev, dma_addr_t addr,
> size_t size)
>                      ^~~~~~~~~~~
> In file included from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/init.h:5:0,
>                   from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/memblock.h:12,
>                   from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/kernel/dma/direct.c:7:
> dma/direct.c: In function 'dma_direct_map_resource':
> dma/direct.c:378:16: error: too many arguments to function 'dma_capable'
>    if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
>                  ^
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/compiler.h:78:42:
> note: in definition of macro 'unlikely'
>   # define unlikely(x) __builtin_expect(!!(x), 0)
>                                            ^
> In file included from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/include/linux/dma-direct.h:12:0,
>                   from
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/kernel/dma/direct.c:10:
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/arch/arm/include/asm/dma-direct.h:17:20:
> note: declared here
>   static inline bool dma_capable(struct device *dev, dma_addr_t addr,
> size_t size)
>                      ^~~~~~~~~~~
> /srv/oe/build/tmp-lkft-glibc/work-shared/am57xx-evm/kernel-source/scripts/Makefile.build:265:
> recipe for target 'kernel/dma/direct.o' failed
> 
> Full build log link,
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-stable-rc-5.4/DISTRO=lkft,MACHINE=am57xx-evm,label=docker-lkft/44/consoleText
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
