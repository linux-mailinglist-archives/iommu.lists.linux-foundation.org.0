Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC2CC895
	for <lists.iommu@lfdr.de>; Sat,  5 Oct 2019 09:26:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7420A40B;
	Sat,  5 Oct 2019 07:26:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C9CB940B
	for <iommu@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 07:26:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 67D175E4
	for <iommu@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 07:26:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 69EF120830;
	Sat,  5 Oct 2019 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570260381;
	bh=xFrXVj45JYqwx14emMFIPwY8ZuiE+j2pGgmNe8jT3vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htZNkApCedGQroo8d6Fz6NZ17pKIL5w52kCPF98KRNd3LBUeP4ewyKCqBya09yPc8
	rpXlwcINKSgJY87L/3GiNqdVcIsmj2iuryXkw53Exrqk0rK3GBqpZQdTUSjIAzpK7E
	Mho1CPRlJ4eTErIoDFtt9E5zWoE/LSDwCnYVtNio=
Date: Sat, 5 Oct 2019 09:26:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] dma-mapping: Move vmap address checks into
	dma_map_single()
Message-ID: <20191005072618.GA930906@kroah.com>
References: <201910041420.F6E55D29A@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201910041420.F6E55D29A@keescook>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Semmle Security Reports <security-reports@semmle.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org, Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Allison Randal <allison@lohutok.net>
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

On Fri, Oct 04, 2019 at 02:28:16PM -0700, Kees Cook wrote:
> As we've seen from USB and other areas, we need to always do runtime
> checks for DMA operating on memory regions that might be remapped. This
> moves the existing checks from USB into dma_map_single(), but leaves
> the slightly heavier checks as they are.
> 
> Suggested-by: Laura Abbott <labbott@redhat.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: Only add is_vmalloc_addr()
> v1: https://lore.kernel.org/lkml/201910021341.7819A660@keescook
> ---
>  drivers/usb/core/hcd.c      | 8 +-------
>  include/linux/dma-mapping.h | 7 +++++++
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index f225eaa98ff8..281568d464f9 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1410,10 +1410,7 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  		if (hcd->self.uses_pio_for_control)
>  			return ret;
>  		if (hcd_uses_dma(hcd)) {
> -			if (is_vmalloc_addr(urb->setup_packet)) {
> -				WARN_ONCE(1, "setup packet is not dma capable\n");
> -				return -EAGAIN;
> -			} else if (object_is_on_stack(urb->setup_packet)) {
> +			if (object_is_on_stack(urb->setup_packet)) {
>  				WARN_ONCE(1, "setup packet is on stack\n");
>  				return -EAGAIN;
>  			}
> @@ -1479,9 +1476,6 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
>  					ret = -EAGAIN;
>  				else
>  					urb->transfer_flags |= URB_DMA_MAP_PAGE;
> -			} else if (is_vmalloc_addr(urb->transfer_buffer)) {
> -				WARN_ONCE(1, "transfer buffer not dma capable\n");
> -				ret = -EAGAIN;
>  			} else if (object_is_on_stack(urb->transfer_buffer)) {
>  				WARN_ONCE(1, "transfer buffer is on stack\n");
>  				ret = -EAGAIN;
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 4a1c4fca475a..12dbd07f74f2 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -583,6 +583,13 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
>  static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs)
>  {
> +	/* DMA must never operate on areas that might be remapped. */
> +	if (WARN_ONCE(is_vmalloc_addr(ptr),
> +		      "%s %s: driver maps %lu bytes from vmalloc area\n",
> +		      dev ? dev_driver_string(dev) : "unknown driver",
> +		      dev ? dev_name(dev) : "unknown device", size))

If you use dev_warn() here you get all of that "unknown driver/device"
checking and handling set properly.  And it's in the "standard" format
that userspace tools know how to check.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
