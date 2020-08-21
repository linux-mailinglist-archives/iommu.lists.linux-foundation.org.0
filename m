Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A622424D966
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 18:09:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3697F20005;
	Fri, 21 Aug 2020 16:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B1yJ0ILQvnmq; Fri, 21 Aug 2020 16:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D51B8203CA;
	Fri, 21 Aug 2020 16:08:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B720FC0051;
	Fri, 21 Aug 2020 16:08:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD39C0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97625886B7
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFL96LqEQPlA for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 16:08:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 57477886B4
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=92eGX7MWPFjNhNX0NwOjIQ0sXPTJuWVAoSzAi/Jj5GU=; b=stlLywnRrzvVM8oQQ81BQX97tc
 cRayqTje0CRor0HOVRUn7EC+cQ/7O1TMj1OOKxZDR0omMH/aQqEvVDAh6SXszeOP+xvxBP8DDMeia
 dnZ1t21/MLZMFd45JqtPIJPAn7xB0OJ1EMbL58yh+Z+XJeMpAgURfPejkTYuWVIgd2oAWwY4WNRq/
 bMQpDiNUWJd1xlFXIVTYv8kPJgdBzqPdmZoH5v1fgooiiS7525CSYfCCMMlSTFVVVH7OI08lDKbuv
 0vVC9slIupv6+m6PhqQluAwZ73GTqBg5V6VQ1dYcgCH9OI6TmK/joa7RqwzWJWt5WR7Iyn+Z+qlPa
 1ifE+dyA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k99ai-0007DH-IK; Fri, 21 Aug 2020 16:08:32 +0000
Subject: Re: [PATCH v7 1/3] dma-contiguous: provide the ability to reserve
 per-numa CMA
To: Barry Song <song.bao.hua@hisilicon.com>, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, will@kernel.org,
 ganapatrao.kulkarni@cavium.com, catalin.marinas@arm.com,
 akpm@linux-foundation.org
References: <20200821113355.6140-1-song.bao.hua@hisilicon.com>
 <20200821113355.6140-2-song.bao.hua@hisilicon.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5eafce91-cc92-e6ed-23b0-98f253129e1b@infradead.org>
Date: Fri, 21 Aug 2020 09:08:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821113355.6140-2-song.bao.hua@hisilicon.com>
Content-Language: en-US
Cc: Mike Rapoport <rppt@linux.ibm.com>, Steve Capper <steve.capper@arm.com>,
 linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, prime.zeng@hisilicon.com,
 huangdaode@huawei.com, linux-arm-kernel@lists.infradead.org
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

On 8/21/20 4:33 AM, Barry Song wrote:
> ---
>  -v7: with respect to Will's comments
>  * move to use for_each_online_node
>  * add description if users don't specify pernuma_cma
>  * provide default value for CONFIG_DMA_PERNUMA_CMA
> 
>  .../admin-guide/kernel-parameters.txt         |  11 ++
>  include/linux/dma-contiguous.h                |   6 ++
>  kernel/dma/Kconfig                            |  11 ++
>  kernel/dma/contiguous.c                       | 100 ++++++++++++++++--
>  4 files changed, 118 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index bdc1f33fd3d1..c609527fc35a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -599,6 +599,17 @@
>  			altogether. For more information, see
>  			include/linux/dma-contiguous.h
>  
> +	pernuma_cma=nn[MG]
> +			[ARM64,KNL]
> +			Sets the size of kernel per-numa memory area for
> +			contiguous memory allocations. A value of 0 disables
> +			per-numa CMA altogether. And If this option is not
> +			specificed, the default value is 0.
> +			With per-numa CMA enabled, DMA users on node nid will
> +			first try to allocate buffer from the pernuma area
> +			which is located in node nid, if the allocation fails,
> +			they will fallback to the global default memory area.
> +

Entries in kernel-parameters.txt are supposed to be in alphabetical order
but this one is not.  If you want to keep it near the cma= entry, you can
rename it like Mike suggested.  Otherwise it needs to be moved.


>  	cmo_free_hint=	[PPC] Format: { yes | no }
>  			Specify whether pages are marked as being inactive
>  			when they are freed.  This is used in CMO environments



-- 
~Randy

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
