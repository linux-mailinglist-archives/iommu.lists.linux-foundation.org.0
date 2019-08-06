Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 21384839BD
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 21:39:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A975ED82;
	Tue,  6 Aug 2019 19:39:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02B03CB0
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 19:39:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E324A829
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 19:39:12 +0000 (UTC)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alpha.anastas.io (Postfix) with ESMTPSA id 2FB9F7F91A;
	Tue,  6 Aug 2019 14:39:08 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
	t=1565120352; bh=HXAHKgiQsfJr2nTxca5W5Al0GVPsqRNPo3FiFtTBIoc=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=VF/YxkoGj8ca1JQcWi5sYSQVWRKBYyZtR9HUzDE+ew2GrVyUCIeEXZFt6rVd6W6wg
	vtSTCcBTAjJH0ZszPuJKYt0eFgEDwICoBRPS0wGBydBz0++9N23+H7Ed3B5qGV1VMC
	LvZrV59lni9MLs/JcvnzGbRKNJzNv+d8Qk4W2RBQao6w281+TddI5F/TzpRT8SkiIO
	nhUyXU745H9K0uufXJpjZAa7VpAkGr/JSB0EdEr/q/xdFRPa19oitpAqc+ktLxg9Is
	kcvPFe0HGSSTtWUCJqLE5dUJRbo5Vz5U2m6kzrfDAVngIfOzeFSuQSEh/otww7M/bt
	SjEGu4AGs8jvg==
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20190805080145.5694-1-hch@lst.de>
	<20190805080145.5694-2-hch@lst.de>
Message-ID: <7df95ffb-6df3-b118-284c-ee32cad81199@anastas.io>
Date: Tue, 6 Aug 2019 21:39:06 +0200
MIME-Version: 1.0
In-Reply-To: <20190805080145.5694-2-hch@lst.de>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Gavin Li <git@thegavinli.com>, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	Paul Burton <paul.burton@mips.com>,
	Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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
From: Shawn Anastasio via iommu <iommu@lists.linux-foundation.org>
Reply-To: Shawn Anastasio <shawn@anastas.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 8/5/19 10:01 AM, Christoph Hellwig wrote:
> diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
> index 3813211a9aad..9ae5cee543c4 100644
> --- a/include/linux/dma-noncoherent.h
> +++ b/include/linux/dma-noncoherent.h
> @@ -42,13 +42,8 @@ void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
>   		dma_addr_t dma_addr, unsigned long attrs);
>   long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
>   		dma_addr_t dma_addr);
> -
> -#ifdef CONFIG_ARCH_HAS_DMA_MMAP_PGPROT
>   pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
>   		unsigned long attrs);
> -#else
> -# define arch_dma_mmap_pgprot(dev, prot, attrs)	pgprot_noncached(prot)
> -#endif

Nit, but maybe the prototype should still be ifdef'd here? It at least
could prevent a reader from incorrectly thinking that the function is
always present.

Also, like Will mentioned earlier, the function name isn't entirely
accurate anymore. I second the suggestion of using something like
arch_dma_noncoherent_pgprot(). As for your idea of defining
pgprot_dmacoherent for all architectures as

#ifndef pgprot_dmacoherent
#define pgprot_dmacoherent pgprot_noncached
#endif

I think that the name here is kind of misleading too, since this
definition will only be used when there is no support for proper
DMA coherency.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
