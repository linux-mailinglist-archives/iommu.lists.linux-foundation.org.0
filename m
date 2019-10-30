Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCCEA5A3
	for <lists.iommu@lfdr.de>; Wed, 30 Oct 2019 22:41:51 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A66ACF15;
	Wed, 30 Oct 2019 21:41:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3474F01
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 21:41:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A1E58A0
	for <iommu@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 21:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RjClCXbIwBQLkxNlWfstc40OfJNOOeU+sDESejAVB2Q=;
	b=uEYvzQ1nc3dk6wMfF5V6miAgo
	Dkirmio0pEoS9DinmkrCztgl5Na8Evqct0LleL21apd0iabo4P9B3KbbmMDP3o/xndED4gtxctkvs
	28Qj52OIYqR/Dh4hmObviIYooPZdmPIvquPzWtQU7QFJddYbJDVJSY2MqoexYALVqErggcziqLXWA
	iHtvXIhX/PD9qmfE+LLqlCrPwSLChbAaoGX+J0gYQh8Rp4baHCraZcGfUgxcTrW+eldc/s5iia8Oi
	Je/Gw3aK7RPlhAfWgf1Zmc/Ao1Ya32dA6O7bBrWud74vKKjb7fjN4PEnfNeeZXizDojP6GoCpgCAu
	gO+r5sQ4w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iPvim-00020g-Ao; Wed, 30 Oct 2019 21:41:40 +0000
Date: Wed, 30 Oct 2019 14:41:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 1/2] dma-direct: check for overflows on 32 bit DMA
	addresses
Message-ID: <20191030214140.GB25515@infradead.org>
References: <20191018110044.22062-1-nsaenzjulienne@suse.de>
	<20191018110044.22062-2-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018110044.22062-2-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: rubini@gnudd.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, helgaas@kernel.org,
	Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Fri, Oct 18, 2019 at 01:00:43PM +0200, Nicolas Saenz Julienne wrote:
> +#ifndef CONFIG_ARCH_DMA_ADDR_T_64BIT
> +	/* Check if DMA address overflowed */
> +	if (min(addr, addr + size - 1) <
> +		__phys_to_dma(dev, (phys_addr_t)(min_low_pfn << PAGE_SHIFT)))
> +		return false;
> +#endif

Would be nice to use IS_ENABLED and PFN_PHYS here, and I also think we
need to use phys_to_dma to take care of the encryption bit.  If you then
also introduce an end variable we can make the whole thing actually look
nice:

static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
{
	dma_addr_t end = addr + size - 1;

        if (!dev->dma_mask)
                return false;

	if (!IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
	    min(addr, end) < phys_to_dma(dev, PFN_PHYS(min_low_pfn)))
		return false;

        return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
}

Otherwise this looks sensible to me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
