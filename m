Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F875BB64
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 14:22:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C288A39A2;
	Mon,  1 Jul 2019 12:22:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 994071161
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 12:22:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2BE85832
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 12:22:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 82844229; Mon,  1 Jul 2019 14:22:00 +0200 (CEST)
Date: Mon, 1 Jul 2019 14:21:59 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] iommu/dma: Fix calculation overflow in __finalise_sg()
Message-ID: <20190701122158.GE8166@8bytes.org>
References: <20190622043814.5003-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190622043814.5003-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	linux-kernel@vger.kernel.org
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

On Fri, Jun 21, 2019 at 09:38:14PM -0700, Nicolin Chen wrote:
> The max_len is a u32 type variable so the calculation on the
> left hand of the last if-condition will potentially overflow
> when a cur_len gets closer to UINT_MAX -- note that there're
> drivers setting max_seg_size to UINT_MAX:
>   drivers/dma/dw-edma/dw-edma-core.c:745:
>     dma_set_max_seg_size(dma->dev, U32_MAX);
>   drivers/dma/dma-axi-dmac.c:871:
>     dma_set_max_seg_size(&pdev->dev, UINT_MAX);
>   drivers/mmc/host/renesas_sdhi_internal_dmac.c:338:
>     dma_set_max_seg_size(dev, 0xffffffff);
>   drivers/nvme/host/pci.c:2520:
>     dma_set_max_seg_size(dev->dev, 0xffffffff);
> 
> So this patch just casts the cur_len in the calculation to a
> size_t type to fix the overflow issue, as it's not necessary
> to change the type of cur_len after all.
> 
> Fixes: 809eac54cdd6 ("iommu/dma: Implement scatterlist segment merging")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Looks good to me, but I let Robin take a look too before I apply it,
Robin?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
