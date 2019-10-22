Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C197E059C
	for <lists.iommu@lfdr.de>; Tue, 22 Oct 2019 15:57:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 69EA1CA8;
	Tue, 22 Oct 2019 13:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 077C5AF7
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:57:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (unknown [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 6E12189B
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:57:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCC1E1763;
	Tue, 22 Oct 2019 06:56:53 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A01083F71A;
	Tue, 22 Oct 2019 06:56:52 -0700 (PDT)
Subject: Re: [PATCH V2] kernel: dma: contigous: Make CMA parameters
	__initdata/__initconst
To: Shyam Saini <mayhs11saini@gmail.com>, kernel-hardening@lists.openwall.com
References: <20191020050322.2634-1-mayhs11saini@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1a358862-0c0c-e4c6-9dd7-f626c0a904b0@arm.com>
Date: Tue, 22 Oct 2019 14:56:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191020050322.2634-1-mayhs11saini@gmail.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	iommu@lists.linux-foundation.org, Christopher Lameter <cl@linux.com>,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 20/10/2019 06:03, Shyam Saini wrote:
> These parameters are only referenced by __init routine calls during early
> boot so they should be marked as __initdata and __initconst accordingly.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Christopher Lameter <cl@linux.com>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Shyam Saini <mayhs11saini@gmail.com>
> ---
> V1->V2:
> 	mark cma parameters as __initdata/__initconst
> 	instead of __ro_after_init. As these parameters
> 	are only used by __init calls and never used afterwards
> 	which contrast the __ro_after_init usage.
> ---
>   kernel/dma/contiguous.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 69cfb4345388..10bfc8c44c54 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -42,10 +42,10 @@ struct cma *dma_contiguous_default_area;
>    * Users, who want to set the size of global CMA area for their system
>    * should use cma= kernel parameter.
>    */
> -static const phys_addr_t size_bytes = (phys_addr_t)CMA_SIZE_MBYTES * SZ_1M;
> -static phys_addr_t size_cmdline = -1;
> -static phys_addr_t base_cmdline;
> -static phys_addr_t limit_cmdline;
> +static const phys_addr_t size_bytes __initconst = (phys_addr_t)CMA_SIZE_MBYTES * SZ_1M;
> +static phys_addr_t  size_cmdline __initdata = -1;
> +static phys_addr_t base_cmdline __initdata;
> +static phys_addr_t limit_cmdline __initdata;
>   
>   static int __init early_cma(char *p)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
