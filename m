Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E92078F2
	for <lists.iommu@lfdr.de>; Wed, 24 Jun 2020 18:20:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EA10187742;
	Wed, 24 Jun 2020 16:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wxy-RCO+2tig; Wed, 24 Jun 2020 16:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1502587758;
	Wed, 24 Jun 2020 16:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF33BC016F;
	Wed, 24 Jun 2020 16:20:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C927EC016F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 16:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B40C587742
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 16:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfvZZA3OE64J for <iommu@lists.linux-foundation.org>;
 Wed, 24 Jun 2020 16:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB8B087750
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 16:20:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f2so1236465plr.8
 for <iommu@lists.linux-foundation.org>; Wed, 24 Jun 2020 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wYBvUfi2A+ioRIdIU5MH+/mg58TfJOgAJmMFcgk5hp0=;
 b=eRKzCEB2rU6Cuma3uKKecAKmdD5CrUoDIMByA1ykI0K2Rb3+ZdEtXH+WxbLSK08db2
 OWGIDVKzncS4rqKyhOtVUldl7SuNjy5CBuRtLqdiQznaKrshDS5AiPcGugPUadvCKxNc
 HtyAVydJb0LMV4Vz2ZYJEfwRH+RDSsZVyq6bTpEvjvObH+8BAKLY9ATh6bChhOyycYue
 cRSiVbfRmJR1Qw0DsqHvV2P7Yl0wJMb31epmZexrqXLOAmBj63DpCYfvR9TjRXyjucHl
 DKztLwYjlBgixAvo3YB0t0Yq9Vs+o8H0u58ypN1R02dUM+B3XiEWA/JXjmER8ltPceBm
 uJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=wYBvUfi2A+ioRIdIU5MH+/mg58TfJOgAJmMFcgk5hp0=;
 b=LrxrKEvhTpDScqjhp4jMTsvpMhblTDj4opsTUMCpe+9lGNx2TD7JiBAYGlhGCaXdSM
 29YmMVpcnbmuq47JOKhzFjsm5Wcv67U44FlED37TA4IyOe9fbZJZcRbZI8uGpNqzsAi3
 24wKK3L+BD1mQe38vGtOI932Sw8QJTDagbHMBLowS6Kbz0v1oZvxAT+gs4JHzSlEip2+
 +fvDW005+7Eb7Iy/gPkMzrFDvsZXbkF/kSefzyjjZzOFJshrD0I+9xDEexQUFqetIPoF
 SjS5AvoCfGWtyjD3ZPAePa5fwxdeLSq6/1UIqr8ilUfAADxogK10ZC5qEecV3lnHQENw
 iLeA==
X-Gm-Message-State: AOAM530z+TuEY5OU/wR/PX7QqNJ3UiQqa3XNkr7p92Xv8n9HTbqrWV1W
 pxQZ2IqIjuGRCiIuDvH4hOc=
X-Google-Smtp-Source: ABdhPJwtWbxHDZMZnThJDNH2knyPkYVioW+IORCS4FHACy4BZg7jbFn82M7itshG5xTU7om/ViF2Pg==
X-Received: by 2002:a17:90a:e08f:: with SMTP id
 q15mr31074376pjy.178.1593015652518; 
 Wed, 24 Jun 2020 09:20:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 7sm7283263pgh.80.2020.06.24.09.20.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jun 2020 09:20:51 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:20:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] dma-pool: Fix too large DMA pools on medium systems
Message-ID: <20200624162050.GA214193@roeck-us.net>
References: <20200608132217.29945-1-geert@linux-m68k.org>
 <20200620200936.GA106151@roeck-us.net>
 <20200624073815.GE18609@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624073815.GE18609@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 David Rientjes <rientjes@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Robin Murphy <robin.murphy@arm.com>
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

On Wed, Jun 24, 2020 at 09:38:15AM +0200, Christoph Hellwig wrote:
> Hi Guenter,
> 
> can you try the patch below?  This just converts the huge allocations
> in mptbase to use GFP_KERNEL.  Christophe (added to Cc) actually has
> a scripted conversion for the rest that he hasn't posted yet, so I'll
> aim for the minimal version here.
> 

The previously failing test passes with this patch applied on top of the
mainline kernel.

Guenter

> 
> diff --git a/drivers/message/fusion/mptbase.c b/drivers/message/fusion/mptbase.c
> index 68aea22f2b8978..5216487db4fbea 100644
> --- a/drivers/message/fusion/mptbase.c
> +++ b/drivers/message/fusion/mptbase.c
> @@ -1324,13 +1324,13 @@ mpt_host_page_alloc(MPT_ADAPTER *ioc, pIOCInit_t ioc_init)
>  			return 0; /* fw doesn't need any host buffers */
>  
>  		/* spin till we get enough memory */
> -		while(host_page_buffer_sz > 0) {
> -
> -			if((ioc->HostPageBuffer = pci_alloc_consistent(
> -			    ioc->pcidev,
> -			    host_page_buffer_sz,
> -			    &ioc->HostPageBuffer_dma)) != NULL) {
> -
> +		while (host_page_buffer_sz > 0) {
> +			ioc->HostPageBuffer =
> +				dma_alloc_coherent(&ioc->pcidev->dev,
> +						host_page_buffer_sz,
> +						&ioc->HostPageBuffer_dma,
> +						GFP_KERNEL);
> +			if (ioc->HostPageBuffer) {
>  				dinitprintk(ioc, printk(MYIOC_s_DEBUG_FMT
>  				    "host_page_buffer @ %p, dma @ %x, sz=%d bytes\n",
>  				    ioc->name, ioc->HostPageBuffer,
> @@ -2741,8 +2741,8 @@ mpt_adapter_disable(MPT_ADAPTER *ioc)
>  		sz = ioc->alloc_sz;
>  		dexitprintk(ioc, printk(MYIOC_s_INFO_FMT "free  @ %p, sz=%d bytes\n",
>  		    ioc->name, ioc->alloc, ioc->alloc_sz));
> -		pci_free_consistent(ioc->pcidev, sz,
> -				ioc->alloc, ioc->alloc_dma);
> +		dma_free_coherent(&ioc->pcidev->dev, sz, ioc->alloc,
> +				ioc->alloc_dma);
>  		ioc->reply_frames = NULL;
>  		ioc->req_frames = NULL;
>  		ioc->alloc = NULL;
> @@ -2751,8 +2751,8 @@ mpt_adapter_disable(MPT_ADAPTER *ioc)
>  
>  	if (ioc->sense_buf_pool != NULL) {
>  		sz = (ioc->req_depth * MPT_SENSE_BUFFER_ALLOC);
> -		pci_free_consistent(ioc->pcidev, sz,
> -				ioc->sense_buf_pool, ioc->sense_buf_pool_dma);
> +		dma_free_coherent(&ioc->pcidev->dev, sz, ioc->sense_buf_pool,
> +				ioc->sense_buf_pool_dma);
>  		ioc->sense_buf_pool = NULL;
>  		ioc->alloc_total -= sz;
>  	}
> @@ -2802,7 +2802,7 @@ mpt_adapter_disable(MPT_ADAPTER *ioc)
>  			"HostPageBuffer free  @ %p, sz=%d bytes\n",
>  			ioc->name, ioc->HostPageBuffer,
>  			ioc->HostPageBuffer_sz));
> -		pci_free_consistent(ioc->pcidev, ioc->HostPageBuffer_sz,
> +		dma_free_coherent(&ioc->pcidev->dev, ioc->HostPageBuffer_sz,
>  		    ioc->HostPageBuffer, ioc->HostPageBuffer_dma);
>  		ioc->HostPageBuffer = NULL;
>  		ioc->HostPageBuffer_sz = 0;
> @@ -4497,7 +4497,8 @@ PrimeIocFifos(MPT_ADAPTER *ioc)
>  			 	ioc->name, sz, sz, num_chain));
>  
>  		total_size += sz;
> -		mem = pci_alloc_consistent(ioc->pcidev, total_size, &alloc_dma);
> +		mem = dma_alloc_coherent(&ioc->pcidev->dev, total_size,
> +				&alloc_dma, GFP_KERNEL);
>  		if (mem == NULL) {
>  			printk(MYIOC_s_ERR_FMT "Unable to allocate Reply, Request, Chain Buffers!\n",
>  				ioc->name);
> @@ -4574,8 +4575,8 @@ PrimeIocFifos(MPT_ADAPTER *ioc)
>  		spin_unlock_irqrestore(&ioc->FreeQlock, flags);
>  
>  		sz = (ioc->req_depth * MPT_SENSE_BUFFER_ALLOC);
> -		ioc->sense_buf_pool =
> -			pci_alloc_consistent(ioc->pcidev, sz, &ioc->sense_buf_pool_dma);
> +		ioc->sense_buf_pool = dma_alloc_coherent(&ioc->pcidev->dev, sz,
> +				&ioc->sense_buf_pool_dma, GFP_KERNEL);
>  		if (ioc->sense_buf_pool == NULL) {
>  			printk(MYIOC_s_ERR_FMT "Unable to allocate Sense Buffers!\n",
>  				ioc->name);
> @@ -4613,18 +4614,16 @@ PrimeIocFifos(MPT_ADAPTER *ioc)
>  
>  	if (ioc->alloc != NULL) {
>  		sz = ioc->alloc_sz;
> -		pci_free_consistent(ioc->pcidev,
> -				sz,
> -				ioc->alloc, ioc->alloc_dma);
> +		dma_free_coherent(&ioc->pcidev->dev, sz, ioc->alloc,
> +				ioc->alloc_dma);
>  		ioc->reply_frames = NULL;
>  		ioc->req_frames = NULL;
>  		ioc->alloc_total -= sz;
>  	}
>  	if (ioc->sense_buf_pool != NULL) {
>  		sz = (ioc->req_depth * MPT_SENSE_BUFFER_ALLOC);
> -		pci_free_consistent(ioc->pcidev,
> -				sz,
> -				ioc->sense_buf_pool, ioc->sense_buf_pool_dma);
> +		dma_free_coherent(&ioc->pcidev->dev, sz, ioc->sense_buf_pool,
> +				ioc->sense_buf_pool_dma);
>  		ioc->sense_buf_pool = NULL;
>  	}
>  
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
