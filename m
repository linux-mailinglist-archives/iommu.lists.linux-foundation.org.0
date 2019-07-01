Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA43392D8
	for <lists.iommu@lfdr.de>; Fri,  7 Jun 2019 19:11:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A5871463;
	Fri,  7 Jun 2019 17:11:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D69E1379
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 17:10:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1861786E
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 17:10:50 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7693C2CD;
	Fri,  7 Jun 2019 17:10:49 +0000 (UTC)
Date: Fri, 7 Jun 2019 11:10:48 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] Documentation: DMA-API: fix a function name of
	max_mapping_size
Message-ID: <20190607111048.7a492feb@lwn.net>
In-Reply-To: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
	linux-doc@vger.kernel.org, hch@lst.de
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

On Fri,  7 Jun 2019 16:47:13 +0900
Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:

> The exported function name is dma_max_mapping_size(), not
> dma_direct_max_mapping_size() so that this patch fixes
> the function name in the documentation.
> 
> Fixes: 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/DMA-API.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
> index 0076150..e47c63b 100644
> --- a/Documentation/DMA-API.txt
> +++ b/Documentation/DMA-API.txt
> @@ -198,7 +198,7 @@ call to set the mask to the value returned.
>  ::
>  
>  	size_t
> -	dma_direct_max_mapping_size(struct device *dev);
> +	dma_max_mapping_size(struct device *dev);
>  
>  Returns the maximum size of a mapping for the device. The size parameter
>  of the mapping functions like dma_map_single(), dma_map_page() and

Applied, thanks.

jon
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
